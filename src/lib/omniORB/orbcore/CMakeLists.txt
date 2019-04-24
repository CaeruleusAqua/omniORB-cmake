set(GIOP_SRCS
        omniTransport.cc
        cdrStream.cc
        cdrStreamAdapter.cc
        cdrMemoryStream.cc
        cdrValueChunkStream.cc
        giopEndpoint.cc
        giopRope.cc
        giopStrand.cc
        giopStream.cc
        giopServer.cc
        giopWorker.cc
        giopRendezvouser.cc
        GIOP_C.cc
        GIOP_S.cc
        giopStreamImpl.cc
        giopImpl10.cc
        giopImpl11.cc
        giopImpl12.cc
        giopBiDir.cc
        giopMonitor.cc
        SocketCollection.cc)

set(TRANSPORT_SRCS
        tcpSocket.cc
        tcp/tcpTransportImpl.cc
        tcp/tcpConnection.cc
        tcp/tcpEndpoint.cc
        tcp/tcpAddress.cc
        tcp/tcpActive.cc)

set(UNIXSOCK_SRCS
        unix/unixTransportImpl.cc
        unix/unixConnection.cc
        unix/unixEndpoint.cc
        unix/unixAddress.cc
        unix/unixActive.cc)

set(SSL_SRCS
        ssl/sslActive.cc
        ssl/sslAddress.cc
        ssl/sslConnection.cc
        ssl/sslEndpoint.cc
        ssl/sslTransportImpl.cc
        ssl/sslContext.cc)

set(CODESET_SRCS
        codeSets.cc
        cs-8bit.cc
        cs-16bit.cc
        cs-8859-1.cc
        cs-UTF-8.cc
        cs-UTF-16.cc)

set(BUILTIN_STUB_SRCS
        bootstrapstub.cc
        objectStub.cc
        poastubs.cc)

if (vxWorksPlatform)
    #ifndef vxNamesRequired
    #BUILTIN_STUB_SRCS += Namingstub.cc
    #endif
else ()
    set(BUILTIN_STUB_SRCS ${BUILTIN_STUB_SRCS} Namingstub.cc)
endif ()

set(ORB_SRCS
        anonObject.cc
        callDescriptor.cc
        constants.cc
        corbaObject.cc
        corbaBoa.cc
        corbaOrb.cc
        corbaFixed.cc
        corbaString.cc
        corbaWString.cc
        current.cc
        dynamicLib.cc
        exception.cc
        exceptn.cc
        initRefs.cc
        interceptors.cc
        invoker.cc
        ior.cc
        libcWrapper.cc
        omniIdentity.cc
        localIdentity.cc
        localObject.cc
        logIOstream.cc
        minorCode.cc
        objectAdapter.cc
        omniInternal.cc
        omniIOR.cc
        omniObjRef.cc
        omniORB.cc
        omniServant.cc
        orbOptions.cc
        orbOptionsFile.cc
        poa.cc
        poamanager.cc
        policy.cc
        portableserver.cc
        proxyFactory.cc
        remoteIdentity.cc
        inProcessIdentity.cc
        shutdownIdentity.cc
        callHandle.cc
        tracedthread.cc
        transportRules.cc
        rmutex.cc
        uri.cc
        omniPolicy.cc
        ${GIOP_SRCS}
        ${CODESET_SRCS}
        ${BUILTIN_STUB_SRCS}
        ${TRANSPORT_SRCS}
        )

if (UNIX)
    set(ORB_SRCS ${ORB_SRCS} ${UNIXSOCK_SRCS})
endif ()


set(OMNICORE_STATIC_DEFINITIONS)
set(OMNICORE_DEFINITIONS
        USE_omniORB_logStream
        _OMNIORB_LIBRARY
        OMNIORB_VERSION_STRING="${OMNIORB_VERSION}"
        "OMNIORB_VERSION_HEX=${OMNIORB_VERSION_HEX}")

if (OMNIORB_CONFIG_DEFAULT_LOCATION)
    set(CONFIG_DEFAULT_LOCATION ${OMNIORB_CONFIG_DEFAULT_LOCATION})
else ()
    if (UNIX)
        set(CONFIG_DEFAULT_LOCATION ${CMAKE_INSTALL_FULL_SYSCONFDIR}/omniORB.cfg)
    endif ()
    if (WIN32)
        set(CONFIG_DEFAULT_LOCATION C:\\\\OMNIORB.CFG)
    endif ()
    if (vxWorksPlatform) # No vxWorks support in cmake
        set(CONFIG_DEFAULT_LOCATION /a2/tmp/omniORB.cfg)
    endif ()
endif ()
if(UNIX)
    file(COPY ${CMAKE_SOURCE_DIR}/sample.cfg DESTINATION ${CMAKE_BINARY_DIR})
    file(RENAME ${CMAKE_BINARY_DIR}/sample.cfg ${CMAKE_BINARY_DIR}/omniORB.cfg)
    install(FILES ${CMAKE_BINARY_DIR}/omniORB.cfg DESTINATION ${CMAKE_INSTALL_SYSCONFDIR})
endif()

set(OMNICORE_DEFINITIONS
        ${OMNICORE_DEFINITIONS}
        CONFIG_DEFAULT_LOCATION="${CONFIG_DEFAULT_LOCATION}"
        )

##########################################################################
if (OMNIORB_CONFIG_ENV)
    set(CONFIG_ENV ${CONFIG_ENV} ${OMNIORB_CONFIG_ENV)
else ()
    set(CONFIG_ENV ${CONFIG_ENV} "OMNIORB_CONFIG")
endif ()

set(OMNICORE_DEFINITIONS
        ${OMNICORE_DEFINITIONS}
        CONFIG_ENV="${CONFIG_ENV}")

##########################################################################

set(PLATFORM_LIBS)
if (WIN32)
    set(PLATFORM_LIBS ws2_32 advapi32)
    set(OMNICORE_STATIC_DEFINITIONS ${OMNICORE_STATIC_DEFINITIONS} _WINSTATIC)
    set(ORB_SRCS ${ORB_SRCS} orbOptionsReg.cc)
    if (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
        set(ORB_SRCS ${ORB_SRCS} msvcdllstub.cc)
    endif ()
endif ()


add_library(omniORB4_static STATIC ${ORB_SRCS})
target_link_libraries(omniORB4_static PUBLIC omnithread_static Threads::Threads ${PLATFORM_LIBS})
target_compile_definitions(omniORB4_static PRIVATE ${OMNICORE_DEFINITIONS} ${OMNICORE_STATIC_DEFINITIONS})
target_compile_definitions(omniORB4_static PUBLIC ${TARGET_DEFINITIONS})
target_include_directories(omniORB4_static
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
        PUBLIC
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include/omniORB4/internal>
        $<BUILD_INTERFACE:${PROJECT_BINARY_DIR}/generated/lib/omniORB>
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>)
target_compile_options(omniORB4_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS} ${COMPILE_FLAG_FPERMISSIVE} ${COMPILE_FLAG_WNO_WRITE_STRINGS})
add_dependencies(omniORB4_static RunGenerator)


add_library(omniORB4 SHARED ${ORB_SRCS})
target_link_libraries(omniORB4 PUBLIC omnithread Threads::Threads ${PLATFORM_LIBS})
target_compile_definitions(omniORB4 PRIVATE ${OMNICORE_DEFINITIONS})
target_compile_definitions(omniORB4 PUBLIC ${TARGET_DEFINITIONS})
target_include_directories(omniORB4
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
        PUBLIC
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include/omniORB4/internal>
        $<BUILD_INTERFACE:${PROJECT_BINARY_DIR}/generated/lib/omniORB>
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>)
target_compile_options(omniORB4 PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS} ${COMPILE_FLAG_FPERMISSIVE} ${COMPILE_FLAG_WNO_WRITE_STRINGS})
add_dependencies(omniORB4 RunGenerator)


install(TARGETS omniORB4_static omniORB4
        EXPORT ${PROJECT_NAME}Targets
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static)

add_subdirectory(ssl)
