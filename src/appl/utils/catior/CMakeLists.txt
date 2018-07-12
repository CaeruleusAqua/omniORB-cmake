set(CATIOR_EXE_SRC
    catior.cc)
add_executable(catior ${CATIOR_EXE_SRC})
target_link_libraries(catior PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(catior PRIVATE  )
target_include_directories(catior PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB ${CMAKE_SOURCE_DIR}/include)
target_compile_options(catior PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS} )