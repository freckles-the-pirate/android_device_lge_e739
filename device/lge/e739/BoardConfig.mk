# inherit from the proprietary version
-include vendor/lge/e739/BoardConfigVendor.mk

-include device/lge/victor-common/BoardConfigCommon.mk

# Added for CM11
TARGET_ARCH := arm
TARGET_CPU_VARIANT := scorpion

# Try to build the kernel
TARGET_KERNEL_CONFIG := cyanogen_e739_defconfig
# Keep this as a fallback
TARGET_PREBUILT_KERNEL := device/lge/e739/prebuilt/kernel

TARGET_OTA_ASSERT_DEVICE:=e730,e739

# Overrides for a working kernel.

BOARD_CUSTOM_GRAPHICS := bootable/recovery-cm/miniui/device.c
