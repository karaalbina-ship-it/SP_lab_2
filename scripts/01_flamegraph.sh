#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/common.sh"
name=${1:?вкажіть збірку, напр. life_O0}; shift
[ $# -gt 0 ] && PROG_ARGS=("$@")
tag=${TAG:-}
out="$RESULTS/$name"; mkdir -p "$out"
data="$WORK/$name$tag.flame.data"

run perf record -F "$(freq_for "$name")" $CALLGRAPH -o "$data" -- "$BUILD/$name" "${PROG_ARGS[@]}" \
    > "$out/program_output$tag.txt"

run perf script -i "$data" > "$WORK/$name$tag.perf.script"

run "$FG/stackcollapse-perf.pl" "$WORK/$name$tag.perf.script" > "$out/$name$tag.folded"

run "$FG/flamegraph.pl" --title "CPU FlameGraph: $name (${PROG_ARGS[*]}) $CALLGRAPH" \
    --countname cycles "$out/$name$tag.folded" > "$out/flame$tag.svg"

echo
echo "Найширші вежі (самостійний час функцій, % часу CPU):"
awk '{n=split($1,f,";"); self[f[n]]+=$2; total+=$2}
     END {for (s in self) printf "%6.2f%%  %s\n", 100*self[s]/total, s}' "$out/$name$tag.folded" \
    | sort -rn | head -n 12 | tee "$out/flame_top$tag.txt"
echo "Готово: $out/flame$tag.svg"
