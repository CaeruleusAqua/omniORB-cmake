set(COSDYNAMIC4_SRC
        ${CMAKE_BINARY_DIR}/generated/services/mklib/TimeBaseDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosTimeDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventCommDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosEventChannelAdminDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotificationDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyCommDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyFilterDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosNotifyChannelAdminDynSK.cc
        ${CMAKE_BINARY_DIR}/generated/services/mklib/CosLifeCycleDynSK.cc)

add_library(COSDynamic4_static STATIC ${COSDYNAMIC4_SRC})
target_link_libraries(COSDynamic4_static PUBLIC COS4 omniORB4 omniDynamic4 omnithread Threads::Threads)
target_compile_definitions(COSDynamic4_static PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COSDynamic4_static PRIVATE .. ${CMAKE_SOURCE_DIR}/include)
target_compile_options(COSDynamic4_static PRIVATE -Wno-unused -fexceptions)
add_dependencies(COSDynamic4_static CosRunGenerator)


add_library(COSDynamic4 SHARED ${COSDYNAMIC4_SRC})
target_link_libraries(COSDynamic4 PUBLIC COS4 omniORB4 omniDynamic4 omnithread Threads::Threads)
target_compile_definitions(COSDynamic4 PRIVATE __OMNIORB4__ _REENTRANT _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COSDynamic4 PRIVATE .. ${CMAKE_SOURCE_DIR}/include)
target_compile_options(COSDynamic4 PRIVATE -Wno-unused -fexceptions)
add_dependencies(COSDynamic4 CosRunGenerator)