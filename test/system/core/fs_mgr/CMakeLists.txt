
set (INC_FS_MGR "${ANDROID_ROOT}/system/core/fs_mgr")
set (TOOLCHAIN_INCLUDE ${TOOLCHAIN_PATH}/sysroot/usr/include/)
set (INC_SYSTEM_CORE ${ANDROID_ROOT}/system/core/include)

add_executable (test_fsmgr main.c)
    
add_library(fsmgr STATIC ${INC_FS_MGR}/fs_mgr.c)
# target_include_directories(fsmgr PUBLIC ${SYS_ROOT}/usr/include)

target_link_libraries(test_fsmgr fsmgr)