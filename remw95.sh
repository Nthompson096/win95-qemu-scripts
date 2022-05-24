#!/bin/sh
if [[ -f /usr/bin/win95kvm ]]; then
				rm /usr/bin/win95kvm
				[[ -f /usr/bin/win95nokvm ]]
				 rm /usr/bin/win95nokvm 
				 [[ -f /usr/bin/uninst95 ]] 
				    rm /usr/bin/uninst95
				[[ -f /var/lib/libvirt/images/win95.qcow2 ]]
				     rm /var/lib/libvirt/images/win95.qcow2
				    [[ -d /usr/share/win95/ ]] 
				     rm -r /usr/share/win95/;				    
fi
