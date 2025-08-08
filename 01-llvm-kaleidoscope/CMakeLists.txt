cmake_minimum_required(VERSION 3.20)
project(llvm_kaleidoscope CXX)
set(CMAKE_CXX_STANDARD 17)

find_package(LLVM REQUIRED CONFIG)
message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION} at ${LLVM_DIR}")

include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

llvm_map_components_to_libnames(LLVM_LIBS
  core orcjit native nativecodegen support)

add_executable(kaleidoscope src/main.cpp)
target_link_libraries(kaleidoscope PRIVATE ${LLVM_LIBS})
