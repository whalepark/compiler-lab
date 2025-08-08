#!/usr/bin/env bash
set -euo pipefail
echo "[install_tvm] Setting up a minimal TVM dev environment."

apt-get update && apt-get install -y git build-essential cmake libtinfo-dev zlib1g-dev \
    libedit-dev libxml2-dev python3 python3-pip python3-venv

# Python venv (optional but recommended)
if [ ! -d /opt/venv ]; then
  python3 -m venv /opt/venv
fi
. /opt/venv/bin/activate
pip install --upgrade pip wheel setuptools
pip install numpy decorator typing_extensions attrs

cd /opt
if [ ! -d tvm ]; then
  git clone https://github.com/apache/tvm.git --depth 1
fi

mkdir -p /opt/tvm/build
cd /opt/tvm/build
cp ../cmake/config.cmake .
echo 'set(USE_LLVM "ON")' >> config.cmake
cmake ..
cmake --build . -j$(nproc)

cd /opt/tvm/python
pip install -e .

echo "[install_tvm] Done. Activate venv with: . /opt/venv/bin/activate"
