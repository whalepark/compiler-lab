#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"
BIN="$ROOT/../build/kaleidoscope/kaleidoscope"
[[ -x "$BIN" ]] || { echo "[ERROR] Executable not found. Do ./build.sh"; exit 1; }
exec "$BIN"
