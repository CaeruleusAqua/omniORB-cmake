add_subdirectory(cccp)

set(_OMNIIDLMODULE_SRC
        y.tab.cc
        lex.yy.cc
        idlerr.cc
        idlutil.cc
        idltype.cc
        idlrepoId.cc
        idlscope.cc
        idlexpr.cc
        idlast.cc
        idlvalidate.cc
        idldump.cc
        idlconfig.cc
        idlfixed.cc
        idlpython.cc)
add_library(_omniidl SHARED ${_OMNIIDLMODULE_SRC})
target_compile_definitions(_omniidl PRIVATE PYTHON_INCLUDE=<Python.h> PYTHON_THREAD_INC=<pythread.h> IDLMODULE_VERSION="0x2630")
target_include_directories(_omniidl PRIVATE ${PYTHON_INCLUDE_DIR} . ../../../../include)
target_compile_options(_omniidl PRIVATE -Wno-unused -fexceptions)
set_target_properties(_omniidl PROPERTIES PREFIX "")
