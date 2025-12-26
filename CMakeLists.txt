cmake_minimum_required(VERSION 3.22)
project(ConsensusMadeSimple VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(CMS_BUILD_TESTING "Build the testing tree." OFF)
option(CMS_BUILD_EXAMPLE "Build examples." OFF)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Build type" FORCE)
endif()
message(STATUS "CMAKE BUILD TYPE: ${CMAKE_BUILD_TYPE}")

include(cmake/Target.cmake)

set(BUILD_EXAMPLES OFF)
set(BUILD_BENCHMARKS OFF)
set(BUILD_UNIT_TESTS OFF)
set(GENERATE_BENCHMARK_DATA OFF)
add_subdirectory("third_party/yalantinglibs" EXCLUDE_FROM_ALL)

add_subdirectory(src)

if(CMS_BUILD_TESTING)
    enable_testing()
    add_subdirectory(tests)
endif()

if(CMS_BUILD_EXAMPLE)
    add_subdirectory(examples)
endif()

