#!/usr/bin/env bash
set -euo pipefail

# Absolute path to this script's directory
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"
# Build output directory (relative to repo root)
BUILD_DIR="$ROOT/../build/kaleidoscope"

# Try to auto-detect LLVM_DIR using llvm-config
if command -v llvm-config >/dev/null 2>&1; then
  LLVM_DIR="$(llvm-config --cmakedir)"
elif [[ -n "${LLVM_DIR:-}" ]]; then
  echo "[WARN] llvm-config not found. Using LLVM_DIR from environment: $LLVM_DIR"
else
  echo "[ERROR] LLVM_DIR not found. Install llvm-config or set LLVM_DIR environment variable."
  echo "Example: export LLVM_DIR=/usr/lib/llvm-16/lib/cmake/llvm"
  exit 1
fi

# Build configuration (can be overridden via environment variable)
CMAKE_BUILD_TYPE="${CMAKE_BUILD_TYPE:-Release}"
GENERATOR="${GENERATOR:-Ninja}"

echo "[INFO] LLVM_DIR=$LLVM_DIR"
echo "[INFO] CMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE"
echo "[INFO] GENERATOR=$GENERATOR"

# Configure
cmake -S "$ROOT" -B "$BUILD_DIR" \
  -G "$GENERATOR" \
  -DLLVM_DIR="$LLVM_DIR" \
  -DCMAKE_BUILD_TYPE="$CMAKE_BUILD_TYPE"

# Build
cmake --build "$BUILD_DIR" -j

echo
echo "[OK] Binary built:"
ls -l "$BUILD_DIR/kaleidoscope" || true
echo "Run with: $BUILD_DIR/kaleidoscope"
