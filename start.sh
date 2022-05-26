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
cp ./* -u /usr/share/win95/ &&

[[ ! -f /usr/bin/win95nokvm ]]
		echo "Creating shortcuts in /usr/bin for no win95kvm" && ln -sf /usr/share/win95/winstartnokvm.sh /usr/bin/win95nokvm 
[[ -f /usr/bin/win95nokvm ]]
		 echo "Created no KVM shotcuts"


[[ ! -f /usr/bin/win95kvm ]]
		echo "Creating KVM shortcuts for win 95" && ln -sf /usr/share/win95/winstartkvm.sh /usr/bin/win95kvm 

[[ -f /usr/bin/win95kvm ]]
		echo "Created KVM shortcuts for windows 95"

 [[ ! -f /usr/bin/uninst95 ]]
		echo "Creating the uninstall terminal shortcut." && ln -sf /usr/share/win95/uninst95.sh /usr/bin/uninst95 

[[ -f /usr/bin/uninst95 ]]
		echo "Created the uninstall terminal shortcut."

 [[ ! -f /usr/bin/inst95 ]]
		echo "Creating the win95 install terminal shortcut." && ln -sf /usr/share/win95/start.sh /usr/bin/inst95

[[ -f /usr/bin/inst95 ]]
		echo "Created the win95 install terminal shortcut."

		 [[ ! -f /usr/bin/inst95 ]]
		echo "Creating the win95 cpu patch for KVM." && ln -sf /usr/share/win95/w95cpu.sh /usr/bin/win95cpu

[[ -f /usr/bin/inst95 ]]
		echo "Created the win95 cpu patch for KVM."

#Yo dawg where's the install disk? if it's here I'll see if the disc is downloaded anyway...

 
[[ ! -f /usr/share/win95/ie95.iso ]]
#touch /usr/share/win95/ie95.iso
	echo "grabbing ie 95" && 
	wget -c 'https://archive.org/download/ie4-win95-winnt/Internet%20Explorer%204.0%20for%20Windows%2095%20and%20NT%204.0.iso' -O /usr/share/win95/ie95.iso;
	
#else if doesn't work, try elif, no doesn't work... hmmm, else works.. NOT
 
[[ ! -f /usr/share/win95/instdisc.iso ]]
		wget -c 'https://archive.org/download/microsoft-windows95-osr2/windows95osr2.iso' -O /usr/share/win95/instdisc.iso;


#Will create the new drive.

if [[ ! -f /var/lib/libvirt/images/win95.qcow2 ]]; then

		qemu-img create -f qcow2 /var/lib/libvirt/images/win95.qcow2 2G && 
		chmod a+rwX /var/lib/libvirt/images/win95.qcow2 |& 
		cat /usr/share/win95/key.txt  &&
		 /usr/share/win95/win95.sh 2> /dev/null && 
		 /usr/share/win95/win95.sh 2> /dev/null &&  
		 /usr/share/win95/winstartnokvm.sh 2> /dev/null

else	 [[ -f /var/lib/libvirt/images/win95.qcow2 ]]
		echo "Win95 HDD exists, format virtual drive?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) qemu-img create -f qcow2 /var/lib/libvirt/images/win95.qcow2 2G && 
		chmod a+rwX /var/lib/libvirt/images/win95.qcow2 |& 
		cat /usr/share/win95/key.txt &
		/usr/share/win95/win95.sh 2> /dev/null  && 
		/usr/share/win95/win95.sh  2> /dev/null &&
		/usr/share/win95/winstartnokvm.sh 2> /dev/null; break;;

		No ) break;;
	esac
done

if [[ -f /var/lib/libvirt/images/win95.qcow2 ]]; then
echo "Are you trying to continue an install"

select yn in "Yes" "No"; do
    case $yn in
 		
 		Yes ) cat /usr/share/win95/key.txt &
		/usr/share/win95/win95.sh 2> /dev/null && 
		/usr/share/win95/winstartnokvm.sh 2> /dev/null; break;;
        No )  break;;
    esac
done

if [[ -f /var/lib/libvirt/images/win95.qcow2 ]]; then
echo "Would you like to upgrade this machine from 95 to 98 SE?"

select yn in "Yes" "No"; do
    case $yn in
 		
 		Yes ) wget -c 'https://archive.org/download/windows-98-se-upgrade/Windows%2098%20se%20Upgrade.iso' -O /usr/share/win95/win98se.iso &&
		 touch ./98key.txt |& echo VYK42-6KXD9-2C333-3D898-J97HP > ./98key.txt && cat ./98key.txt && /usr/share/win95/win95-up.sh; break;;
        No )  break;;
    esac
done


echo "want to install additonal drivers for windows 95?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) /usr/share/win95/ie95.sh; break;;
        No ) exit;;
    esac
done

fi
fi
fi
fi
