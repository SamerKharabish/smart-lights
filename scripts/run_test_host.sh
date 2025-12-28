#!/usr/bin/env bash
set -euo pipefail

# Build and run unit tests for the host platform using CMake and CppUTest (WSL/Linux version)
# Builds into /tmp to avoid permission issues on /mnt/c

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="${REPO_ROOT}/test/unit/host"
BUILD_DIR="${BUILD_DIR:-/tmp/smart-lights-build-tests}"

usage() {
    cat << EOF
Usage: $(basename "$0") [--clean] [--configure] [--build] [--test] [--all]

Options:
  --clean       Clean the build directory
  --configure   Configure the CMake project
  --build       Build the unit tests
  --test        Run the unit tests
  --all         Perform all steps: clean, configure, build, and test
  -h, --help    Show this help message and exit

Environment variables:
    BUILD_DIR=/tmp/smart-lights-build-tests  (override to change build directory)
EOF
}

CLEAN=0
DO_CONFIGURE=0
DO_BUILD=0
DO_TEST=0

if [[ $# -eq 0 ]]; then
    DO_CONFIGURE=1
    DO_BUILD=1
    DO_TEST=1


fi

while [[ $# -gt 0 ]]; do
    case "$1" in
        --clean) CLEAN=1; shift ;;
        --configure) DO_CONFIGURE=1; shift ;;
        --build) DO_BUILD=1; shift ;;
        --test) DO_TEST=1; shift ;;
        --all) DO_CONFIGURE=1 DO_BUILD=1 DO_TEST=1; shift ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            usage
            exit 1
            ;;
    esac
done

need() {
    command -v "$1" >/dev/null 2>&1 || { echo "Missing dependency: $1"; exit 1; }
}

need cmake
need ctest

if [[ $CLEAN -eq 1 ]]; then
    echo "Cleaning build directory: $BUILD_DIR"
    rm -rf "$BUILD_DIR"
fi

if [[ $DO_CONFIGURE -eq 1 ]]; then
    if command -v ninja >/dev/null 2>&1; then
        GEN="-G Ninja"
    else
        GEN=""
    fi
    echo "Configuring CMake project..."
    cmake -S "$SRC_DIR" -B "$BUILD_DIR" $GEN
fi

if [[ $DO_BUILD -eq 1 ]]; then
    echo "Building unit tests..."
    cmake --build "$BUILD_DIR"
fi

if [[ $DO_TEST -eq 1 ]]; then
    echo "Running unit tests..."
    ctest --test-dir "$BUILD_DIR" --output-on-failure
fi

echo "Host unit tests done."