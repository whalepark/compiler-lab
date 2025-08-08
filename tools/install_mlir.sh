#!/usr/bin/env bash
set -euo pipefail
echo "[install_mlir] This is a *heavy* build. Expect 30–60 minutes on first run."
echo "[install_mlir] You can run this inside the Dev Container, or bake it into the image via FLAVOR=mlir."

apt-get update && apt-get install -y git cmake ninja-build python3 python3-pip \
    libzstd-dev libsqlite3-dev libxml2-dev

LLVM_TAG=llvmorg-19.1.0

cd /opt
if [ ! -d llvm-project ]; then
  git clone https://github.com/llvm/llvm-project.git --depth 1 --branch "$LLVM_TAG"
fi

mkdir -p /opt/llvm-project/build
cd /opt/llvm-project/build

cmake -G Ninja ../llvm \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_ENABLE_PROJECTS="mlir;clang" \
  -DLLVM_ENABLE_RTTI=ON \
  -DLLVM_BUILD_LLVM_DYLIB=ON \
  -DLLVM_INSTALL_UTILS=ON \
  -DLLVM_TARGETS_TO_BUILD="X86;AArch64"

ninja
ninja install

echo "[install_mlir] Installed to default prefix (/usr/local)."
echo "[install_mlir] Set LLVM_DIR=$(llvm-config --cmakedir) and MLIR_DIR to the installed cmake dirs as needed."
