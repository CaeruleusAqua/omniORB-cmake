
ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyChannelAdmin.hh  ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyChannelAdminSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHON_EXECUTABLE} ${OMNIIDL_EXEC} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyChannelAdmin.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyChannelAdmin.idl _omniidl omnicpp
        COMMENT "Processing CosNotifyChannelAdmin.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyFilter.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyFilterSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHON_EXECUTABLE} ${OMNIIDL_EXEC} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyFilter.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyFilter.idl _omniidl omnicpp
        COMMENT "Processing CosNotifyFilter.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyComm.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyCommSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHON_EXECUTABLE} ${OMNIIDL_EXEC} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyComm.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyComm.idl _omniidl omnicpp
        COMMENT "Processing CosNotifyComm.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotification.hh  ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotificationSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHON_EXECUTABLE} ${OMNIIDL_EXEC} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosNotification.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotification.idl _omniidl omnicpp
        COMMENT "Processing CosNotification.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventChannelAdmin.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventChannelAdminSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHON_EXECUTABLE} ${OMNIIDL_EXEC} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosEventChannelAdmin.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosEventChannelAdmin.idl _omniidl omnicpp
        COMMENT "Processing CosEventChannelAdmin.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventComm.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventCommSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHON_EXECUTABLE} ${OMNIIDL_EXEC} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosEventComm.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosEventComm.idl _omniidl omnicpp
        COMMENT "Processing CosEventComm.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosTime.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/CosTimeSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHON_EXECUTABLE} ${OMNIIDL_EXEC} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosTime.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosTime.idl _omniidl omnicpp
        COMMENT "Processing CosTime.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/TimeBase.hh ${CMAKE_BINARY_DIR}/generated/services/mklib/TimeBaseSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHON_EXECUTABLE} ${OMNIIDL_EXEC} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/TimeBase.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/TimeBase.idl _omniidl omnicpp
        COMMENT "Processing TimeBase.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/generated/services/mklib/CosLifeCycle.hh  ${CMAKE_BINARY_DIR}/generated/services/mklib/CosLifeCycleSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHON_EXECUTABLE} ${OMNIIDL_EXEC} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${CMAKE_BINARY_DIR}/generated/services/mklib ${CMAKE_SOURCE_DIR}/idl/COS/CosLifeCycle.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosLifeCycle.idl _omniidl omnicpp
        COMMENT "Processing CosLifeCycle.idl..")


ADD_CUSTOM_TARGET(CosRunGenerator DEPENDS
        _omniidl
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
        COMMENT "Checking if re-generation is required")



set(COS4_STATIC_SRC
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

add_library(COS4_static STATIC ${COS4_STATIC_SRC})
target_compile_definitions(COS4_static PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COS4_static PRIVATE ${CMAKE_BINARY_DIR}/generated/services/mklib/ ${CMAKE_SOURCE_DIR}/include ..)
target_compile_options(COS4_static PRIVATE -Wno-unused -fexceptions )
add_dependencies(COS4_static CosRunGenerator)


set(COS4_SHARED_SRC
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
add_library(COS4 SHARED ${COS4_SHARED_SRC})
target_link_libraries(COS4 PRIVATE omniORB4 omniDynamic4 omnithread Threads::Threads)
target_compile_definitions(COS4 PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COS4 PRIVATE ${CMAKE_BINARY_DIR}/generated/services/mklib/ ${CMAKE_SOURCE_DIR}/include ..)
target_compile_options(COS4 PRIVATE -Wno-unused -fexceptions  )
add_dependencies(COS4 CosRunGenerator)
