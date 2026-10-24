ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD="$ROOT/build"
RESULTS="$ROOT/results"
WORK="${WORK:-/tmp/lifelab}"
FG="${FG:-/opt/FlameGraph}"
FREQ="${FREQ:-}"

CALLGRAPH="${CALLGRAPH:---call-graph dwarf}"
read -r -a PROG_ARGS <<< "${PROG_ARGS:-1024 1500}"
BUILDS=(life_O0 life_O3 life_native)

freq_for() { case "$1" in *_O0) echo "${FREQ:-999}" ;; *) echo "${FREQ:-9999}" ;; esac; }

mkdir -p "$RESULTS" "$WORK"

run() {
    printf '\n\033[1;36m$ %s\033[0m\n' "$*" >&2
    "$@"
}
