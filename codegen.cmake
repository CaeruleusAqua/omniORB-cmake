
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
    set(OMNIIDL_EXEC ${PYTHON_EXECUTABLE} ${CMAKE_BINARY_DIR}/src/tool/omniidl/cxx/omniidl)
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


set(GEN_DIR ${CMAKE_BINARY_DIR}/generated/)
file(MAKE_DIRECTORY ${GEN_DIR}/lib/omniORB/omniORB4)


ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/lib/omniORB/omniORB4/Naming.hh ${GEN_DIR}/lib/omniORB/omniORB4/NamingDynSK.cc ${GEN_DIR}/lib/omniORB/omniORB4/NamingSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${GEN_DIR}/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/Naming.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/Naming.idl omniidl omnicpp
        COMMENT "Processing Naming.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/lib/omniORB/omniORB4/corbaidlSK.cc ${GEN_DIR}/lib/omniORB/omniORB4/corbaidlDynSK.cc ${GEN_DIR}/lib/omniORB/omniORB4/corbaidl_poa.hh ${GEN_DIR}/lib/omniORB/omniORB4/corbaidl_operators.hh ${GEN_DIR}/lib/omniORB/omniORB4/corbaidl_defs.hh
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -nf -P -WbF -C${GEN_DIR}/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/corbaidl.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/corbaidl.idl omniidl omnicpp
        COMMENT "Processing corbaidl.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/lib/omniORB/omniORB4/ir_defs.hh ${GEN_DIR}/lib/omniORB/omniORB4/ir_operators.hh ${GEN_DIR}/lib/omniORB/omniORB4/ir_poa.hh ${GEN_DIR}/lib/omniORB/omniORB4/irDynSK.cc ${GEN_DIR}/lib/omniORB/omniORB4/irSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -WbF -I. -I${CMAKE_SOURCE_DIR}/idl -I${CMAKE_SOURCE_DIR} -C${GEN_DIR}/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/ir.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/ir.idl omniidl omnicpp
        COMMENT "Processing ir.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/lib/omniORB/omniORB4/boxes_defs.hh ${GEN_DIR}/lib/omniORB/omniORB4/boxes_operators.hh ${GEN_DIR}/lib/omniORB/omniORB4/boxes_poa.hh ${GEN_DIR}/lib/omniORB/omniORB4/boxesDynSK.cc ${GEN_DIR}/lib/omniORB/omniORB4/boxesSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -nf -P -WbF -C${GEN_DIR}/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/boxes.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/boxes.idl omniidl omnicpp
        COMMENT "Processing boxes.idl..")

ADD_CUSTOM_COMMAND(OUTPUT pollable_defs.hh pollable_operators.hh pollable_poa.hh pollableDynSK.cc pollableSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -nf -P -WbF -C${GEN_DIR}/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/pollable.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/pollable.idl omniidl omnicpp
        COMMENT "Processing pollable.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/lib/omniORB/omniORB4/poa_enums_defs.hh ${GEN_DIR}/lib/omniORB/omniORB4/poa_enums_operators.hh ${GEN_DIR}/lib/omniORB/omniORB4/poa_enums_poa.hh ${GEN_DIR}/lib/omniORB/omniORB4/poa_enumsDynSK.cc ${GEN_DIR}/lib/omniORB/omniORB4/poa_enumsSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -nf -P -WbF -C${GEN_DIR}/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/poa_enums.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/poa_enums.idl omniidl omnicpp
        COMMENT "Processing poa_enums.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/lib/omniORB/omniORB4/omniTypedefs.hh ${GEN_DIR}/lib/omniORB/omniORB4/omniTypedefsSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${GEN_DIR}/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/omniTypedefs.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/omniTypedefs.idl omniidl omnicpp
        COMMENT "Processing omniTypedefs.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/lib/omniORB/omniORB4/bootstrap.hh ${GEN_DIR}/lib/omniORB/omniORB4/bootstrapDynSK.cc ${GEN_DIR}/lib/omniORB/omniORB4/bootstrapSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${GEN_DIR}/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/bootstrap.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/bootstrap.idl omniidl omnicpp
        COMMENT "Processing bootstrap.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/lib/omniORB/omniORB4/omniConnectionData.hh ${GEN_DIR}/lib/omniORB/omniORB4/omniConnectionDataSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${GEN_DIR}/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/omniConnectionData.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/omniConnectionData.idl omniidl omnicpp
        COMMENT "Processing omniConnectionData.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/lib/omniORB/omniORB4/messaging.hh ${GEN_DIR}/lib/omniORB/omniORB4/messagingSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${GEN_DIR}/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/messaging.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/messaging.idl omniidl omnicpp
        COMMENT "Processing messaging.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/lib/omniORB/omniORB4/messaging_policy.hh ${GEN_DIR}/lib/omniORB/omniORB4/messaging_policySK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -C${GEN_DIR}/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/messaging_policy.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/messaging_policy.idl omniidl omnicpp
        COMMENT "Processing messaging_policy.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/lib/omniORB/omniORB4/compression.hh ${GEN_DIR}/lib/omniORB/omniORB4/compressionDynSK.cc ${GEN_DIR}/lib/omniORB/omniORB4/compressionSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -Wba -I. -I${CMAKE_SOURCE_DIR}/idl -C${GEN_DIR}/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/compression.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/compression.idl omniidl omnicpp
        COMMENT "Processing compression.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/lib/omniORB/omniORB4/ziop_defs.hh ${GEN_DIR}/lib/omniORB/omniORB4/ziop_operators.hh ${GEN_DIR}/lib/omniORB/omniORB4/ziop_poa.hh ${GEN_DIR}/lib/omniORB/omniORB4/ziopDynSK.cc ${GEN_DIR}/lib/omniORB/omniORB4/ziopSK.cc
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHONHOME} ${OMNIIDL_EXEC} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${CMAKE_SOURCE_DIR}/src/lib/omniORB/python3 -I${CMAKE_SOURCE_DIR}/idl -Wbdebug -I. -I${CMAKE_SOURCE_DIR}/idl -WbF -Wba -C${GEN_DIR}/lib/omniORB/omniORB4 ${CMAKE_SOURCE_DIR}/idl/ziop.idl
        DEPENDS ${CMAKE_SOURCE_DIR}/idl/ziop.idl omniidl omnicpp
        COMMENT "Processing ziop.idl..")

ADD_CUSTOM_COMMAND(OUTPUT ${GEN_DIR}/lib/omniORB/omniORB4/distdate.hh
        COMMAND ${CMAKE_COMMAND} -E env ${PYTHONPATH} ${PATH} ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/bin/scripts/distdate.py < ${CMAKE_SOURCE_DIR}/update.log > ${GEN_DIR}/lib/omniORB/omniORB4/distdate.hh
        DEPENDS ${CMAKE_SOURCE_DIR}/update.log omniidl omnicpp
        COMMENT "Processing update.log..")


ADD_CUSTOM_TARGET(RunGenerator DEPENDS
        omniidl
        omnicpp
        ${GEN_DIR}/lib/omniORB/omniORB4/distdate.hh
        ${GEN_DIR}/lib/omniORB/omniORB4/ziop_defs.hh
        ${GEN_DIR}/lib/omniORB/omniORB4/compressionSK.cc
        ${GEN_DIR}/lib/omniORB/omniORB4/messaging_policySK.cc
        ${GEN_DIR}/lib/omniORB/omniORB4/omniConnectionDataSK.cc
        ${GEN_DIR}/lib/omniORB/omniORB4/messagingSK.cc
        ${GEN_DIR}/lib/omniORB/omniORB4/omniTypedefs.hh
        ${GEN_DIR}/lib/omniORB/omniORB4/bootstrap.hh
        ${GEN_DIR}/lib/omniORB/omniORB4/boxes_defs.hh
        ${GEN_DIR}/lib/omniORB/omniORB4/pollable_defs.hh
        ${GEN_DIR}/lib/omniORB/omniORB4/poa_enums_defs.hh
        ${GEN_DIR}/lib/omniORB/omniORB4/corbaidlSK.cc
        ${GEN_DIR}/lib/omniORB/omniORB4/corbaidlDynSK.cc
        ${GEN_DIR}/lib/omniORB/omniORB4/corbaidl_poa.hh
        ${GEN_DIR}/lib/omniORB/omniORB4/corbaidl_operators.hh
        ${GEN_DIR}/lib/omniORB/omniORB4/corbaidl_defs.hh
        ${GEN_DIR}/lib/omniORB/omniORB4/Naming.hh
        ${GEN_DIR}/lib/omniORB/omniORB4/NamingDynSK.cc
        ${GEN_DIR}/lib/omniORB/omniORB4/NamingSK.cc
        ${GEN_DIR}/lib/omniORB/omniORB4/ir_defs.hh
        ${GEN_DIR}/lib/omniORB/omniORB4/ir_operators.hh
        ${GEN_DIR}/lib/omniORB/omniORB4/ir_poa.hh
        ${GEN_DIR}/lib/omniORB/omniORB4/irDynSK.cc
        ${GEN_DIR}/lib/omniORB/omniORB4/irSK.cc
        COMMENT "Checking if re-generation is required")