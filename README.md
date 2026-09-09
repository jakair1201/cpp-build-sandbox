# cpp-build-sandbox

A personal scratch repo for sanity-checking that a C++ project builds cleanly
with **no warnings or errors** across the three compilers you're likely to
run into this semester:

- Clang / Clang++ (macOS default, and used in most course build scripts)
- GCC / G++ (Linux default, installable on macOS via Homebrew)
- MSVC (Windows, via Visual Studio)

The idea: drop each new semester project's `src/` and `CMakeLists.txt` in
here (or just copy this repo's structure into the real project), push, and
GitHub Actions builds it on Linux, macOS, and Windows in parallel. Any
warning becomes a build failure (`-Werror` / `/WX`), so you catch portability
issues before they become a grading surprise.

## Layout

```
cpp-build-sandbox/
├── README.md
├── CMakeLists.txt
├── build.sh
├── .gitignore
├── .github/
│   └── workflows/
│       └── build.yml      <- the CI matrix (Linux+GCC, macOS+Clang, Windows+MSVC)
└── src/
    └── main.cpp
```

## Build locally (macOS/Linux, Clang or GCC)

```bash
./build.sh
./build/cpp_build_sandbox
```

`build.sh` configures with CMake and compiles with warnings-as-errors on.
To force a specific compiler locally:

```bash
CXX=clang++ ./build.sh
CXX=g++-14 ./build.sh   # after `brew install gcc` on macOS; version number varies
```

## Build locally (Windows, MSVC)

```powershell
cmake -S . -B build
cmake --build build --config Release
```

## Continuous Integration

Every push and pull request triggers `.github/workflows/build.yml`, which
builds this project on:

| Runner          | Compiler   |
|------------------|------------|
| ubuntu-latest    | GCC (g++)  |
| macos-latest     | Clang      |
| windows-latest   | MSVC       |

Check the **Actions** tab on GitHub after pushing to see all three results.
A green check on all three means the project is warning-free and portable.
