#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/common.sh"
name=${1:?збірка}; secs=${2:?секунд}; shift 2
[ $# -gt 0 ] && PROG_ARGS=("$@")

runs=0
cpu=0
start=$(date +%s.%N)
deadline=$(( $(date +%s) + secs ))
while [ "$(date +%s)" -lt "$deadline" ]; do
    line=$("$BUILD/$name" "${PROG_ARGS[@]}" | grep '^RESULT')
    cpu=$(awk -v acc="$cpu" -v l="$line" \
        'BEGIN { match(l, /cpu_s=[0-9.]+/); print acc + substr(l, RSTART + 6, RLENGTH - 6) }')
    runs=$((runs + 1))
done
stop=$(date +%s.%N)
wall=$(awk -v a="$start" -v b="$stop" 'BEGIN { printf "%.3f", b - a }')
echo "LOAD build=$name runs=$runs wall_s=$wall cpu_s=$cpu n=${PROG_ARGS[0]} nruns=${PROG_ARGS[1]}"
