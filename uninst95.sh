#!/bin/sh

if [[ "$EUID" -ne 0 ]];
	  then echo "Please run sudo."
		    exit
else
	 if [[ "$EUID" -ne 1 ]];
	  then echo "removing windows 95"

	  if [[ ! -d /usr/share/win95 ]]; then
	echo "No directory, will see if there's any shortcuts."

else

if [[ -d /usr/share/win95 ]]; then
	rm -r /usr/share/win95 && rm /usr/bin/win95kvm && rm /usr/bin/win95nokvm && rm /var/lib/libvirt/images/win95.qcow2 && echo "win95 uninstalled."

	if [[ ! -f /usr/bin/win95kvm  ]]; then
		echo "No shortcuts, probably already uninstalled or maybe the uninstaller took care of it" 
else

		if [[ /usr/bin/win95kvm ]]; then
		 	 rm /usr/bin/win95kvm && echo "win95 shortcut (non-kvm) uninstalled."

if [[ ! -f /usr/bin/win95nokvm ]]; then
	echo "no win95 virtual shortcut (non-kvm) detected"

else
	 	 if [[ -f /usr/bin/win95nokvm ]]; then
		 	 rm /usr/bin/win95nokvm && echo "win95 shortcut (no-kvm) uninstalled."

		 	fi
		 fi
	fi
fi
fi
fi
fi
fi