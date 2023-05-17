# CMakeList.txt : CMake project for rcrconversion, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

project ("rcrconversion")

# Add source to this project's executable.
add_executable (rcrconversion "rcrconversion.cpp" "rcrconversion.h")

#add libary
add_library(rcrconversionlib SHARED "rcrconversion.cpp" "rcrconversion.h")

# TODO: Add tests and install targets if needed.
