#!/bin/sh

	qemu-system-i386 \
	-boot order=a \
	-m 64 \
	-cpu pentium \
	-vga cirrus \
	-rtc base=localtime \
	-drive file=/var/lib/libvirt/images/win95.qcow2,format=qcow2 \
	-drive file=/usr/share/win95/FIX95CPU.IMA,format=raw,index=0,if=floppy 
