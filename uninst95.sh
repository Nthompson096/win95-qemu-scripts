#!/bin/sh
if [[ "$EUID" -ne 0 ]];
	  then echo "Please run sudo."
		    exit
else

	  [[ "$EUID" -ne 1 ]];

fi

echo "Are you sure you want to completely remove windows 95?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) rm /usr/bin/win95kvm && rm /usr/bin/win95nokvm && rm /var/lib/libvirt/images/win95.qcow2 && echo "win95 uninstalled." && rm /usr/bin/uninst95.sh && rm -r /usr/share/win95; break;;
        No ) exit;;
    esac
done