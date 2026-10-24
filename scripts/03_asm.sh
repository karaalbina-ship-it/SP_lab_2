#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/common.sh"
out="$RESULTS/asm"; mkdir -p "$out"

(cd "$ROOT" && make -s asm vecreport)
cp "$BUILD"/vec_*.txt "$out/"

printf '%-12s %6s %6s %6s %6s %8s %8s %8s %8s\n' \
    збірка інстр xmm ymm zmm "байт.op" "k-маски" "розгалуж" "movzx" | tee "$out/summary.txt"
for b in "${BUILDS[@]}"; do
    f="$out/${b}_step.asm"

    for fn in step neighbors rule; do
        objdump -d -M intel --no-show-raw-insn --disassemble="$fn" "$BUILD/$b" \
            | sed -n '/^[0-9a-f]* <'"$fn"'>:/,/^$/p'
    done > "$f"
    body=$(grep -E '^\s+[0-9a-f]+:' "$f" || true)
    cnt() { grep -c -E "$1" <<< "$body" || true; }
    printf '%-12s %6s %6s %6s %6s %8s %8s %8s %8s\n' "$b" \
        "$(wc -l <<< "$body")" "$(cnt 'xmm')" "$(cnt 'ymm')" "$(cnt 'zmm')" \
        "$(cnt '\s[v]?p(add|sub|cmpeq|and|or|xor|andn)b?\s|vpternlog|vpcmpu?b')" "$(cnt '\{k[1-7]\}|\sk[1-7],|kmov|kortest')" \
        "$(cnt '\sj(e|ne|l|le|g|ge|a|ae|b|be|s|ns)\s')" "$(cnt 'movzx')" \
        | tee -a "$out/summary.txt"
done

outer=$(grep -n 'for (int i = 1; i <= n; i++) {' "$ROOT/src/life.c" | head -n1 | cut -d: -f1)
inner=$(grep -n 'for (int j = 1; j <= n; j++)' "$ROOT/src/life.c" | head -n1 | cut -d: -f1)
echo
echo "Векторизатор GCC про цикли step (рядки $outer і $inner у src/life.c):"
for v in O3 native; do
    echo "-- $v:"
    grep -E "life.c:($outer|$inner):[0-9]+: (optimized|missed): (loop vectorized|couldn.t vectorize)" "$out/vec_$v.txt" | sort -u
done
echo "Готово: $out/"
