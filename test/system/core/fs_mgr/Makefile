
obj-m := main.c
default:
	    $(MAKE) ARCH=arm CROSS_COMPILE=$(VAR_TOOLCHAIN)- -C $(KERNEL_DIR) SUBDIRS=$(PWD) modules
clean:
	    $(MAKE) -C $(KERNEL_DIR) SUBDIRS=$(PWD) clean
