# make file for a single new non-default kernel module, in this case, a USB driver for the LEGO MINDSTORMS RCX USB IR Tower
obj-m	:= legousbtower.o

# Other default kernel modules for the /driver/usb/misc dir in the Uno Q distro image
# obj-m	:= qcom_eud.o
# obj-m	:= onboard_usb_dev.o

# KERNELDIR can be overridden on the command line, 
# but defaults to the build directory for the currently running kernel
KERNELDIR = /home/runner/work/UnoQKernelModules/UnoQKernelModules/linux-qcom
# PWD = /home/runner/work/UnoQKernelModules/UnoQKernelModules/linux-qcom/drivers/usb/misc
PWD = $(shell PWD)

# Define targets: 'all' to build the module, 'clean' to remove generated files
all:
	$(MAKE) -j$(shell nproc) -C $(KERNELDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
