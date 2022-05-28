#!/bin/sh
	
	if [ -f /usr/bin/win95kvm ]; then
	rm /usr/bin/win95kvm fi
	
	if [ -f /usr/bin/win95nokvm ]; then
	rm /usr/bin/win95nokvm fi
	
	if [ -f /usr/bin/uninst95 ] ; then
	rm /usr/bin/uninst95 fi

	if [ -f /usr/bin/inst95 ] ; then
	rm /usr/bin/inst95 fi
	
	if [ -f /usr/bin/win95cpu ]; then
	rm /usr/bin/win95cpu fi
	
	if [ -f /var/lib/libvirt/images/win95.qcow2 ]; then
	rm /var/lib/libvirt/images/win95.qcow2 fi
    
    if [ -d /usr/share/win95/ ]; then 
	rm -r /usr/share/win95/ fi
