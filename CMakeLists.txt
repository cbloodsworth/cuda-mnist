cmake_minimum_required(VERSION 3.18...3.30)

# Enable compilation database generation for clangd support
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Project Statement
project(cuda-mnist LANGUAGES CXX CUDA)

# Set C++ standard to C++20
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Set CUDA standard to C++20
set(CMAKE_CUDA_STANDARD 20)
set(CMAKE_CUDA_STANDARD_REQUIRED ON)
set(CMAKE_CUDA_EXTENSIONS OFF)

# Set CUDA architectures (adjust as needed for your GPU)
set(CMAKE_CUDA_ARCHITECTURES 75)

# Include directories
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

# Add CNN library
add_library(CNN STATIC cnn.cu cnn.cuh)
set_target_properties(CNN PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
set_target_properties(CNN PROPERTIES LINKER_LANGUAGE CUDA)

# Main entrypoint
add_executable(Main main.cpp)

# Link with main
target_link_libraries(Main PRIVATE CNN)

# Ensure proper linking between Main and CNN libraries
target_link_libraries(Main PRIVATE CNN)
