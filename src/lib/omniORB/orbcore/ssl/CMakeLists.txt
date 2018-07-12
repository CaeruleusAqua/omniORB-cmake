find_package(OpenSSL)

if (OPENSSL_FOUND)
    set(SSL_SRCS
            sslActive.cc
            sslAddress.cc
            sslAddress.h
            sslConnection.cc
            sslConnection.h
            sslContext.cc
            sslEndpoint.cc
            sslEndpoint.h
            sslTransportImpl.cc
            sslTransportImpl.h)


    if (WIN32)
        set(OMNISSL_STATIC_DEFINITIONS ${OMNISSL_STATIC_DEFINITIONS} _WINSTATIC)
        #endif
        if (CMAKE_CXX_COMPILER_ID MATCHES "clang")
            # using Clang
        elseif (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
            # using GCC

        elseif (CMAKE_CXX_COMPILER_ID MATCHES "Intel")
            # using Intel C++
        elseif (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
            # using Visual Studio C++
            set(SSL_SRCS ${SSL_SRCS} msvcdllstub.cc)
        endif ()

    endif ()

    add_library(omnisslTP4_static STATIC ${SSL_SRCS})
    target_link_libraries(omnisslTP4_static PUBLIC omniORB4_static Threads::Threads ${OPENSSL_LIBRARIES} ${PLATFORM_LIBS})
    target_compile_definitions(omnisslTP4_static PRIVATE _OMNIORB_SSL_LIBRARY ${OMNISSL_STATIC_DEFINITIONS})
    target_include_directories(omnisslTP4_static PUBLIC ${OPENSSL_INCLUDE_DIR} ${PROJECT_BINARY_DIR}/generated/lib/omniORB
            ${PROJECT_SOURCE_DIR}/include/omniORB4/internal
            ${PROJECT_BINARY_DIR}/generated/lib/omniORB)
    target_compile_options(omnisslTP4_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS} ${COMPILE_FLAG_FPERMISSIVE} ${COMPILE_FLAG_WNO_WRITE_STRINGS})


    add_library(omnisslTP4 SHARED ${SSL_SRCS})
    target_link_libraries(omnisslTP4 PUBLIC omniORB4 Threads::Threads ${OPENSSL_LIBRARIES} ${PLATFORM_LIBS})
    target_compile_definitions(omnisslTP4 PRIVATE _OMNIORB_SSL_LIBRARY)
    target_include_directories(omnisslTP4 PUBLIC ${OPENSSL_INCLUDE_DIR}
            ${PROJECT_SOURCE_DIR}/include/omniORB4/internal
            ${PROJECT_BINARY_DIR}/generated/lib/omniORB)
    target_compile_options(omnisslTP4 PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS} ${COMPILE_FLAG_FPERMISSIVE} ${COMPILE_FLAG_WNO_WRITE_STRINGS})


    install(TARGETS omnisslTP4_static omnisslTP4
            RUNTIME DESTINATION bin
            LIBRARY DESTINATION lib
            ARCHIVE DESTINATION lib/static)
else ()
    message(WARNING "OpenSSL not found, disable omnisslTP")
endif ()