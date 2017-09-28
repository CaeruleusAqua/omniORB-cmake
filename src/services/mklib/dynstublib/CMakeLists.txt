set(COSDYNAMIC4_STATIC_SRC
    ../TimeBaseDynSK.cc
    ../CosTimeDynSK.cc
    ../CosEventCommDynSK.cc
    ../CosEventChannelAdminDynSK.cc
    ../CosNotificationDynSK.cc
    ../CosNotifyCommDynSK.cc
    ../CosNotifyFilterDynSK.cc
    ../CosNotifyChannelAdminDynSK.cc
    ../CosLifeCycleDynSK.cc)
add_library(COSDynamic4_static STATIC ${COSDYNAMIC4_STATIC_SRC})
target_compile_definitions(COSDynamic4_static PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COSDynamic4_static PRIVATE ../../../../stub ../../../../src/services/mklib/dynstublib/.. . . ../../../../include ../../../../include)
target_compile_options(COSDynamic4_static PRIVATE -O2 -Wall -Wno-unused -fexceptions )


set(COSDYNAMIC4_SHARED_SRC
    ../TimeBaseDynSK.cc
    ../CosTimeDynSK.cc
    ../CosEventCommDynSK.cc
    ../CosEventChannelAdminDynSK.cc
    ../CosNotificationDynSK.cc
    ../CosNotifyCommDynSK.cc
    ../CosNotifyFilterDynSK.cc
    ../CosNotifyChannelAdminDynSK.cc
    ../CosLifeCycleDynSK.cc)
add_library(COSDynamic4 SHARED ${COSDYNAMIC4_SHARED_SRC})
target_link_libraries(COSDynamic4 PRIVATE COS4 omniORB4 omniDynamic4 omnithread pthread)
target_compile_definitions(COSDynamic4 PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COSDynamic4 PRIVATE ../../../../stub ../../../../src/services/mklib/dynstublib/.. . . ../../../../include ../../../../include)
target_compile_options(COSDynamic4 PRIVATE -fPIC -O2 -Wall -Wno-unused -fexceptions  )
