#!/bin/sh

qemu-system-i386 \
	-device ne2k_isa,netdev=win95net0 \
       	-netdev user,id=win95net0,restrict=off	\
	-drive file=win95.qcow2,format=qcow2 \
	-m 64 \
	-cpu pentium \
	-vga cirrus \
	-fda disk01.img \
	-cdrom windows95b.iso \
	-boot a \
	-soundhw pcspk 
