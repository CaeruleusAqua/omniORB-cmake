set(GEN_DIR ${PROJECT_BINARY_DIR}/generated/services/mklib/)
set(GEN_DIR2 ${PROJECT_BINARY_DIR}/generated/lib/omniORB/)
set(IDL_DIR ${PROJECT_SOURCE_DIR}/idl/COS/)
file(MAKE_DIRECTORY ${GEN_DIR})

RUN_OMNIIDL(${IDL_DIR}/CosNotifyChannelAdmin.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl/COS "-Wba;-Wbdebug" "CosNotifyChannelAdmin.hh;CosNotifyChannelAdminSK.cc;CosNotifyChannelAdminDynSK.cc")
RUN_OMNIIDL(${IDL_DIR}/CosNotifyFilter.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl/COS "-Wba;-Wbdebug" "CosNotifyFilter.hh;CosNotifyFilterSK.cc;CosNotifyFilterDynSK.cc")
RUN_OMNIIDL(${IDL_DIR}/CosNotifyComm.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl/COS "-Wba;-Wbdebug" "CosNotifyComm.hh;CosNotifyCommSK.cc;CosNotifyCommDynSK.cc")
RUN_OMNIIDL(${IDL_DIR}/CosNotification.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl/COS "-Wba;-Wbdebug" "CosNotification.hh;CosNotificationSK.cc;CosNotificationDynSK.cc")
RUN_OMNIIDL(${IDL_DIR}/CosEventChannelAdmin.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl/COS "-Wba;-Wbdebug" "CosEventChannelAdmin.hh;CosEventChannelAdminSK.cc;CosEventChannelAdminDynSK.cc")
RUN_OMNIIDL(${IDL_DIR}/CosEventComm.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl/COS "-Wba;-Wbdebug" "CosEventComm.hh;CosEventCommSK.cc;CosEventCommDynSK.cc")
RUN_OMNIIDL(${IDL_DIR}/CosTime.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl/COS "-Wba;-Wbdebug" "CosTime.hh;CosTimeSK.cc;CosTimeDynSK.cc")
RUN_OMNIIDL(${IDL_DIR}/TimeBase.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl/COS "-Wba;-Wbdebug" "TimeBase.hh;TimeBaseSK.cc;TimeBaseDynSK.cc")
RUN_OMNIIDL(${IDL_DIR}/CosLifeCycle.idl ${GEN_DIR} ${PROJECT_SOURCE_DIR}/idl/COS "-Wba;-Wbdebug" "CosLifeCycle.hh;CosLifeCycleSK.cc;CosLifeCycleDynSK.cc")


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
        COMMENT "Checking if re-generation is required for target COS4")

add_library(COS4_static STATIC ${COS4_SRC})
target_compile_definitions(COS4_static PRIVATE  _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COS4_static PRIVATE ${GEN_DIR}/ ${PROJECT_BINARY_DIR}/generated/lib/omniORB/ ${PROJECT_SOURCE_DIR}/include .)
target_compile_options(COS4_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
add_dependencies(COS4_static CosRunGenerator)


add_library(COS4 SHARED ${COS4_SRC})
target_link_libraries(COS4 PRIVATE omniORB4 omniDynamic4 omnithread Threads::Threads)
target_compile_definitions(COS4 PRIVATE  _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COS4 PRIVATE ${GEN_DIR}/ ${PROJECT_BINARY_DIR}/generated/lib/omniORB/ ${PROJECT_SOURCE_DIR}/include .)
target_compile_options(COS4 PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})
add_dependencies(COS4 CosRunGenerator)


add_library(COSDynamic4_static STATIC ${COSDYNAMIC4_SRC})
target_link_libraries(COSDynamic4_static PUBLIC COS4 omniORB4_static omniDynamic4_static omnithread_static Threads::Threads)
target_compile_definitions(COSDynamic4_static PRIVATE  _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT)
target_include_directories(COSDynamic4_static PRIVATE ${GEN_DIR2} ${GEN_DIR}/ ${PROJECT_SOURCE_DIR}/include .)
target_compile_options(COSDynamic4_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})


add_library(COSDynamic4 SHARED ${COSDYNAMIC4_SRC})
target_link_libraries(COSDynamic4 PUBLIC COS4 omniORB4 omniDynamic4 omnithread Threads::Threads)
target_compile_definitions(COSDynamic4 PRIVATE  _COS_LIBRARY ENABLE_CLIENT_IR_SUPPORT USE_core_stub_in_nt_dll)
target_include_directories(COSDynamic4 PRIVATE  ${GEN_DIR2} ${GEN_DIR}/ ${PROJECT_SOURCE_DIR}/include .)
target_compile_options(COSDynamic4 PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})



install(TARGETS COS4_static COS4 COSDynamic4_static COSDynamic4
        EXPORT ${PROJECT_NAME}Targets
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION lib/static)