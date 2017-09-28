set(OMKDEPEND_EXE_SRC
    include.c
    main.c
    parse.c
    pr.c
    cppsetup.c
    ifparser.c)
add_executable(omkdepend ${OMKDEPEND_EXE_SRC})
target_compile_definitions(omkdepend PRIVATE DEBUG)
target_include_directories(omkdepend PRIVATE . . ../../../include ../../../include)
target_compile_options(omkdepend PRIVATE -O )

