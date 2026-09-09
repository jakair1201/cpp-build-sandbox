#!/usr/bin/env bash
set -e

BUILD_DIR="build"

mkdir -p "$BUILD_DIR"

CXX_FLAG=()
if [ -n "$CXX" ]; then
    CXX_FLAG=(-DCMAKE_CXX_COMPILER="$CXX")
fi

cmake -S . -B "$BUILD_DIR" "${CXX_FLAG[@]}"
cmake --build "$BUILD_DIR"
