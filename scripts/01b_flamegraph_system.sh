#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/common.sh"
name=${1:?вкажіть збірку, напр. life_O0}
secs=${2:-10}
out="$RESULTS/$name"; mkdir -p "$out"
data="$WORK/$name.system.data"

"$BUILD/$name" "${PROG_ARGS[@]}" > /dev/null &
prog=$!

run perf record -a -F 99 -g -o "$data" -- sleep "$secs"
kill "$prog" 2>/dev/null || true
wait "$prog" 2>/dev/null || true

run perf script -i "$data" > "$WORK/$name.system.script"
"$FG/stackcollapse-perf.pl" "$WORK/$name.system.script" > "$out/$name.system.folded"

run "$FG/flamegraph.pl" --title "System-wide FlameGraph (WSL2 VM) while running $name" \
    "$out/$name.system.folded" > "$out/flame_system.svg"

echo
echo "Частка семплів за процесами:"
awk '{split($1,f,";"); comm[f[1]]+=$2; total+=$2}
     END {for (c in comm) printf "%6.2f%%  %s\n", 100*comm[c]/total, c}' "$out/$name.system.folded" \
    | sort -rn | head -n 10 | tee "$out/flame_system_top.txt"
echo "Готово: $out/flame_system.svg"
