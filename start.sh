#!/bin/sh

#Are you root?

	if [[ "$EUID" -ne 0 ]];
	  then echo "Please run sudo."
		    exit
else
#Check if there's a dir, if there is; I will create a dir and copy files, if not skip.	

[[ ! -d /usr/share/win95 ]] 
mkdir /usr/share/win95 2> /dev/null && 
chmod +x ./*.sh && 
cp ./* /usr/share/win95 

#Yo dawg where's the install disk? if it's here I'll see if the disc is downloaded anyway...
 
 [[ ! -f /usr/share/win95/ie95.iso ]]
#touch /usr/share/win95/ie95.iso
	echo "grabbing ie 95" && 
	wget -c 'https://archive.org/download/ie4-win95-winnt/Internet%20Explorer%204.0%20for%20Windows%2095%20and%20NT%204.0.iso' -O /usr/share/win95/ie95.iso
	
	if  [[ -f /usr/share/win95/ie95.iso ]]; then 
			#/usr/share/win95/ie95.iso
			echo "grabbing ie 95" && 
			wget -c 'https://archive.org/download/ie4-win95-winnt/Internet%20Explorer%204.0%20for%20Windows%2095%20and%20NT%204.0.iso' -O /usr/share/win95/ie95.iso 2> /dev/null

	

#else if doesn't work, try elif, no doesn't work... hmmm, else works..

	 [[ ! -f /usr/share/win95/instdisc.iso ]]; #then
		wget -c 'https://archive.org/download/microsoft-windows95-osr2/windows95osr2.iso' -O /usr/share/win95/instdisc.iso
	
	 if [[ -f /usr/share/win95/instdisc.iso ]]; then
		echo "file exists, replace?"

select yn in "Yes" "No"; do
    case $yn in
        Yes ) wget 'https://archive.org/download/microsoft-windows95-osr2/windows95osr2.iso' -O /usr/share/win95/instdisc.iso; break;;
        No ) break;;
    esac
done

#Will format even if not missing...

	if [[ ! -f /var/lib/libvirt/images/win95.qcow2 ]]; then
		qemu-img create -f qcow2 /var/lib/libvirt/images/win95.qcow2 2G && 
		chmod a+rwX /var/lib/libvirt/images/win95.qcow2 && 
		echo -e "\n\n\n\n" && 
		cat /usr/share/win95/key.txt && 
		echo -e "\n\n\n\n" &&
		 ./win95.sh && 
		 ./win95.sh && 
		 /usr/share/win95/winstartnokvm.sh

	else [[ -f /var/lib/libvirt/images/win95.qcow2 ]]; #then
		echo "Win95 HDD exists, format virtual drive?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) qemu-img create -f qcow2 /var/lib/libvirt/images/win95.qcow2 2G && 
		chmod a+rwX /var/lib/libvirt/images/win95.qcow2 && echo -e "\n\n\n\n" && 
		cat /usr/share/win95/key.txt && echo -e "\n\n\n\n" && 
		./win95.sh  && 
		./win95.sh && 
		/usr/share/win95/winstartnokvm.sh; break;;
        No ) cat /usr/share/win95/key.txt && 
		echo -e "\n\n\n\n" && 
		./win95.sh  && 
		./win95.sh && 
		/usr/share/win95/winstartnokvm.sh; break;;
    esac
done


	if  [[ ! -f /usr/bin/win95nokvm ]]; then
		echo "Creating shortcuts in /usr/bin for no win95kvm" && ln -s /usr/share/win95/winstartnokvm.sh /usr/bin/win95nokvm

	else [[ -f /usr/bin/win95nokvm ]]; #then
		 echo "skipping nokvm shortcuts"


	if [[ ! -f /usr/bin/win95kvm ]]; then
		echo "Creating KVM shortcuts for win 95" && ln -s /usr/share/win95/winstartkvm.sh /usr/bin/win95kvm

	else [[ -f /usr/bin/win95kvm ]]; #then
		echo "skipping KVM shortcuts for windows 95"
fi
fi
fi
fi
fi
fi
