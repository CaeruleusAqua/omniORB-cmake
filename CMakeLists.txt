cmake_minimum_required (VERSION 3.0)
project (OmniOrb)

add_definitions(-D__OSVERSION__=2 -D__linux__ -D__x86_64__)

add_subdirectory(src)
