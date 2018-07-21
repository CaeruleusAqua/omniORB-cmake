set(OMNIZIOPDYNAMIC4_SRC
        ../ziop/ziopStubs.cc
        omniZIOPDynamic.cc
        compressionDynStubs.cc
        ziopDynStubs.cc)


find_package(ZLIB)

if (ZLIB_FOUND)


    add_library(omniZIOPDynamic4_static STATIC ${OMNIZIOPDYNAMIC4_SRC})
    target_link_libraries(omniZIOPDynamic4_static PUBLIC omniORB4_static omniZIOP4_static omniDynamic4_static omnithread Threads::Threads ZLIB::ZLIB)
    target_compile_definitions(omniZIOPDynamic4_static PRIVATE _OMNIORB_ZIOP_LIBRARY)
    target_include_directories(omniZIOPDynamic4_static PRIVATE ${ZLIB_INCLUDE_DIR} ${PROJECT_BINARY_DIR}/generated/lib/omniORB/ ${PROJECT_SOURCE_DIR}/include/omniORB4/internal . ${PROJECT_SOURCE_DIR}/include)
    target_compile_options(omniZIOPDynamic4_static PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})

    add_library(omniZIOPDynamic4 SHARED ${OMNIZIOPDYNAMIC4_SRC})
    target_link_libraries(omniZIOPDynamic4 PUBLIC omniORB4 omniZIOP4 omniDynamic4 omnithread Threads::Threads ZLIB::ZLIB)
    target_compile_definitions(omniZIOPDynamic4 PRIVATE _OMNIORB_ZIOP_LIBRARY)
    target_include_directories(omniZIOPDynamic4 PRIVATE ${PROJECT_BINARY_DIR}/generated/lib/omniORB/ ${PROJECT_SOURCE_DIR}/include/omniORB4/internal . ${PROJECT_SOURCE_DIR}/include)
    target_compile_options(omniZIOPDynamic4 PRIVATE ${COMPILE_FLAG_WNO_UNUSED} ${COMPILE_FLAG_FEXCEPTIONS})

#    install(TARGETS omniZIOPDynamic4_static omniZIOPDynamic4
#            EXPORT ${PROJECT_NAME}Targets
#            RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
#            LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
#            ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static)

endif ()