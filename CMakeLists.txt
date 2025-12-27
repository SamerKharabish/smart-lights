cmake_minimum_required(VERSION 3.16.0)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include($ENV{IDF_PATH}/tools/cmake/project.cmake)

project(
    smart-lights
    DESCRIPTION "Smart lights"
    VERSION 0.1.0
    LANGUAGES CXX
    )
