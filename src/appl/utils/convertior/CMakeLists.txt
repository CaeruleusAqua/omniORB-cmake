set(CONVERTIOR_EXE_SRC
    convertior.cc)
add_executable(convertior ${CONVERTIOR_EXE_SRC})
target_link_libraries(convertior PRIVATE omniORB4 omnithread pthread)
target_compile_definitions(convertior PRIVATE __OMNIORB4__ _REENTRANT)
target_include_directories(convertior PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB ../../../../stub . . ../../../../include ../../../../include)
target_compile_options(convertior PRIVATE -Wno-unused -fexceptions )