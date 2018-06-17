# Linux Remaster Tools

[TOC]

## Summary


## Links
- https://lkubuntu.wordpress.com/2011/10/10/relinux-a-way-to-create-a-bootable-iso-out-of-your-system/
- https://sourceforge.net/projects/uck/
- http://dbad-license.org/
- http://www.wtfpl.net/txt/copying



## Tools

### Pinguy Builder
https://sourceforge.net/projects/pinguy-os/files/ISO_Builder/
Last update: 2018-05-22
- Version 5.* works with *buntu systems 17.04/17.10/18.04
- Single package for Script and GUI.
- EFI support including EFI partition on ISO.
- Populate pool folder with grub-efi for offline installing.
- Update grub entry with the named used for the CD label.
- Uses XZ to compress the filesystem.squashfs for smaller ISO size.
- Added MDM support (Linux Mint display manager).
- Added GDM support (Gnome Shell display manager).
- Install:
	- get Pinguy Builder 5.*
	- `sudo apt-get purge pinguybuilder`
	- `sudo dpkg -i pinguybuilder*.deb`
	- `sudo apt-get install -f`

### Linux Live Kit
https://www.linux-live.org/
https://github.com/Tomas-M/linux-live
- Set of scripts to turn existing preinstalled Linux
distribution into a Live Kit
- Use it on a posix-compatible filesystem

### customizer
https://github.com/kamilion/customizer
Last update 2017-09-19
- Customizer, formerly known as U-Customizer
- Live CD customization and remastering tool
- For any supported Ubuntu-based ISO image
- build your own remix with a few mouse clicks
- **?** does it allow customization of applications, or just applications in the ISO?

### Ubuntu Customization Kit
https://sourceforge.net/projects/uck/
Last Update: 2015-08-19
**PROJECT DISCONTINUED**
Ubuntu Customization Kit is a tool that helps you customizing official Ubuntu Live CDs (including Kubuntu/Xubuntu and Edubuntu) to your needs. You can add any package to the live system, for example language packs, or applications.

### distroshare-ubuntu-imager
Last update 10 Sep 2015
- Creates an installable live CD from an installed Ubuntu or derivative distribution
- by distroshare.com
- Distroshare Ubuntu Imager creates an installable Live ISO from an installed Ubuntu or derivative distribution
- bash script, similar to Remastersys and its forks
- Based on this tutorial https://help.ubuntu.com/community/MakeALiveCD/DVD/BootableFlashFromHarddiskInstall.
- To run the script, run it from the directory where it is located.
  `cd ~/distroshare-ubuntu-imager-1.0 ./distroshare-ubuntu-imager.sh`

### Linux Respin
http://www.linuxrespin.org/
https://github.com/ch1x0r/LinuxRespin
Last Update: 2017-09-22
- Create a custom distro based on Debian
- Linux Respin can make a live version of your OS, or it can make a backup for a fresh install
- This is NOT for Ubuntu, Debian only

### Relinux
https://launchpad.net/relinux
http://mijyn.github.io/relinux/
Last Update 2012-11-09
- Make own Linux distro easily
- Relinux <= 0.4 currently only works on ubuntu. Version 0.5 will add support for other distros
- You can customize the system as much as you would like, except for these limitations (most of which will be removed in a future release):
	- It only supports GRUB2, so no BURG or GRUB-Legacy
	- It must have an X11 display, since Ubiquity (the installer) requires X11 to run
	- You cannot use another installer than Ubiquity
	- The compressed filesystem size must be below 4GB (no workaround). It will tell you if it’s over 4GB (compressed), but I recommend that you keep your system size below 6GB (uncompressed).
	- It will install metacity, but in 0.3, this is removed.


## Notes:
- Ubuntu Mini Remix
- http://www.linuxfromscratch.org/
	- Linux From Scratch (LFS) is a project that provides you with step-by-step instructions for building your own custom Linux system, entirely from source code.
-
