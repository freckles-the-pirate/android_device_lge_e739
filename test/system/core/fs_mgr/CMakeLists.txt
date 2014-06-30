
# set (INC_FS_MGR ${ANDROID_ROOT}/system/core/fs_mgr)
# set (SYS_ROOT ${TOOLCHAIN_PATH}}/sysroot)
# set (TOOLCHAIN_INCLUDE ${TOOLCHAIN_PATH}/sysroot/usr/include/)
# set (INC_SYSTEM_CORE ${ANDROID_ROOT}/system/core/include)
# set (INC_LOG_WRAPPER ${ANDROID_ROOT}/system/core/logwrapper/include)
# set (INC_LG ${ANDROID_ROOT}/kernel/lge/msm7x30/include)

add_executable (test_fsmgr main.c)
    
add_library(fsmgr STATIC ${INC_FS_MGR}/fs_mgr.c)
target_include_directories(fsmgr BEFORE PUBLIC ${INC_FS_MGR}/include)

target_link_libraries(test_fsmgr fsmgr)