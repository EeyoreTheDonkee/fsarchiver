# Has been tested on one Arch system and one Lubuntu system with the gcc toolchain
cmake_minimum_required(VERSION 3.15)
project(fsarchiver VERSION 2026.03.30)
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
add_definitions(-D_GNU_SOURCE -D_REENTRANT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE)

include(GNUInstallDirs)
include(CheckIncludeFile)
include(CheckLibraryExists)

set(SYS_HEADERS
    blkid/blkid.h malloc.h unistd.h sys/param.h sys/statfs.h sys/mount.h 
    stdint.h endian.h ext2fs/ext2fs.h e2p/e2p.h stdbool.h stdlib.h stdio.h
    getopt.h fcntl.h time.h wordexp.h execinfo.h fnmatch.h uuid/uuid.h
    termios.h
)

foreach(HEADER ${SYS_HEADERS})
    string(MAKE_C_IDENTIFIER "HAVE_${HEADER}" VAR)
    string(TOUPPER "${VAR}" VAR)    
    check_include_file("${HEADER}" ${VAR})
endforeach()

find_package(Threads REQUIRED)
find_package(PkgConfig REQUIRED)
find_package(BZip2 REQUIRED)

pkg_check_modules(LIBS REQUIRED IMPORTED_TARGET 
	liblz4
	libzstd
	lzo2
	libgcrypt
	uuid
	blkid
	zlib
	ext2fs
	e2p
)

pkg_check_modules(COM_ERR REQUIRED IMPORTED_TARGET com_err)
pkg_check_modules(GPG_ERROR REQUIRED IMPORTED_TARGET gpg-error)

find_package(ZLIB REQUIRED)
if(ZLIB_FOUND)
    set(HAVE_ZLIB_H 1)
endif()

pkg_check_modules(LZO lzo2)
if(LZO_FOUND)
	set(OPTION_LZO_SUPPORT 1)
endif()

pkg_check_modules(LZMA REQUIRED IMPORTED_TARGET liblzma)
if(LZMA_FOUND)
	set(OPTION_LZMA_SUPPORT 1)
endif()

pkg_check_modules(ZSTD libzstd)
if(ZSTD_FOUND)
    set(HAVE_ZSTD_H 1)
	set(OPTION_ZSTD_SUPPORT 1)
endif()

set(OS_LINUX 1)
set(PACKAGE_FILEFMT "FsArCh_002")
set(PACKAGE_RELDATE "2026-04-02")
set(PACKAGE_VERSION "0.8.10-git")
set(PACKAGE_VERSION_A 0)
set(PACKAGE_VERSION_B 8)
set(PACKAGE_VERSION_C 10)
set(PACKAGE_VERSION_D 0)
set(HAVE_CONFIG_H 1)
                                                                                                                                                                                                                       
set(HAVE_BZLIB_H 1)                                                                                                         
set(HAVE_ZLIB_H 1)
set(HAVE_GCRYPT_H 1)                                                                                                        
set(HAVE_LZ4_H 1)
set(HAVE_LZO_LZO1X_H 1)
set(OPTION_LZ4_SUPPORT 1)

set(HAVE_ENDIAN_H 1)
set(HAVE_EXECINFO_H 1)
set(HAVE_FCNTL_H 1)
set(HAVE_FNMATCH_H 1)
set(HAVE_FSTATFS64 1)
set(HAVE_FSTATVFS64 1)
set(HAVE_GETOPT_H 1)
set(HAVE_INTTYPES_H 1)
set(HAVE_LIBPTHREAD 1)
set(HAVE_LSTAT64 1)
set(HAVE_LUTIMES 1)
set(HAVE_MALLOC_H 1)
set(HAVE_MEMPCPY 1)
set(HAVE_OPEN64 1)
set(HAVE_PTHREAD_H 1)
set(HAVE_STAT64 1)
set(HAVE_STDBOOL_H 1)
set(HAVE_STDINT_H 1)
set(HAVE_STDIO_H 1)
set(HAVE_STDLIB_H 1)
set(HAVE_STRERROR 1)
set(HAVE_STRINGS_H 1)
set(HAVE_STRING_H 1)
set(HAVE_SYS_MOUNT_H 1)
set(HAVE_SYS_PARAM_H 1)
set(HAVE_SYS_STATFS_H 1)
set(HAVE_SYS_STAT_H 1)
set(HAVE_SYS_TYPES_H 1)
set(HAVE_TIME_H 1)
set(HAVE_UNISTD_H 1)
set(HAVE_WORDEXP_H 1)
set(THREADS_PREFER_PTHREAD_FLAG ON)

configure_file(config.h.cmake config.h)

set(SOURCES
    "src/crypto.c"
    "src/syncthread.c"
    "src/comp_bzip2.c"
    "src/fs_xfs.c"
    "src/dico.c"
    "src/comp_lzma.c"
    "src/comp_lz4.c"
    "src/filesys.c"
    "src/dichl.c"
    "src/devinfo.c"
    "src/fs_jfs.c"
    "src/regmulti.c"
    "src/fs_reiser4.c"
    "src/oper_restore.c"
    "src/comp_lzo.c"
    "src/comp_zstd.c"
    "src/strlist.c"
    "src/fs_ntfs.c"
    "src/fs_reiserfs.c"
    "src/fs_vfat.c"
    "src/archreader.c"
    "src/thread_archio.c"
    "src/fs_btrfs.c"
    "src/options.c"
    "src/fsarchiver.c"
    "src/oper_probe.c"
    "src/oper_save.c"
    "src/common.c"
    "src/writebuf.c"
    "src/error.c"
    "src/datafile.c"
    "src/queue.c"
    "src/logfile.c"
    "src/archwriter.c"
    "src/comp_gzip.c"
    "src/archinfo.c"
    "src/strdico.c"
    "src/thread_comp.c"
    "src/fs_ext2.c"
    "src/comp_lz4.h"
    "src/options.h"
    "src/comp_zstd.h"
    "src/fs_jfs.h"
    "src/crypto.h"
    "src/dico.h"
    "src/archwriter.h"
    "src/common.h"
    "src/syncthread.h"
    "src/oper_save.h"
    "src/devinfo.h"
    "src/regmulti.h"
    "src/strlist.h"
    "src/fsarchiver.h"
    "src/oper_probe.h"
    "src/comp_gzip.h"
    "src/fs_reiserfs.h"
    "src/queue.h"
    "src/comp_lzma.h"
    "src/archinfo.h"
    "src/fs_vfat.h"
    "src/fs_reiser4.h"
    "src/datafile.h"
    "src/thread_comp.h"
    "src/comp_bzip2.h"
    "src/fs_xfs.h"
    "src/oper_restore.h"
    "src/error.h"
    "src/fs_ext2.h"
    "src/dichl.h"
    "src/fs_ntfs.h"
    "src/fs_btrfs.h"
    "src/filesys.h"
    "src/comp_lzo.h"
    "src/logfile.h"
    "src/writebuf.h"
    "src/thread_archio.h"
    "src/archreader.h"
    "src/types.h"
    "src/strdico.h"
)

add_executable(fsarchiver ${SOURCES})

# message(STATUS "Binary include paths: ${CMAKE_BINARY_DIR}")

# CMAKE_CURRENT_BINARY_DIR points to the specific folder (for multi-level projects vs CMAKE_BINARY_DIR)
target_include_directories(fsarchiver PUBLIC src ${CMAKE_CURRENT_BINARY_DIR}) 

target_link_libraries(fsarchiver PUBLIC 
	PkgConfig::LIBS
	BZip2::BZip2
    ZLIB::ZLIB
    Threads::Threads
    PkgConfig::COM_ERR
    PkgConfig::GPG_ERROR
    PkgConfig::LZMA
)

target_compile_definitions(fsarchiver PUBLIC
    HAVE_CONFIG_H
)

set_target_properties(fsarchiver PROPERTIES COMPILE_FLAGS " -rdynamic")
