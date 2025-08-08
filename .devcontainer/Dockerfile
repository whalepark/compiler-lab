ARG FLAVOR=base
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    clang llvm llvm-dev lldb lld \
    cmake ninja-build build-essential git pkg-config \
    python3 python3-pip python3-venv \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /work

COPY tools/install_mlir.sh /tmp/install_mlir.sh
COPY tools/install_tvm.sh  /tmp/install_tvm.sh

# choose flavor in build time e.g. docker build --build-arg FLAVOR=mlir .
RUN if [ "$FLAVOR" = "mlir" ]; then bash /tmp/install_mlir.sh; fi
RUN if [ "$FLAVOR" = "tvm"  ]; then bash /tmp/install_tvm.sh;  fi
