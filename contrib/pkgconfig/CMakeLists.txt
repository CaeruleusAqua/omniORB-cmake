set(prefix ${CMAKE_INSTALL_PREFIX})
set(exec_prefix \${prefix})
set(libdir \${exec_prefix}/lib)
set(includedir \${prefix}/include)
set(datadir \${prefix}/share)
set(bindir \${exec_prefix}/bin)


configure_file(omniConnectionMgmt4.pc.in ${CMAKE_CURRENT_BINARY_DIR}/omniConnectionMgmt4.pc @ONLY)
configure_file(omniCOS4.pc.in ${CMAKE_CURRENT_BINARY_DIR}/omniCOS4.pc @ONLY)
configure_file(omniCOSDynamic4.pc.in ${CMAKE_CURRENT_BINARY_DIR}/omniCOSDynamic4.pc @ONLY)
configure_file(omniDynamic4.pc.in ${CMAKE_CURRENT_BINARY_DIR}/omniDynamic4.pc @ONLY)
configure_file(omniORB4.pc.in ${CMAKE_CURRENT_BINARY_DIR}/omniORB4.pc @ONLY)
configure_file(omnithread3.pc.in ${CMAKE_CURRENT_BINARY_DIR}/omnithread3.pc @ONLY)
configure_file(omniZIOP4.pc.in ${CMAKE_CURRENT_BINARY_DIR}/omniZIOP4.pc @ONLY)
configure_file(omniZIOPDynamic4.pc.in ${CMAKE_CURRENT_BINARY_DIR}/omniZIOPDynamic4.pc @ONLY)


install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/omniConnectionMgmt4.pc
        ${CMAKE_CURRENT_BINARY_DIR}/omniCOS4.pc
        ${CMAKE_CURRENT_BINARY_DIR}/omniCOSDynamic4.pc
        ${CMAKE_CURRENT_BINARY_DIR}/omniDynamic4.pc
        ${CMAKE_CURRENT_BINARY_DIR}/omniORB4.pc
        ${CMAKE_CURRENT_BINARY_DIR}/omnithread3.pc
        ${CMAKE_CURRENT_BINARY_DIR}/omniZIOP4.pc
        ${CMAKE_CURRENT_BINARY_DIR}/omniZIOPDynamic4.pc
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/pkgconfig)