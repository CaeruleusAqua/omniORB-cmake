set(CONVERTIOR_EXE_SRC
    convertior.cc)
add_executable(convertior ${CONVERTIOR_EXE_SRC})
target_link_libraries(convertior PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(convertior PRIVATE  )
target_include_directories(convertior PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB ${CMAKE_SOURCE_DIR}/include)
target_compile_options(convertior PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS} )