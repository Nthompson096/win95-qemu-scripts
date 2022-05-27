#!/bin/bash

#Are you root?

	if [ "$EUID" -ne 0 ];
	  then echo "Please run sudo"
		    exit
else
#Check if there's a dir, if there is; I will create a dir and copy files, if not skip.

echo -e "This installer will wget (download) an install disc/IE4 and add a few shortcuts inside your system. \n\
these shortcuts are found in /usr/bin/ and they can be modifed by entering /usr/share/win95/
These shortcuts are named aptly as win95nokvm (winstartnokvm.sh),win95kvm (winstartkvm.sh),win95cpu (cpu patch, w95cpu.sh),inst95 (start.sh) and uninst95. \n\
In short; would you like to continue this install of a virtual machine of windows 95 or a potential upgrade to 98 SE? \n\
Proceed with the install?"

fi
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Ok let's get started.."; break;;

		No ) echo "Goodbye."; exit;;
	esac
done

if [ ! -d /usr/share/win95 ]; then
mkdir /usr/share/win95 2> /dev/null && chmod +x ./*.sh && cp ./* -u /usr/share/win95/ 

fi
		if [ ! -f /usr/bin/win95nokvm ]; then
		echo "Creating shortcuts in for no KVM 95" && ln -sf /usr/share/win95/winstartnokvm.sh /usr/bin/win95nokvm 
		else
		[ -f /usr/bin/win95nokvm  ]
		fi
		#end
		if [ ! -f /usr/bin/win95kvm ]; then
		echo "Creating KVM shortcuts for win 95" && ln -sf /usr/share/win95/winstartkvm.sh /usr/bin/win95kvm 
		else
		[ -f /usr/bin/win95kvm ]
		fi
		#end
		if [ ! -f /usr/bin/uninst95  ]; then
		echo "Creating the uninstall terminal shortcut." && ln -sf /usr/share/win95/uninst95.sh /usr/bin/uninst95 
		else
		[ -f /usr/bin/uninst95 ]
		fi
		#end
		if [ ! -f /usr/bin/inst95 ]; then
		echo "Creating the install windows 95 shortcut for the terminal." && ln -sf /usr/share/win95/start.sh /usr/bin/inst95
 		else
 		[ -f /usr/bin/inst95 ]
		fi
		
		if [ ! -f /usr/bin/win95cpu ]; then
		echo "Creating the win95 cpu patch shotcut for KVM." && ln -sf /usr/share/win95/w95cpu.sh /usr/bin/win95cpu
		else
		[ -f /usr/bin/win95cpu ]
		fi

#Yo dawg where's the install disk? if it's here I'll see if the disc is downloaded anyway...

if [ -f /usr/share/win95/ie95.iso ] || [ ! -f /usr/share/win95/ie95.iso ]; then
echo "want to download IE-95?"
select yn in "Yes" "No"; do
    case $yn in
 		
 		Yes ) echo "grabbing ie 95" && 
	wget -c 'https://archive.org/download/ie4-win95-winnt/Internet%20Explorer%204.0%20for%20Windows%2095%20and%20NT%204.0.iso' -O /usr/share/win95/ie95.iso; break;;
        No ) mkisofs -o /usr/share/win95/ie95.iso /dev/null 2> /dev/null ; break;;
    esac
done

fi
#else if doesn't work, try elif, no doesn't work... hmmm, else works.. NOT
 
# [ ! -f /usr/share/win95/instdisc.iso ]

#Will create the new drive.

if [ ! -f /var/lib/libvirt/images/win95.qcow2 ]; then

		wget -c 'https://archive.org/download/microsoft-windows95-osr2/windows95osr2.iso' -O /usr/share/win95/instdisc.iso &&
		#mkisofs -o /usr/share/win95/windows95osr2.iso /dev/null && 
		qemu-img create -f qcow2 /var/lib/libvirt/images/win95.qcow2 2G && 
		chmod a+rwX /var/lib/libvirt/images/win95.qcow2 |& 
		cat /usr/share/win95/key.txt  &&
		 /usr/share/win95/win95.sh 2> /dev/null && 
		 /usr/share/win95/win95.sh 2> /dev/null &&  
		 /usr/share/win95/winstartnokvm.sh 2> /dev/null

else	 [ -f /var/lib/libvirt/images/win95.qcow2 ]
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

fi

if [ -f /var/lib/libvirt/images/win95.qcow2 ]; then
echo "Are you trying to continue an install"

select yn in "Yes" "No"; do
    case $yn in
 		
 		Yes ) cat /usr/share/win95/key.txt &
		/usr/share/win95/win95.sh 2> /dev/null && 
		/usr/share/win95/winstartnokvm.sh 2> /dev/null; break;;
        No )  break;;
    esac
done

fi

if [ -f /var/lib/libvirt/images/win95.qcow2 ]; then
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
#fi
#fi
#fi
