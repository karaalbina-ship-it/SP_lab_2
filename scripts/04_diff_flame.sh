#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/common.sh"
before=${1:-life_O0}
after=${2:-life_native}
out="$RESULTS/diff"; mkdir -p "$out"
a="$RESULTS/$before/$before.folded"
b="$RESULTS/$after/$after.folded"

run "$FG/difffolded.pl" -n "$a" "$b" > "$out/diff.folded"

run "$FG/flamegraph.pl" --title "Differential FlameGraph: $before -> $after (shape = $after)" \
    "$out/diff.folded" > "$out/diff_${before}_to_${after}.svg"

"$FG/difffolded.pl" -n "$b" "$a" \
    | "$FG/flamegraph.pl" --negate --title "Differential FlameGraph: what disappeared from $before" \
    > "$out/diff_${before}_negated.svg"
echo "Готово: $out/"
