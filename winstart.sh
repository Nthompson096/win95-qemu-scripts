#!/bin/sh

qemu-system-i386 -netdev user,id=mynet0 -device ne2k_isa,netdev=mynet0 -hda win95.qcow2 -device sb16 -m 64 -cpu pentium -vga cirrus -boot c -soundhw pcspk
