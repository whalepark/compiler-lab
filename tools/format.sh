#!/usr/bin/env bash
set -e
find . -type f \( -name '*.h' -o -name '*.hpp' -o -name '*.c' -o -name '*.cc' -o -name '*.cpp' \) -print0 | xargs -0 -r clang-format -i
echo "Formatted."
