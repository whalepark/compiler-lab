cmake_minimum_required(VERSION 3.20)
project(mlir_toy_dialect CXX)
set(CMAKE_CXX_STANDARD 17)

# Try to find an installed MLIR. If not found, still build a stub.
find_package(MLIR CONFIG)

add_executable(mlir_toy src/main.cpp)

if(MLIR_FOUND)
  message(STATUS "Found MLIR at ${MLIR_DIR}")
  target_include_directories(mlir_toy PRIVATE ${MLIR_INCLUDE_DIRS})
  target_compile_definitions(mlir_toy PRIVATE MLIR_ENABLED=1)
  # If you start using MLIR libs, uncomment and adjust the libraries:
  # target_link_libraries(mlir_toy PRIVATE MLIRIR MLIRSupport)
else()
  message(WARNING "MLIR not found; building a stub. See tools/install_mlir.sh to set it up.")
endif()
