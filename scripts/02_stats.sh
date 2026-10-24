#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/common.sh"
name=${1:?вкажіть збірку, напр. life_O0}; shift
[ $# -gt 0 ] && PROG_ARGS=("$@")
out="$RESULTS/$name"; mkdir -p "$out"
prog=("$BUILD/$name" "${PROG_ARGS[@]}")
data="$WORK/$name.record.data"

run /usr/bin/time --verbose -o "$out/time.txt" "${prog[@]}" > "$out/program_output.txt"
cat "$out/time.txt"

run perf stat -d -r 5 -o "$out/perfstat.txt" -- "${prog[@]}" > /dev/null
cat "$out/perfstat.txt"

run perf record -F "$(freq_for "$name")" $CALLGRAPH -o "$data" -- "${prog[@]}" > /dev/null
run perf report -i "$data" --stdio --no-children --percent-limit 0.5 > "$out/perf-report.txt"
perf report -i "$data" --stdio --children --percent-limit 2 > "$out/perf-report-children.txt"
perf report -i "$data" --stdio --no-children --sort dso > "$out/perf-report-dso.txt"
perf report -i "$data" --stdio --no-children --sort symbol -g none --percent-limit 0.5 > "$out/perf-report-flat.txt"
perf annotate -i "$data" --stdio -M intel step > "$out/perf-annotate.txt" 2>/dev/null || true

echo
echo "== Плоский профіль (Self):"
grep -E '^\s+[0-9.]+%' "$out/perf-report-flat.txt" | head -n 15
echo
echo "== За бібліотеками (DSO):"
grep -E '^\s+[0-9.]+%' "$out/perf-report-dso.txt" | head -n 8
echo "Готово: $out/"
