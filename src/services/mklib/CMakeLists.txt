
set(GEN_DIR ${CMAKE_BINARY_DIR}/generated/services/mklib/)
file(MAKE_DIRECTORY ${GEN_DIR})

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/CosNotifyChannelAdmin.hh ${GEN_DIR}/CosNotifyChannelAdminSK.cc ${GEN_DIR}/CosNotifyChannelAdminDynSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyChannelAdmin.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyChannelAdmin.idl omniidl omnicpp
        COMMENT "Processing CosNotifyChannelAdmin.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/CosNotifyFilter.hh ${GEN_DIR}/CosNotifyFilterSK.cc ${GEN_DIR}/CosNotifyFilterDynSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyFilter.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyFilter.idl omniidl omnicpp
        COMMENT "Processing CosNotifyFilter.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/CosNotifyComm.hh ${GEN_DIR}/CosNotifyCommSK.cc ${GEN_DIR}/CosNotifyCommDynSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyComm.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotifyComm.idl omniidl omnicpp
        COMMENT "Processing CosNotifyComm.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/CosNotification.hh ${GEN_DIR}/CosNotificationSK.cc ${GEN_DIR}/CosNotificationDynSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/COS/CosNotification.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosNotification.idl omniidl omnicpp
        COMMENT "Processing CosNotification.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/CosEventChannelAdmin.hh ${GEN_DIR}/CosEventChannelAdminSK.cc ${GEN_DIR}/CosEventChannelAdminDynSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/COS/CosEventChannelAdmin.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosEventChannelAdmin.idl omniidl omnicpp
        COMMENT "Processing CosEventChannelAdmin.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/CosEventComm.hh ${GEN_DIR}/CosEventCommSK.cc ${GEN_DIR}/CosEventCommDynSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/COS/CosEventComm.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosEventComm.idl omniidl omnicpp
        COMMENT "Processing CosEventComm.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/CosTime.hh ${GEN_DIR}/CosTimeSK.cc ${GEN_DIR}/CosTimeDynSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/COS/CosTime.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosTime.idl omniidl omnicpp
        COMMENT "Processing CosTime.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/TimeBase.hh ${GEN_DIR}/TimeBaseSK.cc ${GEN_DIR}/TimeBaseDynSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/COS/TimeBase.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/TimeBase.idl omniidl omnicpp
        COMMENT "Processing TimeBase.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/CosLifeCycle.hh ${GEN_DIR}/CosLifeCycleSK.cc ${GEN_DIR}/CosLifeCycleDynSK.cc
        COMMAND ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -Wba -p${OMNI_PYTHON_RESOURCES} -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl/COS -C${GEN_DIR} ${CMAKE_SOURCE_DIR}/idl/COS/CosLifeCycle.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/COS/CosLifeCycle.idl omniidl omnicpp
        COMMENT "Processing CosLifeCycle.idl..")


set(COSDYNAMIC4_SRC
        ${GEN_DIR}/TimeBaseDynSK.cc
        ${GEN_DIR}/CosTimeDynSK.cc
        ${GEN_DIR}/CosEventCommDynSK.cc
        ${GEN_DIR}/CosEventChannelAdminDynSK.cc
        ${GEN_DIR}/CosNotificationDynSK.cc
        ${GEN_DIR}/CosNotifyCommDynSK.cc
        ${GEN_DIR}/CosNotifyFilterDynSK.cc
        ${GEN_DIR}/CosNotifyChannelAdminDynSK.cc
        ${GEN_DIR}/CosLifeCycleDynSK.cc)

set(COS4_SRC
        ${GEN_DIR}/TimeBase.hh
        ${GEN_DIR}/TimeBaseSK.cc
        ${GEN_DIR}/CosTime.hh
        ${GEN_DIR}/CosTimeSK.cc
        ${GEN_DIR}/CosEventComm.hh
        ${GEN_DIR}/CosEventCommSK.cc
        ${GEN_DIR}/CosEventChannelAdmin.hh
        ${GEN_DIR}/CosEventChannelAdminSK.cc
        ${GEN_DIR}/CosNotification.hh
        ${GEN_DIR}/CosNotificationSK.cc
        ${GEN_DIR}/CosNotifyComm.hh
        ${GEN_DIR}/CosNotifyCommSK.cc
        ${GEN_DIR}/CosNotifyFilter.hh
        ${GEN_DIR}/CosNotifyFilterSK.cc
        ${GEN_DIR}/CosNotifyChannelAdmin.hh
        ${GEN_DIR}/CosNotifyChannelAdminSK.cc
        ${GEN_DIR}/CosLifeCycle.hh
        ${GEN_DIR}/CosLifeCycleSK.cc)


ADD_CUSTOM_TARGET(CosRunGenerator DEPENDS
        omniidl
        omnicpp
        ${COSDYNAMIC4_SRC}
        ${COS4_SRC}
        COMMENT "Checking if re-generation is required")

add_library(COS4_static STATIC ${COS4_SRC})
target_compile_definitions(COS4_static PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COS4_static PRIVATE ${GEN_DIR}/ ${CMAKE_BINARY_DIR}/generated/lib/omniORB/ ${CMAKE_SOURCE_DIR}/include .)
target_compile_options(COS4_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
add_dependencies(COS4_static CosRunGenerator)



add_library(COS4 SHARED ${COS4_SRC})
target_link_libraries(COS4 PRIVATE omniORB4 omniDynamic4 omnithread Threads::Threads)
target_compile_definitions(COS4 PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COS4 PRIVATE ${GEN_DIR}/ ${CMAKE_BINARY_DIR}/generated/lib/omniORB/ ${CMAKE_SOURCE_DIR}/include .)
target_compile_options(COS4 PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
add_dependencies(COS4 CosRunGenerator)


add_library(COSDynamic4_static STATIC ${COSDYNAMIC4_SRC})
target_link_libraries(COSDynamic4_static PUBLIC COS4 omniORB4 omniDynamic4 omnithread Threads::Threads)
target_compile_definitions(COSDynamic4_static PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COSDynamic4_static PRIVATE ${GEN_DIR}/ ${CMAKE_SOURCE_DIR}/include .)
target_compile_options(COSDynamic4_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
add_dependencies(COSDynamic4_static CosRunGenerator)


add_library(COSDynamic4 SHARED ${COSDYNAMIC4_SRC})
target_link_libraries(COSDynamic4 PUBLIC COS4 omniORB4 omniDynamic4 omnithread Threads::Threads)
target_compile_definitions(COSDynamic4 PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT USE_core_stub_in_nt_dll)
target_include_directories(COSDynamic4 PRIVATE  ${GEN_DIR}/ ${CMAKE_SOURCE_DIR}/include .)
target_compile_options(COSDynamic4 PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
add_dependencies(COSDynamic4 CosRunGenerator)



install(TARGETS COS4_static COS4 COSDynamic4_static COSDynamic4
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static)