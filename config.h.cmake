#ifndef CONFIG_H
#define CONFIG_H

#cmakedefine OS_LINUX
#define PACKAGE_RELDATE "@PACKAGE_RELDATE@"
#define PACKAGE_FILEFMT "@PACKAGE_FILEFMT@"
#define PACKAGE_VERSION "@PACKAGE_VERSION@"
#define PACKAGE_VERSION_A @PACKAGE_VERSION_A@
#define PACKAGE_VERSION_B @PACKAGE_VERSION_B@
#define PACKAGE_VERSION_C @PACKAGE_VERSION_C@
#define PACKAGE_VERSION_D @PACKAGE_VERSION_D@

#cmakedefine HAVE_ZLIB_H
#cmakedefine HAVE_BZLIB_H
#cmakedefine HAVE_GCRYPT_H
#cmakedefine HAVE_LZ4_H
#cmakedefine HAVE_ZSTD_H
#cmakedefine HAVE_LZO_LZO1X_H

#cmakedefine OPTION_LZ4_SUPPORT
#cmakedefine OPTION_LZO_SUPPORT
#cmakedefine OPTION_LZMA_SUPPORT
#cmakedefine OPTION_ZSTD_SUPPORT

#cmakedefine HAVE_ENDIAN_H
#cmakedefine HAVE_EXECINFO_H
#cmakedefine HAVE_FCNTL_H
#cmakedefine HAVE_FNMATCH_H
#cmakedefine HAVE_FSTATFS64
#cmakedefine HAVE_FSTATVFS64
#cmakedefine HAVE_GETOPT_H
#cmakedefine HAVE_INTTYPES_H
#cmakedefine HAVE_LIBPTHREAD
#cmakedefine HAVE_LSTAT64
#cmakedefine HAVE_LUTIMES
#cmakedefine HAVE_MALLOC_H
#cmakedefine HAVE_MEMPCPY
#cmakedefine HAVE_OPEN64
#cmakedefine HAVE_PTHREAD_H
#cmakedefine HAVE_STAT64
#cmakedefine HAVE_STDBOOL_H
#cmakedefine HAVE_STDINT_H
#cmakedefine HAVE_STDIO_H
#cmakedefine HAVE_STDLIB_H
#cmakedefine HAVE_STRERROR
#cmakedefine HAVE_STRINGS_H
#cmakedefine HAVE_STRING_H
#cmakedefine HAVE_SYS_MOUNT_H
#cmakedefine HAVE_SYS_PARAM_H
#cmakedefine HAVE_SYS_STATFS_H
#cmakedefine HAVE_SYS_STAT_H
#cmakedefine HAVE_SYS_TYPES_H
#cmakedefine HAVE_TIME_H
#cmakedefine HAVE_UNISTD_H
#cmakedefine HAVE_WORDEXP_H

#endif

