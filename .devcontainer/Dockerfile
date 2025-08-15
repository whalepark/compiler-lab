ARG FLAVOR=base
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    clang-18 llvm-18 llvm-18-dev lldb-18 lld-18 \
    cmake ninja-build build-essential git pkg-config \
    python3 python3-pip python3-venv \
    libzstd-dev libcurl4-openssl-dev zlib1g-dev libtinfo-dev libxml2-dev \
  && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-18 100 \
 && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-18 100 \
 && update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-18 100

WORKDIR /work

COPY tools/install_mlir.sh /tmp/install_mlir.sh
COPY tools/install_tvm.sh  /tmp/install_tvm.sh

# choose flavor in build time e.g. docker build --build-arg FLAVOR=mlir .
RUN if [ "$FLAVOR" = "mlir" ]; then bash /tmp/install_mlir.sh; fi
RUN if [ "$FLAVOR" = "tvm"  ]; then bash /tmp/install_tvm.sh;  fi
