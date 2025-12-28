cmake_minimum_required(VERSION 3.28.3)

project(
    smart-lights-unit-tests
    DESCRIPTION "Host unit tests for the core logic"
    LANGUAGES CXX
    )

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ---------------------------------------------
# Paths (adapted to your repo layout)
# ---------------------------------------------
set(REPO_ROOT ${CMAKE_CURRENT_LIST_DIR}/../../..)

set(CPPUTEST_DIR ${REPO_ROOT}/components/core/cpputest/cpputest)

# ---------------------------------------------
# Build CppUTest for host (static libs)
# ---------------------------------------------
file(GLOB CPPUTEST_CORE ${CPPUTEST_DIR}/src/CppUTest/*.cpp)
file(GLOB CPPUTEST_EXT ${CPPUTEST_DIR}/src/CppUTestExt/*.cpp)

file(GLOB CPPUTEST_PLATFORM ${CPPUTEST_DIR}/src/Platforms/Gcc/*.cpp)

add_library(CppUTest STATIC ${CPPUTEST_CORE} ${CPPUTEST_PLATFORM})
target_include_directories(CppUTest PUBLIC ${CPPUTEST_DIR}/include)

add_library(CppUTestExt STATIC ${CPPUTEST_EXT})
target_include_directories(CppUTestExt PUBLIC ${CPPUTEST_DIR}/include)
target_link_libraries(CppUTestExt PUBLIC CppUTest)

# Shared source list for the code under test

# ---------------------------------------------
# Build the library under test for host
# ---------------------------------------------

# ---------------------------------------------
# Unit test executable
# ---------------------------------------------
set(CPPUTEST_RUNNER ${CPPUTEST_DIR}/src/CppUTest/CommandLineTestRunner.cpp)
add_executable(
    unit_tests 
    ${CMAKE_CURRENT_LIST_DIR}/test_main.cpp 
    ${CMAKE_CURRENT_LIST_DIR}/test_dummy.cpp 
    )

find_package(Threads REQUIRED)

target_link_libraries(unit_tests PRIVATE
    CppUTest
    CppUTestExt
)

# ---------------------------------------------
# CTest integration
# ---------------------------------------------
enable_testing()
add_test(NAME unit_tests COMMAND unit_tests)
