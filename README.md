# win95-qemu
booting and creating a windows 95 vm with shell scripts, a mostly automated processes for qemu; linux only.

## ***I would highly recommend virt-manager for now; if using a different distro other than arch-based or redhat linux***

### To start download these scripts

You would simply go to your terminal of choice and enter git clone `https://github.com/Nthompson096/win95-qemu-scripts.git` 
and it should clone to the directory of your choice; enter cd `win95-qemu-scripts` to enter that directory. 

from there enter in the terminal enter `sudo sh ./start.sh` and this will start the installation process, to run these commands all in one do this:
1) arch based `sudo pacman -Syyu && sudo pacman -S virt-manager qemu && git clone https://github.com/Nthompson096/win95-qemu-scripts.git && cd win95-qemu-scripts && sudo sh ./start.sh`
2) `sudo dnf update -y && sudo dnf install -y virt-manager qemu && git clone https://github.com/Nthompson096/win95-qemu-scripts.git && cd win95-qemu-scripts && sudo sh ./start.sh`. Should only take a few moments in time to download the install disks and IE95. If asked to replace these files, enter `2`. If you'd like to install additonal drivers after the install from an ISO file with qemu from the command line; run the install program again, enter `2` up until `it asks if you'd like to install additonal drivers`; enter `1` for yes, this will ask you this after everything else initally.

In the command prompt hit enter for the current selection and then enter `fdisk` to partition the disk as DOS and enter Y to all questions; `press alt-m select machine > quit or hit ctrl-alt-g and select machine and quit` or `ctrl+alt+q`; the install script should install the script for you. this will start up the vm again for you, hit enter for the first selection and then format the C: drive with the command `format c:` and enter `Y` and hit enter and it should format the `C:\drive` when finished. You will be asked for a label, go ahead and name or enter nothing.

When that is done enter `D:\SETUP` to launch setup; hit enter and continue and hit yes, keep the default install location (C:\) and enter typical, hit next for where it will ask for your cd-key, in the same terminal you should see your product key; if not in another terminal enter `cat key.txt` to view a working cd key for win95 and enter what has been displayed. enter your username and company (optional) and check all the boxes when prompted (network and sound), install the click on typical, click continue, and enter a computer name or click next. don't use a startup cd for this setup when asked and it will copy all the files into the VM. Hit next when everything is finished. When all is done click next for the startup then hit finish and then hit quit in the qemu menu under machine > quit (alt-m) or ctrl-alt-g and select machine > quit. after all the files have been copied into the VM the machine will start for you, it will copy programs, etc inside the vm it will also ask from a username and password, you don't have to enter anything for the password. Be sure to hit on cancel when prompted about adding a local or network printer. you may restart your windows 95 install with wininst at any time after you are done.

to uninstall windows 95 off of your system via terminal enter `sudo uninst95`

# Basic Troubleshooting

## My install didn't download/install correctly, what should i do?
The downloads should resume even if internet has been disconnected and it should continue with the download; you also have the option to redownload images. If asked about overwriting files, enter `2` in terminal unless if you have a specific reason like you'd want to overwite your virtual hard disk in `/usr/lib/libvirt/images/`.

*If anything else fails, just reinstall.*

***UPDATE:***
for additonal drivers or a reinstall, just run the inst95 as sudo inside terminal after the inital.

## I don't have QEMU installed, says command not found:

You will have to install qemu with package manager/linux flavor of your choice; 
1) for me it would be `sudo pacman -S qemu` this would be arch or manjaro; also be sure to install qemu-full; if having issues with manjaro be sure to update then install.
2) for fedora or redhat based distros, use `sudo dnf install qemu`
3) So far this script works for arch or redhat based linux; ubuntu or apt based linux is giving me issues.

# I want KVM support, but how can i do this?

First I would like to tell you KVM support on win95 is fincky; it doesn't shutoff properly like it's supposed to so i've made it run without kvm enabled, but if you want you can run kvm support with winstartkvm.sh, before you do so you will need to run w95cpu.sh otherwise the cpu on that machine will be in protection mode and will not boot, go ahead and patch when prompted to reboot quit, you should now be able to run win95 with kvm support with the script i just mentioned earlier.

# How can i connect to the internet?

### Guide on how to create virtual networking:
You need to go control panel and under network and add TCP/IP under `control panel > network > add .. > Protocol > TCP/IP` and you should be set; you also need to change the setting the `irq freq to 9` under 
`my computer >` `control panel > system > device manager > network adapters > double click on the network adapter and go to resources`, and set the config manually (uncheck automatic settings), 
`click change settings and set the value to 9`, hit ok twice; reboot when prompted.

UPDATE: Just connected to google search, was easy but most sites will crash on you; go to the icon named "the internet" and keep current settings, double click again and type in the url bar google.com. <br/>
**DO NOT USE A MODEM OR ANYTHING ELSE**.

# I've created a virtual machine in virt-manager and there is no internet on my network!

Fret not; seeing how this is a virtual environment you could create a shared linux hard drive that's seperate to your windows. Install the linux of your choice.
<br/>`I use arch btw`<br/>
All jokes aside, choose what you are ok with and mount windows; you may also just use a live-CD instead.

# Addtional Drivers 

To load additonal drivers, you would have to restart the installation process or start the script by entering `./usr/share/win95/start.sh` <br/>
Included are the following; ftp drivers, internet explorer 4.0, firefox etc etc.


# Sound is choppy, there is no sound.

Sadly I have no idea what is causing this, like I said this OS is old so expect issues. Recently decided to remove 
-soundhw sb16 in the scripts but you can re-add it if you'd like; be warned I had issues with BSOD.

Alternatively it would be best to just run the machine in virt-manager with the xml document I have provided below as it fixes the sound issue; new issue is that the network will not work, but you can use the shell scripts provided to work around this.

[There is a wiki for a work around however.](https://wiki.osdev.org/Sound_Blaster_16#QEMU_support)

# Bounus, creating the VM with virt-manager

[the example XML document hosted inside this repo; it's TL:DR](https://raw.githubusercontent.com/Nthompson096/win95-qemu-scripts/main/example-win95.xml)


The XML document above can be used to create a virtual for virt-manager; be sure to set the flag to <br /> `<domain type="qemu">` at the start of the xml document. You could've also instead cloned the created virtual w95 file and create a new install with virt-manager or use the exisitng image. You would need to install a program named FIXCPU95, just use the floppy if doing everything by the command line. Also be sure to copy paste everything after UUID or adjust the values if needed.

[lonecrusader fix95cpu](http://lonecrusader.x10host.com/fix95cpu.html); however this fix is now on this github repository and will only be needed if you are having issues (fast CPU under KVM).

# EoF:

### Credits
https://wiki.qemu.org/Documentation/GuestOperatingSystems/Windows95 for this wonderful guide, also could give you more info.

Thank you for checking out this repoisitory, be sure to star it if you ever find this useful.
