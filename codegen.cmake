
execute_process(
        COMMAND "${PYTHON_EXECUTABLE}" -c "if True:
    from distutils import sysconfig as sc
    print(sc.get_python_lib(prefix='', plat_specific=True))"
        OUTPUT_VARIABLE PYTHON_SITE
        OUTPUT_STRIP_TRAILING_WHITESPACE)

set(PYTHON ${PYTHON_EXECUTABLE})
set(prefix ${CMAKE_INSTALL_PREFIX})
set(exec_prefix "\${prefix}")
set(pythondir "\${prefix}/${PYTHON_SITE}")
set(pyexecdir "\${exec_prefix}/${PYTHON_SITE}")

if (NOT WIN32)
    if (${PYTHON_VERSION_MAJOR} EQUAL 2)
        configure_file(${CMAKE_SOURCE_DIR}/src/tool/omniidl/python/scripts/omniidl.in ${CMAKE_BINARY_DIR}/src/tool/omniidl/cxx/omniidl @ONLY)
        set(PYTHONPATH "PYTHONPATH=\"${CMAKE_SOURCE_DIR}/src/tool/omniidl/python2\"")
    else ()
        configure_file(${CMAKE_SOURCE_DIR}/src/tool/omniidl/python3/scripts/omniidl.in ${CMAKE_BINARY_DIR}/src/tool/omniidl/cxx/omniidl @ONLY)
        set(PYTHONPATH "PYTHONPATH=\"${CMAKE_SOURCE_DIR}/src/tool/omniidl/python3\"")
    endif ()
    set(PYTHONHOME "")
    set(OMNIIDL_EXEC "${PYTHON_EXECUTABLE} {CMAKE_BINARY_DIR}/src/tool/omniidl/cxx/omniidl")
    set(PYTHON_EXECUTABLE_MAYBE ${PYTHON_EXECUTABLE})
    SET(OMNIIDL_PLATFORM_FLAGS "")
else ()
    if (${PYTHON_VERSION_MAJOR} EQUAL 2)
        set(PYTHONPATH "PYTHONPATH=\"${CMAKE_SOURCE_DIR}/src/tool/omniidl/python2\"")
    else ()
        set(PYTHONPATH "PYTHONPATH=\"${CMAKE_SOURCE_DIR}/src/tool/omniidl/python3\"")
    endif ()
    set(OMNIIDL_EXEC "${CMAKE_BINARY_DIR}/src/tool/omniidl/cxx/omniidl.exe")
    set(PYTHONHOME "PYTHONHOME=C:/msys64/mingw64/")
    SET(OMNIIDL_PLATFORM_FLAGS "-T")
endif ()


file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4)


ADD_CUSTOM_COMMAND(OUTPUT Naming.hh NamingDynSK.cc NamingSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME}  ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/Naming.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/Naming.idl omniidl omnicpp
        COMMENT "Processing Naming.idl..")

ADD_CUSTOM_COMMAND(OUTPUT corbaidlSK.cc corbaidlDynSK.cc corbaidl_poa.hh corbaidl_operators.hh corbaidl_defs.hh
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -nf -P -WbF -C${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/corbaidl.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/corbaidl.idl omniidl omnicpp
        COMMENT "Processing corbaidl.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ir_defs.hh ir_operators.hh ir_poa.hh irDynSK.cc irSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -WbF -I. -I${CMAKE_SOURCE_DIR}/idl -I${CMAKE_SOURCE_DIR} -C${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/ir.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/ir.idl omniidl omnicpp
        COMMENT "Processing ir.idl..")

ADD_CUSTOM_COMMAND(OUTPUT boxes_defs.hh boxes_operators.hh boxes_poa.hh boxesDynSK.cc boxesSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -nf -P -WbF -C${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/boxes.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/boxes.idl omniidl omnicpp
        COMMENT "Processing boxes.idl..")

ADD_CUSTOM_COMMAND(OUTPUT pollable_defs.hh pollable_operators.hh pollable_poa.hh pollableDynSK.cc pollableSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -nf -P -WbF -C${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/pollable.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/pollable.idl omniidl omnicpp
        COMMENT "Processing pollable.idl..")

ADD_CUSTOM_COMMAND(OUTPUT poa_enums_defs.hh poa_enums_operators.hh poa_enums_poa.hh poa_enumsDynSK.cc poa_enumsSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -nf -P -WbF -C${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/poa_enums.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/poa_enums.idl omniidl omnicpp
        COMMENT "Processing poa_enums.idl..")

ADD_CUSTOM_COMMAND(OUTPUT omniTypedefs.hh omniTypedefsSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/omniTypedefs.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/omniTypedefs.idl omniidl omnicpp
        COMMENT "Processing omniTypedefs.idl..")

ADD_CUSTOM_COMMAND(OUTPUT bootstrap.hh bootstrapDynSK.cc bootstrapSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/bootstrap.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/bootstrap.idl omniidl omnicpp
        COMMENT "Processing bootstrap.idl..")

ADD_CUSTOM_COMMAND(OUTPUT omniConnectionData.hh omniConnectionDataSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/omniConnectionData.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/omniConnectionData.idl omniidl omnicpp
        COMMENT "Processing omniConnectionData.idl..")

ADD_CUSTOM_COMMAND(OUTPUT messaging.hh messagingSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/messaging.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/messaging.idl omniidl omnicpp
        COMMENT "Processing messaging.idl..")

ADD_CUSTOM_COMMAND(OUTPUT messaging_policy.hh messaging_policySK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/messaging_policy.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/messaging_policy.idl omniidl omnicpp
        COMMENT "Processing messaging_policy.idl..")

ADD_CUSTOM_COMMAND(OUTPUT compression.hh compressionDynSK.cc compressionSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -I. -I${CMAKE_SOURCE_DIR}/idl -C${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/compression.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/compression.idl omniidl omnicpp
        COMMENT "Processing compression.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ziop_defs.hh ziop_operators.hh ziop_poa.hh ziopDynSK.cc ziopSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl -WbF -Wba -C${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/ziop.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/ziop.idl omniidl omnicpp
        COMMENT "Processing ziop.idl..")

ADD_CUSTOM_COMMAND(OUTPUT distdate.hh
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/bin/scripts/distdate.py < ${CMAKE_SOURCE_DIR}/update.log > ${CMAKE_BINARY_DIR}/generated/lib/omniORB/omniORB4/distdate.hh
        DEPENDS ${CMAKE_SOURCE_DIR}/update.log omniidl omnicpp
        COMMENT "Processing update.log..")


ADD_CUSTOM_TARGET(RunGenerator DEPENDS
        omniidl
        omnicpp
        distdate.hh
        ziop_defs.hh
        compressionSK.cc
        messaging_policySK.cc
        omniConnectionDataSK.cc
        messagingSK.cc
        omniTypedefs.hh
        bootstrap.hh
        boxes_defs.hh
        pollable_defs.hh
        poa_enums_defs.hh
        corbaidlSK.cc
        corbaidlDynSK.cc
        corbaidl_poa.hh
        corbaidl_operators.hh
        corbaidl_defs.hh
        Naming.hh
        NamingDynSK.cc
        NamingSK.cc
        ir_defs.hh
        ir_operators.hh
        ir_poa.hh
        irDynSK.cc
        irSK.cc
        COMMENT "Checking if re-generation is required")