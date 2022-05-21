#!/bin/sh

#Are you root?

	if [[ "$EUID" -ne 0 ]];
	  then echo "Please run sudo."
		    exit
	else 
	 if [[ "$EUID" -ne 1 ]];
	  then echo "Copying everyting to user share."

#Check if there's a dir, if there is; I will create a dir and copy files, if not skip.

	if [[ ! -d /usr/share/win95 ]]; then
		mkdir /usr/share/win95 && chmod +x ./*.sh && cp ./* /usr/share/win95

	else

	if [[ -d /usr/share/win95 ]]; then
		echo "skipping dir"

#Yo dawg where's the install disk? if it's here I'll see if the disc is downloaded anyway...

if [[ ! -f /usr/share/win95/ie95.iso ]]; then
	echo "grabbing ie 95" && wget -c 'https://archive.org/download/ie4-win95-winnt/Internet%20Explorer%204.0%20for%20Windows%2095%20and%20NT%204.0.iso' -O /usr/share/win95/ie95.iso
	
	else
	
	if [[ -f /usr/share/win95/ie95.iso ]]; then
			echo "grabbing ie 95" && wget -c 'https://archive.org/download/ie4-win95-winnt/Internet%20Explorer%204.0%20for%20Windows%2095%20and%20NT%204.0.iso' -O /usr/share/win95/ie95.iso

	if [[ ! -f /usr/share/win95/instdisc.iso ]]; then
		wget -c 'https://archive.org/download/X03-56247/Microsoft%20Windows%2095C%20%284.03.1216%29%20%28OSR2.5%29%20%2811-26-1997%29%20%28US-English%29.iso' -O /usr/share/win95/instdisc.iso
	else
	
	if [[ -f /usr/share/win95/instdisc.iso ]]; then
		wget -c 'https://archive.org/download/X03-56247/Microsoft%20Windows%2095C%20%284.03.1216%29%20%28OSR2.5%29%20%2811-26-1997%29%20%28US-English%29.iso' -O /usr/share/win95/instdisc.iso

#Will format even if missing...

	if [[ ! -f /var/lib/libvirt/images/win95.qcow2 ]]; then
		qemu-img create -f qcow2 /var/lib/libvirt/images/win95.qcow2 2G && chmod a+rwX /var/lib/libvirt/images/win95.qcow2 && echo -e "\n\n\n\n" && cat /usr/share/win95/key.txt && echo -e "\n\n\n\n" && ./win95.sh && ./win95.sh && /usr/share/win95/winstartnokvm.sh

	else		

	if [[ -f /var/lib/libvirt/images/win95.qcow2 ]]; then
		echo "Win95 HDD exists, restarting install" &&  qemu-img create -f qcow2 /var/lib/libvirt/images/win95.qcow2 2G && chmod a+rwX /var/lib/libvirt/images/win95.qcow2 && echo -e "\n\n\n\n" && cat /usr/share/win95/key.txt && echo -e "\n\n\n\n" && ./win95.sh  && ./win95.sh && /usr/share/win95/winstartnokvm.sh

	if [[ ! -f /usr/bin/win95nokvm ]]; then
		echo "Creating shortcuts in /usr/bin for no win95kvm" && ln -s /usr/share/win95/winstartnokvm.sh /usr/bin/win95nokvm

	else 
	
	if [[ -f /usr/bin/win95nokvm ]]; then
		 echo "skipping nokvm shortcuts"


	if [[ ! -f /usr/bin/win95kvm ]]; then
		echo "Creating KVM shortcuts for win 95" && ln -s /usr/share/win95/winstartkvm.sh /usr/bin/win95kvm

	else

	if [[ -f /usr/bin/win95kvm ]]; then
		echo "skipping KVM shortcuts for windows 95"
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
