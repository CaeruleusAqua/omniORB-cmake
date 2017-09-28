set(CATIOR_EXE_SRC
    catior.cc)
add_executable(catior ${CATIOR_EXE_SRC})
target_link_libraries(catior PRIVATE omniORB4 omnithread pthread)
target_compile_definitions(catior PRIVATE __OMNIORB4__ _REENTRANT)
target_include_directories(catior PRIVATE ../../../../stub . . ../../../../include ../../../../include)
target_compile_options(catior PRIVATE -Wno-unused -fexceptions )