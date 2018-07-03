
execute_process(
        COMMAND "${PYTHON_EXECUTABLE}" -c "if True:
    from distutils import sysconfig as sc
    print(sc.get_python_lib(prefix='', plat_specific=True))"
        OUTPUT_VARIABLE PYTHON_SITE
        OUTPUT_STRIP_TRAILING_WHITESPACE)

set(PYTHON ${PYTHON_EXECUTABLE})
set(prefix ${CMAKE_INSTALL_PREFIX})
set(exec_prefix "\${prefix}")
set(pythondir "\${prefix}/${PYTHON_SITE}")
set(pyexecdir "\${exec_prefix}/${PYTHON_SITE}")

if (NOT WIN32)
    if (${PYTHON_VERSION_MAJOR} EQUAL 2)
        configure_file(${CMAKE_SOURCE_DIR}/src/tool/omniidl/python/scripts/omniidl.in ${CMAKE_BINARY_DIR}/src/tool/omniidl/cxx/omniidl @ONLY)
        set(PYTHONPATH "PYTHONPATH=\"${CMAKE_SOURCE_DIR}/src/tool/omniidl/python2\"")
    else ()
        configure_file(${CMAKE_SOURCE_DIR}/src/tool/omniidl/python3/scripts/omniidl.in ${CMAKE_BINARY_DIR}/src/tool/omniidl/cxx/omniidl @ONLY)
        set(PYTHONPATH "PYTHONPATH=\"${CMAKE_SOURCE_DIR}/src/tool/omniidl/python3\"")
    endif ()
    set(PYTHONHOME "")
    set(OMNIIDL_EXEC ${PYTHON_EXECUTABLE} ${CMAKE_BINARY_DIR}/src/tool/omniidl/cxx/omniidl)
    set(PYTHON_EXECUTABLE_MAYBE ${PYTHON_EXECUTABLE})
    SET(OMNIIDL_PLATFORM_FLAGS "")
else ()
    if (${PYTHON_VERSION_MAJOR} EQUAL 2)
        set(PYTHONPATH "PYTHONPATH=\"${CMAKE_SOURCE_DIR}/src/tool/omniidl/python2\"")
    else ()
        set(PYTHONPATH "PYTHONPATH=\"${CMAKE_SOURCE_DIR}/src/tool/omniidl/python3\"")
    endif ()
    set(OMNIIDL_EXEC "${CMAKE_BINARY_DIR}/src/tool/omniidl/cxx/omniidl.exe")
    set(PYTHONHOME "PYTHONHOME=C:/msys64/mingw64/")
    SET(OMNIIDL_PLATFORM_FLAGS "-T")
endif ()

set(GEN_DIR ${CMAKE_BINARY_DIR}/generated/)
file(MAKE_DIRECTORY ${GEN_DIR}/services/mklib)



ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/services/mklib/CosNotifyChannelAdmin.hh ${GEN_DIR}/services/mklib/CosNotifyChannelAdminSK.cc ${GEN_DIR}/services/mklib/CosNotifyChannelAdminDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR}/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyChannelAdmin.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyChannelAdmin.idl omniidl omnicpp
        COMMENT "Processing CosNotifyChannelAdmin.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/services/mklib/CosNotifyFilter.hh ${GEN_DIR}/services/mklib/CosNotifyFilterSK.cc ${GEN_DIR}/services/mklib/CosNotifyFilterDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR}/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyFilter.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyFilter.idl omniidl omnicpp
        COMMENT "Processing CosNotifyFilter.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/services/mklib/CosNotifyComm.hh ${GEN_DIR}/services/mklib/CosNotifyCommSK.cc ${GEN_DIR}/services/mklib/CosNotifyCommDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR}/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyComm.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyComm.idl omniidl omnicpp
        COMMENT "Processing CosNotifyComm.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/services/mklib/CosNotification.hh ${GEN_DIR}/services/mklib/CosNotificationSK.cc ${GEN_DIR}/services/mklib/CosNotificationDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR}/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosNotification.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotification.idl omniidl omnicpp
        COMMENT "Processing CosNotification.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/services/mklib/CosEventChannelAdmin.hh ${GEN_DIR}/services/mklib/CosEventChannelAdminSK.cc ${GEN_DIR}/services/mklib/CosEventChannelAdminDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR}/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosEventChannelAdmin.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosEventChannelAdmin.idl omniidl omnicpp
        COMMENT "Processing CosEventChannelAdmin.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/services/mklib/CosEventComm.hh ${GEN_DIR}/services/mklib/CosEventCommSK.cc ${GEN_DIR}/services/mklib/CosEventCommDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR}/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosEventComm.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosEventComm.idl omniidl omnicpp
        COMMENT "Processing CosEventComm.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/services/mklib/CosTime.hh ${GEN_DIR}/services/mklib/CosTimeSK.cc ${GEN_DIR}/services/mklib/CosTimeDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR}/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosTime.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosTime.idl omniidl omnicpp
        COMMENT "Processing CosTime.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/services/mklib/TimeBase.hh ${GEN_DIR}/services/mklib/TimeBaseSK.cc ${GEN_DIR}/services/mklib/TimeBaseDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR}/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/TimeBase.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/TimeBase.idl omniidl omnicpp
        COMMENT "Processing TimeBase.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/services/mklib/CosLifeCycle.hh ${GEN_DIR}/services/mklib/CosLifeCycleSK.cc ${GEN_DIR}/services/mklib/CosLifeCycleDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR}/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosLifeCycle.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosLifeCycle.idl omniidl omnicpp
        COMMENT "Processing CosLifeCycle.idl..")


ADD_CUSTOM_TARGET(CosRunGenerator DEPENDS
        omniidl
        omnicpp
        ${GEN_DIR}/services/mklib/CosLifeCycle.hh
        ${GEN_DIR}/services/mklib/CosNotifyChannelAdmin.hh
        ${GEN_DIR}/services/mklib/CosNotifyFilter.hh
        ${GEN_DIR}/services/mklib/CosNotifyComm.hh
        ${GEN_DIR}/services/mklib/CosEventChannelAdmin.hh
        ${GEN_DIR}/services/mklib/CosNotification.hh
        ${GEN_DIR}/services/mklib/CosEventComm.hh
        ${GEN_DIR}/services/mklib/CosTime.hh
        ${GEN_DIR}/services/mklib/TimeBase.hh
        ${GEN_DIR}/services/mklib/TimeBaseDynSK.cc
        ${GEN_DIR}/services/mklib/CosTimeDynSK.cc
        ${GEN_DIR}/services/mklib/CosEventCommDynSK.cc
        ${GEN_DIR}/services/mklib/CosEventChannelAdminDynSK.cc
        ${GEN_DIR}/services/mklib/CosNotificationDynSK.cc
        ${GEN_DIR}/services/mklib/CosNotifyCommDynSK.cc
        ${GEN_DIR}/services/mklib/CosNotifyFilterDynSK.cc
        ${GEN_DIR}/services/mklib/CosNotifyChannelAdminDynSK.cc
        ${GEN_DIR}/services/mklib/CosLifeCycleDynSK.cc
        COMMENT "Checking if re-generation is required")


set(COS4_SRC
        ${GEN_DIR}/services/mklib/TimeBase.hh
        ${GEN_DIR}/services/mklib/TimeBaseSK.cc
        ${GEN_DIR}/services/mklib/CosTime.hh
        ${GEN_DIR}/services/mklib/CosTimeSK.cc
        ${GEN_DIR}/services/mklib/CosEventComm.hh
        ${GEN_DIR}/services/mklib/CosEventCommSK.cc
        ${GEN_DIR}/services/mklib/CosEventChannelAdmin.hh
        ${GEN_DIR}/services/mklib/CosEventChannelAdminSK.cc
        ${GEN_DIR}/services/mklib/CosNotification.hh
        ${GEN_DIR}/services/mklib/CosNotificationSK.cc
        ${GEN_DIR}/services/mklib/CosNotifyComm.hh
        ${GEN_DIR}/services/mklib/CosNotifyCommSK.cc
        ${GEN_DIR}/services/mklib/CosNotifyFilter.hh
        ${GEN_DIR}/services/mklib/CosNotifyFilterSK.cc
        ${GEN_DIR}/services/mklib/CosNotifyChannelAdmin.hh
        ${GEN_DIR}/services/mklib/CosNotifyChannelAdminSK.cc
        ${GEN_DIR}/services/mklib/CosLifeCycle.hh
        ${GEN_DIR}/services/mklib/CosLifeCycleSK.cc)

add_library(COS4_static STATIC ${COS4_SRC})
target_compile_definitions(COS4_static PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COS4_static PRIVATE ${GEN_DIR}/services/mklib/ ${GEN_DIR}/lib/omniORB/ ${CMAKE_SOURCE_DIR}/include ..)
target_compile_options(COS4_static PRIVATE -Wno-unused -fexceptions)
add_dependencies(COS4_static CosRunGenerator)



add_library(COS4 SHARED ${COS4_SRC})
target_link_libraries(COS4 PRIVATE omniORB4 omniDynamic4 omnithread Threads::Threads)
target_compile_definitions(COS4 PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COS4 PRIVATE ${GEN_DIR}/services/mklib/ ${GEN_DIR}/lib/omniORB/ ${CMAKE_SOURCE_DIR}/include ..)
target_compile_options(COS4 PRIVATE -Wno-unused -fexceptions)
add_dependencies(COS4 CosRunGenerator)
