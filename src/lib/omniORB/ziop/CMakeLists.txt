find_package(ZLIB)

if (ZLIB_FOUND)

    set(OMNIZIOP4_SRC
            messagingStubs.cc
            omniZIOP.cc
            omniZIOPImpl.h
            #ziopStubs.cc
            #zlibCompressor.cc
            zlibCompressor.h
            )

    add_library(omniZIOP4_static STATIC ${OMNIZIOP4_SRC})
    target_link_libraries(omniZIOP4_static PUBLIC omniORB4_static omnithread_static Threads::Threads ZLIB::ZLIB)
    target_compile_definitions(omniZIOP4_static PRIVATE _OMNIORB_ZIOP_LIBRARY)
    target_include_directories(omniZIOP4_static PRIVATE ${PROJECT_BINARY_DIR}/generated/lib/omniORB/ ${PROJECT_SOURCE_DIR}/include/omniORB4/internal ${PROJECT_SOURCE_DIR}/include)
    target_compile_options(omniZIOP4_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})

    add_library(omniZIOP4 SHARED ${OMNIZIOP4_SRC})
    target_link_libraries(omniZIOP4 PUBLIC omniORB4 omnithread Threads::Threads ZLIB::ZLIB)
    target_compile_definitions(omniZIOP4 PRIVATE _OMNIORB_ZIOP_LIBRARY)
    target_include_directories(omniZIOP4 PRIVATE ${PROJECT_BINARY_DIR}/generated/lib/omniORB/ ${PROJECT_SOURCE_DIR}/include/omniORB4/internal ${PROJECT_SOURCE_DIR}/include)
    target_compile_options(omniZIOP4 PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})


    install(TARGETS omniZIOP4_static omniZIOP4
            EXPORT ${PROJECT_NAME}Targets
            RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
            LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
            ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static)

else()
    message(WARNING "Zlib not found, disable omniZIOP")
endif ()