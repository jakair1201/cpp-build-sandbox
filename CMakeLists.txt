cmake_minimum_required(VERSION 3.20)
project(cpp_build_sandbox CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(cpp_build_sandbox src/main.cpp)

# Warnings-as-errors, tuned per compiler so the same CMakeLists.txt works
# on Clang, GCC, and MSVC without editing anything.
if (MSVC)
    target_compile_options(cpp_build_sandbox PRIVATE /W4 /WX)
else()
    target_compile_options(cpp_build_sandbox PRIVATE -Wall -Wextra -Wpedantic -Werror)
endif()
