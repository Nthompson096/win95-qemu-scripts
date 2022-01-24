#!/bin/sh

	qemu-system-i386 \
	-device ne2k_isa,netdev=win95net0 \
	-netdev user,id=win95net0,restrict=off \
	-drive file=win95.qcow2,format=qcow2 \
	-m 64 \
	-cpu pentium \
	-vga cirrus \
	-boot order=a \
        #-cdrom  \
	#-drive file=,format=,index=0,if=floppy
	
	# comments
	# Basically what -cdrom does is to define where and what the cdrom image is, usful for sharing files on this VM
	# drive file basically points to the hard drive or floppy, whichever is defined.
	# drive file=.img,format=raw,index=0,if=floppy, just be sure to define the format and where the file is.
	# you can play around with this if you'd want.
