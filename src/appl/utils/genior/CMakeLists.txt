set(GENIOR_EXE_SRC
    genior.cc)
add_executable(genior ${GENIOR_EXE_SRC})
target_link_libraries(genior PRIVATE omniORB4 omnithread pthread)
target_compile_definitions(genior PRIVATE __OMNIORB4__ _REENTRANT)
target_include_directories(genior PRIVATE ../../../../stub . . ../../../../include ../../../../include)
target_compile_options(genior PRIVATE -Wno-unused -fexceptions )