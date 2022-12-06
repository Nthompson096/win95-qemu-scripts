#!/bin/sh

qemu-system-i386 \
	-device ne2k_isa,netdev=win95net0 \
       	-netdev user,id=win95net0,restrict=off	\
	-drive file=/var/lib/libvirt/images/win95.qcow2,format=qcow2 \
	-m 64 \
	-cpu pentium \
	-vga cirrus \
	-fda /usr/share/win95/disk01.img \
	-cdrom /usr/share/win95/instdisc.iso \
	-boot a \
