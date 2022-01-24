#!/bin/sh

qemu-system-i386 \
	-netdev user,id=win95net0 \
	-device ne2k_isa,netdev=win95net0 \
       	-netdev user,id=win95net0,net=192.168.0.0/16,dhcpstart=192.168.0.1,restrict=off	\
	-drive file=win95.qcow2,format=qcow2 \
	-m 64 \
	-cpu pentium \
	-vga cirrus \
	-fda disk01.img \
	-cdrom windows95b.iso \
	-boot a \
	-soundhw pcspk 
