param(
    [string[]]$Builds = @('life_O0', 'life_native'),
    [int]$IdleSeconds = 60,
    [int]$LoadSeconds = 90,
    [int]$CooldownSeconds = 30,
    [int]$Repeats = 3,
    [string]$Container = 'bslab',
    [string]$ProgArgs = '1024 1500',
    [string]$Workdir = '/lab/life',
    [double]$TdpWatts = 45,
    [int]$Cores = 8,
    [switch]$DryRun
)
$ErrorActionPreference = 'Stop'

[Threading.Thread]::CurrentThread.CurrentCulture = [Globalization.CultureInfo]::InvariantCulture
$root = Split-Path -Parent $PSScriptRoot
$outDir = Join-Path $root 'results\energy'
New-Item -ItemType Directory -Force $outDir | Out-Null
$samples = New-Object System.Collections.Generic.List[object]

function Get-Battery {
    Get-CimInstance -Namespace root\wmi -ClassName BatteryStatus | Select-Object -First 1
}

function Get-CpuTicks {
    $h = @{}
    Get-CimInstance Win32_PerfRawData_PerfProc_Process -Filter "Name='vmmemWSL' OR Name='_Total' OR Name='Idle'" |
        ForEach-Object { $h[$_.Name] = [double]$_.PercentProcessorTime }
    $h
}

function Measure-Phase([string]$phase, [string]$build, [int]$rep, [scriptblock]$done) {
    $sw = [Diagnostics.Stopwatch]::StartNew()
    $b0 = Get-Battery
    $c0 = Get-CpuTicks
    $rates = New-Object System.Collections.Generic.List[double]
    $changes = 0
    $prev = -1
    do {
        $b = Get-Battery
        $samples.Add([pscustomobject]@{
            time = (Get-Date).ToString('HH:mm:ss.fff'); t_s = [math]::Round($sw.Elapsed.TotalSeconds, 2)
            phase = $phase; build = $build; rep = $rep
            discharge_mW = $b.DischargeRate; remaining_mWh = $b.RemainingCapacity; on_ac = $b.PowerOnline
        })
        $rates.Add([double]$b.DischargeRate)
        if ($b.DischargeRate -ne $prev) { $changes++; $prev = $b.DischargeRate }
        Start-Sleep -Milliseconds 950
    } until (& $done $sw)
    $b1 = Get-Battery
    $c1 = Get-CpuTicks
    $busy = ($c1['_Total'] - $c0['_Total']) - ($c1['Idle'] - $c0['Idle'])
    $share = 0.0
    if ($busy -gt 0 -and $c0.ContainsKey('vmmemWSL')) { $share = ($c1['vmmemWSL'] - $c0['vmmemWSL']) / $busy }
    $secs = $sw.Elapsed.TotalSeconds
    [pscustomobject]@{
        seconds    = $secs
        mean_W     = ($rates | Measure-Object -Average).Average / 1000.0
        capacity_W = ($b0.RemainingCapacity - $b1.RemainingCapacity) * 3.6 / $secs
        updates    = $changes
        wsl_share  = $share
    }
}

$bat = Get-Battery
if (-not $bat) { throw 'Батарею не знайдено: цей метод працює лише на ноутбуці.' }
if ($bat.PowerOnline -and -not $DryRun) {
    throw 'Зарядку підключено: DischargeRate = 0. Від''єднайте зарядку і запустіть знову.'
}
Write-Host "Перевіряю контейнер $Container і збірки..."
& docker start $Container | Out-Null
if ($LASTEXITCODE -ne 0) { throw "Контейнер $Container не запускається (див. README)." }
foreach ($b in $Builds) {
    & docker exec -w $Workdir $Container test -x "build/$b"
    if ($LASTEXITCODE -ne 0) { throw "Немає build/$b (виконайте make у контейнері)." }
}
if (-not (Get-CpuTicks).ContainsKey('vmmemWSL')) { Write-Warning 'Процес vmmemWSL не знайдено: модель B буде нульовою.' }

$argv = $ProgArgs.Split(' ', [StringSplitOptions]::RemoveEmptyEntries)
$optsPerRun = [double]$argv[0] * [double]$argv[0] * [double]$argv[1]
$rows = New-Object System.Collections.Generic.List[object]

for ($rep = 1; $rep -le $Repeats; $rep++) {
    $order = $Builds
    if ($rep % 2 -eq 0) { $order = $Builds[($Builds.Count - 1)..0] }
    foreach ($build in $order) {
        Write-Host ("[{0}/{1}] {2}: простій {3} с" -f $rep, $Repeats, $build, $IdleSeconds)
        $idle = Measure-Phase 'idle' $build $rep { param($sw) $sw.Elapsed.TotalSeconds -ge $IdleSeconds }

        Write-Host ("[{0}/{1}] {2}: навантаження ~{3} с" -f $rep, $Repeats, $build, $LoadSeconds)
        $log = Join-Path $env:TEMP "bs_load_${build}_$rep.txt"
        $dockerArgs = @('exec', '-w', $Workdir, $Container, 'bash', 'scripts/load_loop.sh', $build, "$LoadSeconds") + $argv
        $proc = Start-Process -FilePath 'docker' -ArgumentList $dockerArgs -NoNewWindow -PassThru -RedirectStandardOutput $log
        $load = Measure-Phase 'load' $build $rep { param($sw) $proc.HasExited }

        $line = Get-Content $log | Where-Object { $_ -like 'LOAD *' } | Select-Object -Last 1
        if (-not $line) { throw "load_loop.sh не повернув рядок LOAD (див. $log)" }
        $kv = @{}
        foreach ($tok in $line.Split(' ')) { $p = $tok.Split('='); if ($p.Count -eq 2) { $kv[$p[0]] = $p[1] } }
        $runs = [int]$kv['runs']; $wall = [double]$kv['wall_s']; $cpu = [double]$kv['cpu_s']

        Write-Host ("[{0}/{1}] {2}: охолодження {3} с" -f $rep, $Repeats, $build, $CooldownSeconds)
        $null = Measure-Phase 'cooldown' $build $rep { param($sw) $sw.Elapsed.TotalSeconds -ge $CooldownSeconds }

        $dyn = $load.mean_W - $idle.mean_W
        $perM = 1e6 / $optsPerRun
        $rows.Add([pscustomobject]@{
            build = $build; rep = $rep; runs = $runs; wall_s = [math]::Round($wall, 2)
            cpu_s_per_run = [math]::Round($cpu / $runs, 3)
            P_idle_W = [math]::Round($idle.mean_W, 2); P_load_W = [math]::Round($load.mean_W, 2)
            P_load_capacity_W = [math]::Round($load.capacity_W, 2); P_dyn_W = [math]::Round($dyn, 2)
            discharge_updates = $load.updates; wsl_cpu_share = [math]::Round($load.wsl_share, 3)
            E_system_J_per_run = [math]::Round($load.mean_W * $wall / $runs, 2)
            E_A_J_per_run = [math]::Round($dyn * $wall / $runs, 2)
            E_B_J_per_run = [math]::Round($dyn * $load.wsl_share * $wall / $runs, 2)
            E_C_J_per_run = [math]::Round(($cpu / $runs) * $TdpWatts / $Cores, 2)
            E_system_J_per_Mcell = [math]::Round($load.mean_W * $wall / $runs * $perM, 4)
            E_A_J_per_Mcell = [math]::Round($dyn * $wall / $runs * $perM, 4)
        })
        $samples | Export-Csv (Join-Path $outDir 'samples.csv') -NoTypeInformation -Encoding UTF8
        $rows | Export-Csv (Join-Path $outDir 'summary.csv') -NoTypeInformation -Encoding UTF8
    }
}

Write-Host "`nПідсумок за повторами:"
$rows | Format-Table build, rep, runs, P_idle_W, P_load_W, P_dyn_W, E_system_J_per_run, E_A_J_per_run, E_B_J_per_run, E_C_J_per_run -AutoSize

Write-Host 'Середнє ± σ за збірками:'
$agg = foreach ($g in ($rows | Group-Object build)) {
    $o = [ordered]@{ build = $g.Name; repeats = $g.Count }
    foreach ($m in 'P_idle_W', 'P_load_W', 'E_system_J_per_run', 'E_A_J_per_run', 'E_B_J_per_run', 'E_C_J_per_run', 'E_system_J_per_Mcell') {
        $v = @($g.Group | ForEach-Object { [double]$_.$m })
        $mean = ($v | Measure-Object -Average).Average
        $sd = 0.0
        if ($v.Count -gt 1) { $sd = [math]::Sqrt((($v | ForEach-Object { ($_ - $mean) * ($_ - $mean) }) | Measure-Object -Sum).Sum / ($v.Count - 1)) }
        $o[$m] = [math]::Round($mean, 3)
        $o["${m}_sd"] = [math]::Round($sd, 3)
    }
    [pscustomobject]$o
}
$agg | Export-Csv (Join-Path $outDir 'aggregate.csv') -NoTypeInformation -Encoding UTF8
$agg | Format-List
Write-Host "Файли: $outDir"
