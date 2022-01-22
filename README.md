# win95-qemu
booting and creating a windows 95 vm with shell scripts, a mostly automated processes for qemu.

#To start/download these scripts

You would simply go to your terminal of choice and enter git clone and it should clone to the directory of your choice. 
from there enter in the terminal enter ``` ./windisc.sh ``` this will srart another script win95.sh; from there you will need to hit enter too enable cd-rom support. 
In the command prompt enter ```fdisk``` to partition the disk as DOS and enter Y to all questions; press alt-m and poweroff then enter from terminal ``` win95.sh ``` to continue the setup process; format the C: drive with the command ```format c``` and yes and enter and it should format the C:/ drive when finished. 
When that is done enter ```D:\SETUP``` to launch setup; hit next and enter typical, hit next for where to install enter your username and company (optional) and check all the boxes when prompted (network and sound), enter the key. to view the key supplied enter ```cat key.txt``` in terminal,  don't use a startup cd for this setup when asked. Hit next when everything is finished and it should copy all the files into the C: drive.
