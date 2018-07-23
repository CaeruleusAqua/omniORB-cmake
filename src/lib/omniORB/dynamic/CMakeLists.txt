set(OMNIDYNAMIC4_SRC
    ami.cc
    valueBase.cc
    valueFactory.cc
    valueTracker.cc
    valueType.cc
    unknownValue.cc
    abstractBase.cc
    any.cc
    anyStream.cc
    constants.cc
    context.cc
    contextList.cc
    dynamicImplementation.cc
    dynamicLib.cc
    dynAny.cc
    dynAnyNil.cc
    dynException.cc
    environment.cc
    exceptionList.cc
    namedValue.cc
    nvList.cc
    policy.cc
    pseudoBase.cc
    request.cc
    orbMultiRequest.cc
    serverRequest.cc
    tcParser.cc
    typecode.cc
    unknownUserExn.cc
    poastub.cc
    bootstrapdynstub.cc
    corbaidldynstub.cc
    corbaidlstub.cc
    irstub.cc
    ir.cc
    irdynstub.cc
    Namingdynstub.cc
    boxes.cc
    pollablestub.cc
    messagingstub.cc
    omniTypedefs.cc)
add_library(omniDynamic4_static STATIC ${OMNIDYNAMIC4_SRC})
target_link_libraries(omniDynamic4_static PUBLIC omniORB4_static omnithread_static Threads::Threads)
target_compile_definitions(omniDynamic4_static PRIVATE USE_omniORB_logStream _OMNIORB_DYNAMIC_LIBRARY)
target_compile_options(omniDynamic4_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS} )


add_library(omniDynamic4 SHARED ${OMNIDYNAMIC4_SRC})
target_link_libraries(omniDynamic4 PUBLIC omniORB4 omnithread Threads::Threads)
target_compile_definitions(omniDynamic4 PRIVATE USE_omniORB_logStream _OMNIORB_DYNAMIC_LIBRARY)
target_compile_options(omniDynamic4 PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS}  )

install(TARGETS omniDynamic4_static omniDynamic4
        EXPORT ${PROJECT_NAME}Targets
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static)