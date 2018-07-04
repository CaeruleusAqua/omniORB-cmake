set(NAMECLT_EXE_SRC
    nameclt.cc)
add_executable(nameclt ${NAMECLT_EXE_SRC})
target_link_libraries(nameclt PRIVATE omniORB4 omnithread Threads::Threads)
target_compile_definitions(nameclt PRIVATE __OMNIORB4__ _REENTRANT)
target_include_directories(nameclt PRIVATE ${CMAKE_BINARY_DIR}/generated/lib/omniORB ${CMAKE_SOURCE_DIR}/include)
target_compile_options(nameclt PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS} )