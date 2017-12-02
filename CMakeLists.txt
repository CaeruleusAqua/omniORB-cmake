cmake_minimum_required (VERSION 3.0)
project (OmniOrb)

set(CMAKE_CXX_STANDARD 98)

find_package(PythonLibs REQUIRED)
find_package(PythonInterp REQUIRED)
include(codegen.cmake)

add_definitions(-D__OSVERSION__=2 -D__linux__ -D__x86_64__ -D__x86__)
add_subdirectory(src)


INCLUDE(CheckFunctionExists)
INCLUDE(CheckIncludeFiles)
INCLUDE(CheckTypeSize)
INCLUDE(CheckSymbolExists)


CHECK_INCLUDE_FILES (alloca.h HAVE_ALLOCA_H)
CHECK_FUNCTION_EXISTS (alloca HAVE_ALLOCA)

CHECK_FUNCTION_EXISTS (access HAVE_ACCESS)

# GETTIMEOFDAY_TIMEZONE
#CHECK_FUNCTION_EXISTS (bool HAVE_BOOL)
#/* define if the compiler can catch exceptions by base class */
#define HAVE_CATCH_BY_BASE /**/

#/* define if the compiler supports const_cast<> */
#define HAVE_CONST_CAST /**/

#/* define if the compiler supports dynamic_cast<> */
#define HAVE_DYNAMIC_CAST

#/* define if the compiler supports reinterpret_cast<> */
#define HAVE_REINTERPRET_CAST /**/

#/* define if the compiler supports member constants */
#define HAVE_MEMBER_CONSTANTS /**/

#/* define if the compiler implements namespaces */
#define HAVE_NAMESPACES /**/

###define HAVE_EXCEPTIONS /**

#/* define if SIG_IGN is available */
#define HAVE_SIG_IGN /**/

#/* define if the compiler supports ISO C++ standard library */
#define HAVE_STD /**/


CHECK_TYPE_SIZE("struct lifconf" STRUCT_LIFCONF)
#undef HAVE_STRUCT_LIFCONF */

CHECK_TYPE_SIZE("struct sockaddr_in6" STRUCT_SOCKADDR_IN6)
#define HAVE_STRUCT_SOCKADDR_IN6 1

CHECK_TYPE_SIZE("struct sockaddr_in" STRUCT_SOCKADDR_IN_SIN_LEN)
#undef HAVE_STRUCT_SOCKADDR_IN_SIN_LEN */

CHECK_TYPE_SIZE("((struct sockaddr_in*)0)->sin_zero" STRUCT_SOCKADDR_IN_SIN_ZERO)
#define HAVE_STRUCT_SOCKADDR_IN_SIN_ZERO 1

CHECK_TYPE_SIZE("struct sockaddr_storage" STRUCT_SOCKADDR_STORAGE)
#define HAVE_STRUCT_SOCKADDR_STORAGE 1


CHECK_INCLUDE_FILES (errno.h HAVE_ERRNO_H)

CHECK_INCLUDE_FILES (fcntl.h HAVE_FCNTL_H)

CHECK_FUNCTION_EXISTS (getaddrinfo HAVE_GETADDRINFO)

CHECK_FUNCTION_EXISTS (gethostname HAVE_GETHOSTNAME)

CHECK_FUNCTION_EXISTS (getnameinfo HAVE_GETNAMEINFO)

CHECK_FUNCTION_EXISTS (getopt HAVE_GETOPT)

CHECK_FUNCTION_EXISTS (gettimeofday HAVE_GETTIMEOFDAY)

CHECK_INCLUDE_FILES (ifaddrs.h HAVE_IFADDRS_H)

CHECK_FUNCTION_EXISTS (inet_ntop HAVE_INET_NTOP)

CHECK_FUNCTION_EXISTS (insinff HAVE_INSINFF)

CHECK_INCLUDE_FILES (inttypes.h HAVE_INTTYPES_H)

CHECK_FUNCTION_EXISTS (isinf HAVE_ISINF)

CHECK_FUNCTION_EXISTS (isinfl HAVE_ISINFL)

CHECK_FUNCTION_EXISTS (IsNANorINF HAVE_ISNANORINF)

CHECK_FUNCTION_EXISTS (localtime HAVE_LOCALTIME)

CHECK_INCLUDE_FILES (memory.h HAVE_MEMORY_H)

CHECK_FUNCTION_EXISTS (nanosleep HAVE_NANOSLEEP)

CHECK_INCLUDE_FILES (nan.h HAVE_NAN_H)

CHECK_INCLUDE_FILES (netdb.h HAVE_NETDB_H)

CHECK_FUNCTION_EXISTS (poll HAVE_POLL)

CHECK_FUNCTION_EXISTS (rand_r HAVE_RAND_R)

CHECK_FUNCTION_EXISTS (sigaction HAVE_SIGACTION)

CHECK_INCLUDE_FILES (signal.h HAVE_SIGNAL_H)

CHECK_FUNCTION_EXISTS (sigvec HAVE_SIGVEC)

CHECK_FUNCTION_EXISTS (snprintf HAVE_SNPRINTF)

CHECK_INCLUDE_FILES (stdint.h HAVE_STDINT_H)

CHECK_INCLUDE_FILES (stdlib.h HAVE_STDLIB_H)

CHECK_FUNCTION_EXISTS (strcasecmp HAVE_STRCASECMP)

CHECK_FUNCTION_EXISTS (strdup HAVE_STRDUP)

CHECK_FUNCTION_EXISTS (strerror HAVE_STRERROR)

CHECK_FUNCTION_EXISTS (strftime HAVE_STRFTIME)

CHECK_FUNCTION_EXISTS (stricmp HAVE_STRICMP)

CHECK_INCLUDE_FILES (strings.h HAVE_STRINGS_H)

CHECK_INCLUDE_FILES (string.h HAVE_STRING_H)

CHECK_FUNCTION_EXISTS (strncasecmp HAVE_STRNCASECMP)

CHECK_FUNCTION_EXISTS (strtoul HAVE_STRTOUL)

CHECK_FUNCTION_EXISTS (strtoull HAVE_STRTOULL)

CHECK_FUNCTION_EXISTS (strtouq HAVE_STRTOUQ)

CHECK_INCLUDE_FILES (sys/if.h HAVE_SYS_IF_H)

CHECK_INCLUDE_FILES (sys/ioctl.h HAVE_SYS_IOCTL_H)

CHECK_INCLUDE_FILES (sys/param.h HAVE_SYS_PARAM_H)

CHECK_INCLUDE_FILES (sys/poll.h HAVE_SYS_POLL_H)

CHECK_INCLUDE_FILES (sys/stat.h HAVE_SYS_STAT_H)

CHECK_INCLUDE_FILES (sys/time.h HAVE_SYS_TIME_H)

CHECK_INCLUDE_FILES (sys/types.h HAVE_SYS_TYPES_H)

CHECK_INCLUDE_FILES (sys/types.h HAVE_SYS_TYPES_H)

CHECK_FUNCTION_EXISTS (uname HAVE_UNAME)

CHECK_INCLUDE_FILES (unistd.h HAVE_UNISTD_H)

CHECK_FUNCTION_EXISTS (vprintf HAVE_VPRINTF)

CHECK_FUNCTION_EXISTS (vsnprintf HAVE_VSNPRINTF)



#/* define if you want to avoid use of alloca */
#/* #undef OMNIORB_DISABLE_ALLOCA */

#/* define if you want to disable long double support */
#/* #undef OMNIORB_DISABLE_LONGDOUBLE */

#/* define if you want mutexes to be traced */
#/* #undef OMNIORB_ENABLE_LOCK_TRACES */

#/* define if you want to disable atomic operations */
#/* #undef OMNI_DISABLE_ATOMIC_OPS */

#/* define if you want to disable IPv6 support */
#/* #undef OMNI_DISABLE_IPV6 */

#/* define if the compiler supports covariant return types */
#define OMNI_HAVE_COVARIANT_RETURNS /**/

#/* define if __sync_add_and_fetch and __sync_sub_and_fetch are available */
#define OMNI_HAVE_SYNC_ADD_AND_FETCH /**/



#/* define if base constructors have to be fully qualified */
#/* #undef OMNI_REQUIRES_FQ_BASE_CTOR */


#/* Define to the type of getsockname's third argument */
#define OMNI_SOCKNAME_SIZE_T socklen_t

#/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "bugs@omniorb-support.com"

#/* Define to the full name of this package. */
#define PACKAGE_NAME "omniORB"

#/* Define to the full name and version of this package. */
#define PACKAGE_STRING "omniORB 4.2.2"

#/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "omniorb"

#/* Define to the home page for this package. */
#define PACKAGE_URL ""

#/* Define to the version of this package. */
#define PACKAGE_VERSION "4.2.2"

CHECK_TYPE_SIZE("wchar_t" SIZEOF_WCHAR_T)
CHECK_TYPE_SIZE("bool" SIZEOF_BOOL)
CHECK_TYPE_SIZE("char" SIZEOF_CHAR)
CHECK_TYPE_SIZE("double" SIZEOF_DOUBLE)
CHECK_TYPE_SIZE("float" SIZEOF_FLOAT)
CHECK_TYPE_SIZE("int" SIZEOF_INT)
CHECK_TYPE_SIZE("long" SIZEOF_LONG)
CHECK_TYPE_SIZE("long double" SIZEOF_LONG_DOUBLE)
CHECK_TYPE_SIZE("long long" SIZEOF_LONG_LONG)
CHECK_TYPE_SIZE("short" SIZEOF_SHORT)
CHECK_TYPE_SIZE("unsigned char" SIZEOF_UNSIGNED_CHAR)
CHECK_TYPE_SIZE("void" SIZEOF_VOIDP)

#/* define if long is the same type as int */
#/* #undef OMNI_LONG_IS_INT */



#/* If using the C implementation of alloca, define if you know the
#direction of stack growth for your system; otherwise it will be
#automatically deduced at runtime.
#STACK_DIRECTION > 0 => grows toward higher addresses
#STACK_DIRECTION < 0 => grows toward lower addresses
#STACK_DIRECTION = 0 => direction of growth unknown */
#/* #undef STACK_DIRECTION */

#/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

#/* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
#define TIME_WITH_SYS_TIME 1

#/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
#significant byte first (like Motorola and SPARC, unlike Intel). */
#if defined AC_APPLE_UNIVERSAL_BUILD
# if defined __BIG_ENDIAN__
#  define WORDS_BIGENDIAN 1
# endif
#else
# ifndef WORDS_BIGENDIAN
#/* #  undef WORDS_BIGENDIAN */
# endif
#endif


INCLUDE(TestBigEndian)
TEST_BIG_ENDIAN(WORDS_BIGENDIAN)
