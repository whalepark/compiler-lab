#include <iostream>
#ifdef MLIR_ENABLED
#include "mlir/IR/BuiltinOps.h"
#endif

int main() {
#ifdef MLIR_ENABLED
  std::cout << "MLIR available: headers included OK." << std::endl;
#else
  std::cout << "MLIR not found: running stub." << std::endl;
#endif
  return 0;
}
