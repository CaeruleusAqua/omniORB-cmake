set(COS4_STATIC_SRC
    ../TimeBaseSK.cc
    ../CosTimeSK.cc
    ../CosEventCommSK.cc
    ../CosEventChannelAdminSK.cc
    ../CosNotificationSK.cc
    ../CosNotifyCommSK.cc
    ../CosNotifyFilterSK.cc
    ../CosNotifyChannelAdminSK.cc
    ../CosLifeCycleSK.cc)
add_library(COS4_static STATIC ${COS4_STATIC_SRC})
target_compile_definitions(COS4_static PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COS4_static PRIVATE ../../../../stub ../../../../src/services/mklib/stublib/.. . . ../../../../include ../../../../include)
target_compile_options(COS4_static PRIVATE -Wno-unused -fexceptions )


set(COS4_SHARED_SRC
    ../TimeBaseSK.cc
    ../CosTimeSK.cc
    ../CosEventCommSK.cc
    ../CosEventChannelAdminSK.cc
    ../CosNotificationSK.cc
    ../CosNotifyCommSK.cc
    ../CosNotifyFilterSK.cc
    ../CosNotifyChannelAdminSK.cc
    ../CosLifeCycleSK.cc)
add_library(COS4 SHARED ${COS4_SHARED_SRC})
target_link_libraries(COS4 PRIVATE omniORB4 omniDynamic4 omnithread pthread)
target_compile_definitions(COS4 PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COS4 PRIVATE ../../../../stub ../../../../src/services/mklib/stublib/.. . . ../../../../include ../../../../include)
target_compile_options(COS4 PRIVATE -Wno-unused -fexceptions  )
