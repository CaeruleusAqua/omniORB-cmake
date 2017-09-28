cmake_minimum_required (VERSION 3.0)
project (OmniOrb)

add_definitions(__OSVERSION__=2 __linux__ __x86_64__)

add_subdirectory(src)
