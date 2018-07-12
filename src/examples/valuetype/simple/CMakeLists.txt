
set(GEN_DIR ${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4/)


add_executable(vserver vserver.cc ${GEN_DIR}/valueSK.cc ${GEN_DIR}/value.hh)
add_executable(vclient vclient.cc ${GEN_DIR}/valueSK.cc ${GEN_DIR}/value.hh)
add_executable(vcoloc vcoloc.cc ${GEN_DIR}/valueSK.cc ${GEN_DIR}/value.hh)

target_link_libraries(vserver PRIVATE omniORB4 omnithread omniDynamic4 Threads::Threads)
target_compile_definitions(vserver PRIVATE  ${DEFAULT_LOGDIR})
target_include_directories(vserver PRIVATE . ${CMAKE_SOURCE_DIR}/include/include ${GEN_DIR})
target_compile_options(vserver PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
add_dependencies(vserver RunGenerator)

target_link_libraries(vclient PRIVATE omniORB4 omnithread omniDynamic4 Threads::Threads)
target_compile_definitions(vclient PRIVATE  ${DEFAULT_LOGDIR})
target_include_directories(vclient PRIVATE . ${CMAKE_SOURCE_DIR}/include/include ${GEN_DIR})
target_compile_options(vclient PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
add_dependencies(vclient RunGenerator)

target_link_libraries(vcoloc PRIVATE omniORB4 omnithread omniDynamic4 Threads::Threads)
target_compile_definitions(vcoloc PRIVATE  ${DEFAULT_LOGDIR})
target_include_directories(vcoloc PRIVATE . ${CMAKE_SOURCE_DIR}/include/include ${GEN_DIR})
target_compile_options(vcoloc PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
add_dependencies(vcoloc RunGenerator)