set(NAMECLT_EXE_SRC
    nameclt.cc)
add_executable(nameclt ${NAMECLT_EXE_SRC})
target_link_libraries(nameclt PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(nameclt PRIVATE __OMNIORB4__ _REENTRANT)
target_include_directories(nameclt PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB ../../../../stub . . ../../../../include ../../../../include)
target_compile_options(nameclt PRIVATE -Wno-unused -fexceptions )