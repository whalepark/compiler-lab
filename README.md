# compiler-lab

Monorepo for LLVM/MLIR/TVM/XLA experiments.

## Quick start (VS Code Dev Container)

1. Install Docker Desktop and the **Dev Containers** extension in VS Code.
2. Open this folder in VS Code and run: `Dev Containers: Reopen in Container`.
3. (Optional) to run x86_64 on Apple Silicon: add `--platform=linux/amd64` to `runArgs` in `devcontainer.json` (it might be slower).

### Build the LLVM example

```bash
cd 01-llvm-kaleidoscope
mkdir -p build && cd build
cmake -G Ninja -DLLVM_DIR=$(llvm-config --cmakedir) ..
ninja
./kaleidoscope
```
