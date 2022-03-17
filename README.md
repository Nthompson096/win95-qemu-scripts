# win95-qemu
booting and creating a windows 95 vm with shell scripts, a mostly automated processes for qemu; linux only.

### To start/download these scripts

You would simply go to your terminal of choice and enter git clone https://github.com/Nthompson096/win95-qemu-scripts.git and it should clone to the directory of your choice; enter cd `win95-qemu-scripts` to enter that directory. 

from there enter in the terminal enter ```chmod +x start.sh``` to make the installation script executable and then simply enter ``` ./start.sh ``` this will start scripts `windisc.sh` to create a disk image for win95, `win95.sh` to start the vm installation process and `winstartnokvm.sh` which will start win95 after the install; downloading the image will only take a few minutes depending on connection. If asked about overwriting any files, go ahead and enter `N` in terminal.

In the command prompt hit enter for the current selection and then enter `fdisk` to partition the disk as DOS and enter Y to all questions; press alt-m select machine > quit or hit ctrl-alt-g and select machine and quit; this will start up the vm again for you, hit enter for the first selection and then format the C: drive with the command `format c:` and enter `Y` and hit enter and it should format the `C:\drive` when finished. You will be asked for a label, go ahead and name or enter nothing.

When that is done enter `D:\SETUP` to launch setup; hit enter and continue and hit yes, keep the default install location (C:\) and enter typical, hit next for where it will ask for your cd-key, in another terminal go to where you cloned this git project and enter `cat key.txt` to view a working cd key for win95 and enter what has been displayed. enter your username and company (optional) and check all the boxes when prompted (network and sound), install the click on typical, click continue, and enter a computer name or click next. don't use a startup cd for this setup when asked and it will copy all the files into the VM. Hit next when everything is finished. When all is done click next for the startup then hit finish and then hit quit in the qemu menu under machine > quit (alt-m) or ctrl-alt-g and select machine > quit. after all the files have been copied into the VM the machine will start for you, it will copy programs, etc inside the vm it will also ask from a username and password, you don't have to enter anything for the password. Be sure to hit on cancel when propted about adding a local or network printer. **THERE IS NO NEED TO INITATE THE COMMAND `start.sh` as all the files have been installed, do not do it again** Start your windows 95 install with winstart.sh at any time after you are done.

# Basic Troubleshooting

My install didn't download/install correctly, what should i do?
The downloads should resume even if internet has been disconnected and it should continue with the download (otherwise the script will not execute). If asked about overwriting files, enter `N` in terminal. Just run ./start.sh as it will format the qcow image.

I don't have QEMU installed, says command not found:

You will have to install qemu with package manager/linux flavor of your choice; 
1) for me it would be `sudo pacman -S qemu` this would be arch or manjaro.
2) For ubuntu or debian based linux it would be `sudo apt install qemu`
3) for fedora or redhat based linux it would be `sudo dnf install qemu`
These would be prime examples.

### Credits

https://wiki.qemu.org/Documentation/GuestOperatingSystems/Windows95 for this wonderful guide, also could give you more info.


# I want KVM support, but how can i do this?

First I would like to tell you KVM support on win95 is fincky; it doesn't shutoff properly like it's supposed to so i've made it run without kvm enabled, but if you want you can run kvm support with winstartkvm.sh, before you do so you will need to run w95cpu.sh otherwise the cpu on that machine will be in protection mode and will not boot, go ahead and patch when prompted to reboot quit, you should now be able to run win95 with kvm support with the script i just mentioned earlier.

# How can i connect to the internet?

### Guide on how to create virtual networking:
You need to go control panel and under network and add TCP/IP under `control panel > network > add .. > Protocol > TCP/IP` and you should be set; you also need to change the setting the irq freq to 9 under `my computer > control panel > system > device manager > network adapters > double click on the network adapter and go to resources, and set the config manually (uncheck automatic settings), click change settings and set the value to 9`, hit ok, and ok again; reboot when prompted.

UPDATE: Just connected to google search, was easy but most sites will crash on you; go to the icon named "the internet" and keep current settings, double click again and type in the url bar google.com. **DO NOT USE A MODEM OR ANYTHING ELSE**.

# I've created a virtual machine in virt-manager and there is no internet on my network!

Fret not; seeing how this is a virtual environment you could create a shared linux hard drive that's seperate to your windows. Install the linux of your choice.
<br /> `I use arch btw` <br />
All jokes aside, choose what you are ok with and mount windows; you may also just use a live-CD instead.

# Addtional Drivers 

1) IE4.0
to load just enter `./ie95.sh` 

2) Firefox
to load just enter `./ff95.sh` also included addtional drivers/ FTP Software; feel free to install if you are having issues want to share over the network somehow.

After that is finished enter `./winstartnokvm.sh` in terminal.

# Sound is choppy, there is no sound.

Sadly I have no idea what is causing this, like I said this OS is old so expect issues. Recently decided to remove 
-soundhw sb16 in the scripts but you can readd it if you'd like; be warned I had issues with BSOD.

Alternatively it would be best to just run the machine in virt-manager with the xml document I have provided below as it fixes the sound issue; new issue is that the network will not work, but you can use the shell scripts provided to work around this.

There is a wiki for a work around however:

https://wiki.osdev.org/Sound_Blaster_16#QEMU_support

# Bounus, creating the VM with virt-manager

  <details><summary>w95 xml example.</summary>
<p>

  ```
<metadata>
  <libosinfo:libosinfo xmlns:libosinfo="http://libosinfo.org/xmlns/libvirt/domain/1.0">
    <libosinfo:os id="http://microsoft.com/win/95"/>
  </libosinfo:libosinfo>
</metadata>
<memory unit="KiB">524288</memory>
<currentMemory unit="KiB">524288</currentMemory>
<vcpu placement="static">1</vcpu>
<os>
  <type arch="i686" machine="pc-i440fx-6.2">hvm</type>
  <boot dev="hd"/>
</os>
<features>
  <acpi/>
  <apic/>
  <hyperv mode="custom">
    <relaxed state="on"/>
    <vapic state="on"/>
    <spinlocks state="on" retries="8191"/>
  </hyperv>
  <vmport state="off"/>
</features>
<cpu mode="host-model" check="partial"/>
<clock offset="localtime">
  <timer name="rtc" tickpolicy="catchup"/>
  <timer name="pit" tickpolicy="delay"/>
  <timer name="hpet" present="no"/>
  <timer name="hypervclock" present="yes"/>
</clock>
<on_poweroff>destroy</on_poweroff>
<on_reboot>restart</on_reboot>
<on_crash>destroy</on_crash>
<pm>
  <suspend-to-mem enabled="no"/>
  <suspend-to-disk enabled="no"/>
</pm>
<devices>
  <emulator>/usr/bin/qemu-system-x86_64</emulator>
  <disk type="file" device="disk">
    <driver name="qemu" type="qcow2"/>
    <source file="/path/to/the/win95.qcow2"/>
    <target dev="hda" bus="ide"/>
    <address type="drive" controller="0" bus="0" target="0" unit="0"/>
  </disk>
  <disk type="file" device="cdrom">
    <driver name="qemu" type="raw"/>
    <source file="/path/to/the/instdisc.iso"/>
    <target dev="hdb" bus="ide"/>
    <readonly/>
    <address type="drive" controller="0" bus="0" target="0" unit="1"/>
  </disk>
  <controller type="usb" index="0" model="ich9-ehci1">
    <address type="pci" domain="0x0000" bus="0x00" slot="0x04" function="0x7"/>
  </controller>
  <controller type="usb" index="0" model="ich9-uhci1">
    <master startport="0"/>
    <address type="pci" domain="0x0000" bus="0x00" slot="0x04" function="0x0" multifunction="on"/>
  </controller>
  <controller type="usb" index="0" model="ich9-uhci2">
    <master startport="2"/>
    <address type="pci" domain="0x0000" bus="0x00" slot="0x04" function="0x1"/>
  </controller>
  <controller type="usb" index="0" model="ich9-uhci3">
    <master startport="4"/>
    <address type="pci" domain="0x0000" bus="0x00" slot="0x04" function="0x2"/>
  </controller>
  <controller type="pci" index="0" model="pci-root"/>
  <controller type="ide" index="0">
    <address type="pci" domain="0x0000" bus="0x00" slot="0x01" function="0x1"/>
  </controller>
  <controller type="virtio-serial" index="0">
    <address type="pci" domain="0x0000" bus="0x00" slot="0x05" function="0x0"/>
  </controller>
  <serial type="pty">
    <target type="isa-serial" port="0">
      <model name="isa-serial"/>
    </target>
  </serial>
  <console type="pty">
    <target type="serial" port="0"/>
  </console>
  <channel type="spicevmc">
    <target type="virtio" name="com.redhat.spice.0"/>
    <address type="virtio-serial" controller="0" bus="0" port="1"/>
  </channel>
  <input type="tablet" bus="usb">
    <address type="usb" bus="0" port="1"/>
  </input>
  <input type="mouse" bus="ps2"/>
  <input type="keyboard" bus="ps2"/>
  <graphics type="spice" autoport="yes">
    <listen type="address"/>
    <image compression="off"/>
  </graphics>
  <sound model="sb16"/>
  <audio id="1" type="spice"/>
<video>
<model type="cirrus" vram="16384" heads="1" primary="yes"/>
<alias name="video0"/>
<address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x0"/>
</video>
  <redirdev bus="usb" type="spicevmc">
    <address type="usb" bus="0" port="2"/>
  </redirdev>
  <redirdev bus="usb" type="spicevmc">
    <address type="usb" bus="0" port="3"/>
  </redirdev>
  <memballoon model="virtio">
    <address type="pci" domain="0x0000" bus="0x00" slot="0x06" function="0x0"/>
  </memballoon>
 </devices>
</domain>
```
</p>
</details>


The XML document above can be used to create a virtual machine with virt-manager, you can also use the existng image you created with the terminal to create your win96 virtual machine; I wouldn't advise on touching the UUID, just touch the `<domain type="">` and change it to `qemu`. If you want to do stuff purely on terminal you would need to install a program named FIXCPU95.

http://lonecrusader.x10host.com/fix95cpu.html; however this fix is now on this github repository and will only be needed if you are having issues (fast CPU under KVM).
