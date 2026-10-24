#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/common.sh"

if [ ! -f /.dockerenv ] && ! command -v perf > /dev/null; then
    export DEBIAN_FRONTEND=noninteractive
    run apt-get update
    run apt-get install -y build-essential linux-tools-generic linux-tools-common time git

    ln -sf "$(ls -d /usr/lib/linux-tools/*-generic/perf | sort -V | tail -n1)" /usr/local/bin/perf
    [ -d "$FG" ] || run git clone --depth 1 https://github.com/brendangregg/FlameGraph "$FG"
fi

mkdir -p "$RESULTS/env"
{
    echo "== uname -r";            uname -r
    echo "== gcc --version";       gcc --version | head -n1
    echo "== perf --version";      perf --version
    echo "== lscpu";               lscpu | grep -E 'Model name|^CPU\(s\)|Thread'
    echo "== AVX-розширення";      grep -o -w -E 'avx|avx2|fma|avx512[a-z_0-9]*' /proc/cpuinfo | sort -u | tr '\n' ' '; echo
    echo "== тест апаратних лічильників"
    perf stat -e cycles,instructions,cache-misses,branch-misses,task-clock true 2>&1
    echo "== тест енергії RAPL"
    perf list 2>/dev/null | grep -i -E 'power/|energy' || echo "події power/energy-* недоступні"
} | tee "$RESULTS/env/environment.txt"
