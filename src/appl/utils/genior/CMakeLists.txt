set(GENIOR_EXE_SRC
    genior.cc)
add_executable(genior ${GENIOR_EXE_SRC})
target_link_libraries(genior PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(genior PRIVATE  )
target_include_directories(genior PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB ${CMAKE_SOURCE_DIR}/include)
target_compile_options(genior PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS} )