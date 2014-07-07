
PWD=$(shell pwd)/system/core/fs_mgr
obj-m:=$(PWD)/main.c

default:
	$(MAKE) \
	ARCH=arm \
	CROSS_COMPILE=$(VAR_TOOLCHAIN) \
	-C $(KERNEL_DIR) \
	SUBDIRS=$(TEST_DIR) \
	main

main:
	$(VAR_TOOLCHAIN)$(CC) $(PWD)/main.c

clean:
	$(MAKE) -C $(KERNEL_DIR) SUBDIRS=$(PWD) clean