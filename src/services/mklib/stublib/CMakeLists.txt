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
add_dependencies(COS4_static RunGenerator)


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
target_link_libraries(COS4 PRIVATE omniORB4 omniDynamic4 omnithread pthread)
target_compile_definitions(COS4 PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COS4 PRIVATE ${CMAKE_BINARY_DIR}/generated/services/mklib/ ${CMAKE_SOURCE_DIR}/include ..)
target_compile_options(COS4 PRIVATE -Wno-unused -fexceptions  )
add_dependencies(COS4 RunGenerator)