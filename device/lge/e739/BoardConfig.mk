# inherit from the proprietary version
-include vendor/lge/e739/BoardConfigVendor.mk

-include device/lge/victor-common/BoardConfigCommon.mk

# Added for CM11
TARGET_ARCH := arm
TARGET_CPU_VARIANT := scorpion

# Try to build the kernel
#TARGET_KERNEL_CONFIG := cyanogen_e739_defconfig
TARGET_KERNEL_CONFIG := e739_perf_revd_defconfig
# Keep this as a fallback
#TARGET_PREBUILT_KERNEL := device/lge/e739/prebuilt/kernel
#TARGET_PREBUILT_KERNEL := kernel/lge/msm7x30/

# The kernel source actually comes from http://bit.ly/1lVbLzl
# (or http://bit.ly/1jrs7W7 for a direct download)
# Extract `111031_LGE739_Android_GB_V10k.zip` to get E739_GB_kernel.tar.gz
# Copy the kernel to the directory `[cm11-root]/kernel/lge/e739`
TARGET_PREBUILT_KERNEL := kernel/lge/e739/

TARGET_OTA_ASSERT_DEVICE:=e730,e739

# Overrides for a working kernel.

#BOARD_CUSTOM_GRAPHICS := graphics.c
# BOARD_CUSTOM_GRAPHICS := ../../../bootable/recovery-cm/minui/graphics.c
# RECOVERY_VARIANT := cm
