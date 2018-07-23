
set(GEN_DIR ${PROJECT_BINARY_DIR}/generated/lib/omniORB/omniORB4/)
set(IDL_DIR ${CMAKE_CURRENT_SOURCE_DIR})

RUN_OMNIIDL(${IDL_DIR}/value.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl "-Wba;-Wbdebug" "value.hh;valueSK.cc" SOURCE_FILES)

add_executable(vserver vserver.cc ${GEN_DIR}/valueSK.cc ${GEN_DIR}/value.hh)
add_executable(vclient vclient.cc ${GEN_DIR}/valueSK.cc ${GEN_DIR}/value.hh)
add_executable(vcoloc vcoloc.cc ${GEN_DIR}/valueSK.cc ${GEN_DIR}/value.hh)

target_link_libraries(vserver PRIVATE omniORB4 omnithread omniDynamic4 Threads::Threads)
target_compile_definitions(vserver PRIVATE  ${DEFAULT_LOGDIR})
target_include_directories(vserver PRIVATE . ${PROJECT_SOURCE_DIR}/include ${GEN_DIR})
target_compile_options(vserver PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})

target_link_libraries(vclient PRIVATE omniORB4 omnithread omniDynamic4 Threads::Threads)
target_compile_definitions(vclient PRIVATE  ${DEFAULT_LOGDIR})
target_include_directories(vclient PRIVATE . ${PROJECT_SOURCE_DIR}/include ${GEN_DIR})
target_compile_options(vclient PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})


target_link_libraries(vcoloc PRIVATE omniORB4 omnithread omniDynamic4 Threads::Threads)
target_compile_definitions(vcoloc PRIVATE  ${DEFAULT_LOGDIR})
target_include_directories(vcoloc PRIVATE . ${PROJECT_SOURCE_DIR}/include ${GEN_DIR})
target_compile_options(vcoloc PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
