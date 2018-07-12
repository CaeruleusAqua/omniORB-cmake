set(NAMECLT_EXE_SRC
    nameclt.cc)
add_executable(nameclt ${NAMECLT_EXE_SRC})
target_link_libraries(nameclt PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(nameclt PRIVATE  )
target_include_directories(nameclt PRIVATE ${PROJECT_BINARY_DIR}/generated/lib/omniORB ${PROJECT_SOURCE_DIR}/include)
target_compile_options(nameclt PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS} )