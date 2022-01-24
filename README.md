# win95-qemu
booting and creating a windows 95 vm with shell scripts, a mostly automated processes for qemu.

### To start/download these scripts

You would simply go to your terminal of choice and enter git clone https://github.com/Nthompson096/win95-qemu-scripts.git and it should clone to the directory of your choice. 

from there enter in the terminal enter ```chmod +x start.sh``` to make the installation script executable and then simply enter ``` ./start.sh ``` this will start scripts `windisc.sh` to create a disk image for win95, `win95.sh` to start the vm installation process and `winstartnokvm.sh` which will start win95 after the install; downloading the image will only take a few minutes depending on connection. If asked about overwriting any files, go ahead and enter `A` in terminal.

In the command prompt hit enter for the current selection and then enter `fdisk` to partition the disk as DOS and enter Y to all questions; press alt-m select machine > quit or hit ctrl-alt-g and select machine and quit; this will start up the vm again for you, hit enter for the first selection and then format the C: drive with the command `format c:` and enter `Y` and hit enter and it should format the `C:/ drive` when finished. You will be asked for a label, go ahead and name or enter nothing.

When that is done enter `D:\SETUP` to launch setup; hit enter and continue and hit yes, keep the default install location (C:\) and enter typical, hit next for where it will ask for your cd-key, in another terminal go to where you cloned this git project and enter `cat key.txt` to view a working cd key for win95 and enter what has been displayed. enter your username and company (optional) and check all the boxes when prompted (network and sound), install the click on typical, click continue, and enter a computer name or click next. don't use a startup cd for this setup when asked and it will copy all the files into the VM. Hit next when everything is finished. When all is done click next for the startup then hit finish and then hit quit in the qemu menu under machine > quit (alt-m) or ctrl-alt-g and select machine > quit. after all the files have been copied into the VM the machine will start for you, it will copy programs, etc inside the vm it will also ask from a username and password, you don't have to enter anything for the password. Be sure to hit on cancel when propted about adding a local or network printer. **THERE IS NO NEED TO INITATE THE COMMAND `start.sh` as all the files have been installed, do not do it again** Start your windows 95 install with winstart.sh at any time after you are done.

# Basic Troubleshooting

My install didn't download/install correctly, what should i do?
Check your internet connection, also run cleanup.sh; be sure to make this executable or just simply run it as `sh cleanup.sh`. However If you downloaded the required files (disk01.img and windows95b.iso) there would be no need and you can just run `./win95.sh` and `./winstart.sh`. when the install is finished.

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

Sadly I haven't figured out how to, the drivers keep erroring out if I install different drivers; could be because of my configs, could be because of the OS itself as it's ancient. Besides you won't be able to do much on the net anyway (unless if you wanted to share files with FTP). However you can make virtual-networking work by setting the irq freq to 9 under my computer > control panel > system > device manager > network adapters > double click on the network adapter and go to resources, and set the config manually (uncheck automatic settings), click change settings and set the value to 9, hit ok, and ok again; reboot when prompted. You may also need to go to control panel again and go to network, remove everything besides the network card then add TCP/IP and client > microsoft > client for micrsoft networks in that order.

After that is finished enter `./winstartnokvm.sh` in terminal.

# Sound is choppy

Sadly I have no idea what is causing this, like I said this OS is old so expect issues.

# Bounus, creating the VM with virt-manager

  <details><summary>w95 xml example.</summary>
<p>

  ```
  <domain type="kvm">
  <name>win95</name>
  <uuid></uuid>
  <metadata>
    <libosinfo:libosinfo xmlns:libosinfo="http://libosinfo.org/xmlns/libvirt/domain/1.0">
      <libosinfo:os id="http://microsoft.com/win/95"/>
    </libosinfo:libosinfo>
  </metadata>
  <memory unit="KiB">65536</memory>
  <currentMemory unit="KiB">65536</currentMemory>
  <vcpu placement="static">1</vcpu>
  <os>
    <type arch="x86_64" machine="pc-i440fx-6.2">hvm</type>
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
      <source file="path/to/w95.qcow"/>
      <target dev="hda" bus="ide"/>
      <boot order="3"/>
      <address type="drive" controller="0" bus="0" target="0" unit="0"/>
    </disk>
    <disk type="file" device="cdrom">
      <driver name="qemu" type="raw"/>
      <source file="path/to/iso"/>
      <target dev="hdb" bus="ide"/>
      <readonly/>
      <boot order="2"/>
      <address type="drive" controller="0" bus="0" target="0" unit="1"/>
    </disk>
    <disk type="file" device="floppy">
      <driver name="qemu" type="raw"/>
      <source file="path/to/floppy"/>
      <target dev="fda" bus="fdc"/>
      <boot order="1"/>
      <address type="drive" controller="0" bus="0" target="0" unit="0"/>
    </disk>
    <controller type="usb" index="0" model="ich9-ehci1">
      <address type="pci" domain="0x0000" bus="0x00" slot="0x05" function="0x7"/>
    </controller>
    <controller type="usb" index="0" model="ich9-uhci1">
      <master startport="0"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x05" function="0x0" multifunction="on"/>
    </controller>
    <controller type="usb" index="0" model="ich9-uhci2">
      <master startport="2"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x05" function="0x1"/>
    </controller>
    <controller type="usb" index="0" model="ich9-uhci3">
      <master startport="4"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x05" function="0x2"/>
    </controller>
    <controller type="pci" index="0" model="pci-root"/>
    <controller type="ide" index="0">
      <address type="pci" domain="0x0000" bus="0x00" slot="0x01" function="0x1"/>
    </controller>
    <controller type="virtio-serial" index="0">
      <address type="pci" domain="0x0000" bus="0x00" slot="0x06" function="0x0"/>
    </controller>
    <controller type="fdc" index="0"/>
    <interface type="network">
      <mac address="52:54:00:89:13:61"/>
      <source network="default"/>
      <model type="e1000"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x0"/>
    </interface>
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
    <sound model="ac97">
      <address type="pci" domain="0x0000" bus="0x00" slot="0x04" function="0x0"/>
    </sound>
    <audio id="1" type="spice"/>
    <video>
      <model type="qxl" ram="65536" vram="65536" vgamem="16384" heads="1" primary="yes"/>
      <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x0"/>
    </video>
    <redirdev bus="usb" type="spicevmc">
      <address type="usb" bus="0" port="2"/>
    </redirdev>
    <redirdev bus="usb" type="spicevmc">
      <address type="usb" bus="0" port="3"/>
    </redirdev>
    <memballoon model="virtio">
      <address type="pci" domain="0x0000" bus="0x00" slot="0x07" function="0x0"/>
    </memballoon>
  </devices>
</domain>

```
</p>
</details>


XML document above can be used to create a virtual for virt-manager you could just clone the created virtual w95 file and create a new install with virt-manager. You would need to install a program named FIXCPU95, just use the floppy.

http://lonecrusader.x10host.com/fix95cpu.html; however this fix is now on this github repository and will only be needed if you are having issues.
