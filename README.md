# win95-qemu
booting and creating a windows 95 vm with shell scripts, a mostly automated processes for qemu.

### To start/download these scripts

You would simply go to your terminal of choice and enter git clone https://github.com/Nthompson096/win95-qemu-scripts.git and it should clone to the directory of your choice. 

from there enter in the terminal enter ```chmod +x start.sh``` to make the installation script executable and then simply enter ``` ./start.sh ``` this will start scripts windisc.sh to create a disk image for win95, win95.sh to start the vm installation process and winstart.sh which will start win95 after the install; downloading the images will only take a few minutes depending on connection.

In the command prompt hit enter for the current selection and then enter ```fdisk``` to partition the disk as DOS and enter Y to all questions; press alt-m select poweroff; this will start up the vm again for you, hit enter for the first selection and then format the C: drive with the command ```format c``` and yes and enter and it should format the C:/ drive when finished.

When that is done enter ```D:\SETUP``` to launch setup; hit next and enter typical, hit next for where to install enter your username and company (optional) and check all the boxes when prompted (network and sound), enter the key. 

to view the key supplied enter ```cat key.txt``` in terminal,  don't use a startup cd for this setup when asked. Hit next when everything is finished and it should copy all the files into the C: drive. When all is done click next for the startup when everything is copied and hit quit in the qemu menu under file > quit. after all the files have been copies into the VM the machine will start for you, *THERE IS NO NEED TO INITATE THE COMMAND ```start.sh``` as all the files have been installed* Start your windows 95 install with winstart.sh at any time after you are done.
