
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
    set(OMNIIDL_EXEC "${PYTHON_EXECUTABLE} {CMAKE_BINARY_DIR}/src/tool/omniidl/cxx/omniidl")
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


file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/generated/services/mklib)

ADD_CUSTOM_COMMAND(OUTPUT Naming.hh NamingDynSK.cc NamingSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/Naming.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/Naming.idl omniidl omnicpp
        COMMENT "Processing Naming.idl..")


ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyChannelAdmin.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyChannelAdminSK.cc ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyChannelAdminDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyChannelAdmin.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyChannelAdmin.idl omniidl omnicpp
        COMMENT "Processing CosNotifyChannelAdmin.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyFilter.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyFilterSK.cc ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyFilterDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyFilter.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyFilter.idl omniidl omnicpp
        COMMENT "Processing CosNotifyFilter.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyComm.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyCommSK.cc ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyCommDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyComm.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyComm.idl omniidl omnicpp
        COMMENT "Processing CosNotifyComm.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotification.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotificationSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosNotification.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotification.idl omniidl omnicpp
        COMMENT "Processing CosNotification.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventChannelAdmin.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventChannelAdminSK.cc ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventChannelAdminDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosEventChannelAdmin.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosEventChannelAdmin.idl omniidl omnicpp
        COMMENT "Processing CosEventChannelAdmin.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventComm.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventCommSK.cc ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventCommDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosEventComm.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosEventComm.idl omniidl omnicpp
        COMMENT "Processing CosEventComm.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosTime.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/CosTimeSK.cc ${CMAKE_BINARY_DIR}/generated/services/mklib/CosTimeDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosTime.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosTime.idl omniidl omnicpp
        COMMENT "Processing CosTime.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/TimeBase.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/TimeBaseSK.cc ${CMAKE_BINARY_DIR}/generated/services/mklib/TimeBaseDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/TimeBase.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/TimeBase.idl omniidl omnicpp
        COMMENT "Processing TimeBase.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosLifeCycle.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/CosLifeCycleSK.cc ${CMAKE_BINARY_DIR}/generated/services/mklib/CosLifeCycleDynSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosLifeCycle.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosLifeCycle.idl omniidl omnicpp
        COMMENT "Processing CosLifeCycle.idl..")


ADD_CUSTOM_TARGET(CosRunGenerator DEPENDS
        omniidl
        omnicpp
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosLifeCycle.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyChannelAdmin.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyFilter.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyComm.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventChannelAdmin.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotification.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventComm.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosTime.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/TimeBase.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/TimeBaseDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosTimeDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventCommDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventChannelAdminDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotificationDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyCommDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyFilterDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyChannelAdminDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosLifeCycleDynSK.cc
        COMMENT "Checking if re-generation is required")


set(COS4_SRC
        ${CMAKE_BINARY_DIR}/generated/services/mklib/TimeBase.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/TimeBaseSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosTime.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosTimeSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventComm.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventCommSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventChannelAdmin.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventChannelAdminSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotification.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotificationSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyComm.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyCommSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyFilter.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyFilterSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyChannelAdmin.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyChannelAdminSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosLifeCycle.hh
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosLifeCycleSK.cc)

add_library(COS4_static STATIC ${COS4_SRC})
target_compile_definitions(COS4_static PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COS4_static PRIVATE ${CMAKE_BINARY_DIR}/generated/services/mklib/ ${CMAKE_BINARY_DIR}/generated/lib/omniORB/ ${CMAKE_SOURCE_DIR}/include ..)
target_compile_options(COS4_static PRIVATE -Wno-unused -fexceptions)
add_dependencies(COS4_static CosRunGenerator)



add_library(COS4 SHARED ${COS4_SRC})
target_link_libraries(COS4 PRIVATE omniORB4 omniDynamic4 omnithread Threads::Threads)
target_compile_definitions(COS4 PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COS4 PRIVATE ${CMAKE_BINARY_DIR}/generated/services/mklib/ ${CMAKE_BINARY_DIR}/generated/lib/omniORB/ ${CMAKE_SOURCE_DIR}/include ..)
target_compile_options(COS4 PRIVATE -Wno-unused -fexceptions)
add_dependencies(COS4 CosRunGenerator)
