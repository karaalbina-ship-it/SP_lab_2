#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/common.sh"
name=${1:-life_O0}
PROG_ARGS=(${DEMO_ARGS:-1024 200})
d="$WORK/demo"; mkdir -p "$d"
step() { printf '\n\033[1;33m== %s\033[0m' "$1"; read -r -p "  [Enter]" _; }

step "Крок 0. Програма без профілювання"
run "$BUILD/$name" "${PROG_ARGS[@]}"

step "Крок 1. perf record: $(freq_for "$name") семплів/с із записом стеку викликів кожного семпла"
run perf record -F "$(freq_for "$name")" $CALLGRAPH -o "$d/perf.data" -- "$BUILD/$name" "${PROG_ARGS[@]}" > /dev/null

step "Крок 2. perf script: текстова траса, кожен семпл = процес, час, стек (знизу main)"
run perf script -i "$d/perf.data" > "$d/out.perf"
head -n 25 "$d/out.perf"

step "Крок 3. stackcollapse-perf.pl: однакові стеки згортаються в рядок 'f1;f2;f3 N'"
run "$FG/stackcollapse-perf.pl" "$d/out.perf" > "$d/out.folded"
sort -k2 -n -r -t' ' "$d/out.folded" | head -n 8

step "Крок 4. flamegraph.pl: малюємо SVG"
run "$FG/flamegraph.pl" --title "Demo: $name" "$d/out.folded" > "$d/flame.svg"
cp "$d/flame.svg" "$RESULTS/demo_flame.svg"
echo "SVG: $RESULTS/demo_flame.svg"

step "Крок 5. Відкриваємо у браузері Windows (клік по прямокутнику = zoom, Ctrl+F = пошук)"
echo "Відкрийте у браузері Windows файл results/demo_flame.svg з теки проєкту (наприклад: start C:\lab\life\results\demo_flame.svg)"
