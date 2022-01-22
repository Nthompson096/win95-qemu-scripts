# win95-qemu
booting and creating a windows 95 vm with shell scripts, a mostly automated processes for qemu.

### To start/download these scripts

You would simply go to your terminal of choice and enter git clone https://github.com/Nthompson096/win95-qemu-scripts.git and it should clone to the directory of your choice. 

from there enter in the terminal enter ```chmod +x start.sh``` to make the installation script executable and then simply enter ``` ./start.sh ``` this will start scripts windisc.sh to create a disk image for win95, win95.sh to start the vm installation process and winstart.sh which will start win95 after the install; downloading the images will only take a few minutes depending on connection. If asked about overwriting any files, go ahead and enter `A` in terminal.

In the command prompt hit enter for the current selection and then enter ```fdisk``` to partition the disk as DOS and enter Y to all questions; press alt-m select machine > quit or hit ctrl-alt-g and select machine and quit; this will start up the vm again for you, hit enter for the first selection and then format the C: drive with the command ```format c:``` and enter `Y` and hit enter and it should format the C:/ drive when finished. You will be asked for a label, go ahead and name or enter nothing.

When that is done enter ```D:\SETUP``` to launch setup; hit enter and continue and hit yes, keep the default install location (C:\) and enter typical, hit next for where it will ask for your cd-key, in another terminal go to where you cloned this git project and enter ```cat key.txt``` to view a working cd key for win95 and enter what has been displayed. enter your username and company (optional) and check all the boxes when prompted (network and sound), install the most common componets and enter a computer name or click next. don't use a startup cd for this setup when asked and it will copy all the files into the VM. Hit next when everything is finished. When all is done click next for the startup then hit finish and then hit quit in the qemu menu under machine > quit (alt-m) or ctrl-alt-g and select machine > quit. after all the files have been copied into the VM the machine will start for you, it will copy programs, etc inside the vm it will also ask from a username and password, you don't have to enter anything for the password. Be sure to hit on cancel when propted about adding a local or network printer. **THERE IS NO NEED TO INITATE THE COMMAND ```start.sh``` as all the files have been installed, do not do it again** Start your windows 95 install with winstart.sh at any time after you are done.

# Basic Troubleshooting

My install didn't download/install correctly, what should i do?
Check your internet connection, also run cleanup.sh; be sure to make this executable or just simply run it as `sh cleanup.sh`

### Credits

https://wiki.qemu.org/Documentation/GuestOperatingSystems/Windows95 for this wonderful guide, also could give you more info. If you downloaded the required files (disk01.img and windows95b.iso) there would be no need and you can just run `./win95.sh`.
