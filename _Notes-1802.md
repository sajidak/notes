# Notes 1801

## 12 Feb 2018
### Grub Samples
**Legacy BIOS**
```cfg
####################################################################################################
#                                                                                                  #
#   ASSUMPTIONS:                                                                                   #
#   The following statements have been executed, and the variables set correctly                   #
#       set DELLPM6700_HDD="1A159FBB4B0C2043"                                                      #
#       search --no-floppy --fs-uuid --set=DELLPM6700_HDD_GRUB ${DELLPM6700_HDD}                   #
#   And these variables are availaible for use                                                     #
#       ${DELLPM6700_HDD}                                                                          #
#       ${DELLPM6700_HDD_GRUB}                                                                     #
#                                                                                                  #
####################################################################################################
set DELLPM6700_HDD="1A159FBB4B0C2043"                                                      #
search --no-floppy --fs-uuid --set=DELLPM6700_HDD_GRUB ${DELLPM6700_HDD}                   #
#
#--------------------------------------------------------------------------------------------------#
# BUNSENLABS_HYDROGEN AMD64
menuentry '[ISO] bl-Deuterium-amd64_20170429 [BUNSENLABS_HYDROGEN]' {
	set root=${DELLPM6700_HDD_GRUB}
	set isofileBH='/OSLib/bl-Deuterium-amd64_20170429.iso'
	loopback loopBH $isofileBH
	#
	# linux  (loopBH)/casper/vmlinuz.efi boot=casper iso-scan/filename=$isofileBH locale=en_US.UTF-8
	linux  (loopBH)/live/vmlinuz-3.16.0-4-amd64 boot=live iso-scan/filename=$isofileBH components quiet splash
	initrd (loopBH)/live/initrd.img-3.16.0-4-amd64
}
#--------------------------------------------------------------------------------------------------#
# Uubuntu-Mate 17.10.1 AMD64
menuentry '[ISO] ubuntu-mate-17.10.1-desktop-amd64 [Artful]' {
	set root=${DELLPM6700_HDD_GRUB}
	set isofileMA='/OSLib/ubuntu-mate-17.10.1-desktop-amd64.iso'
	loopback loopMA $isofileMA
	#
	linux  (loopMA)/casper/vmlinuz.efi boot=casper iso-scan/filename=$isofileMA locale=en_US.UTF-8
	initrd (loopMA)/casper/initrd.lz
}
#--------------------------------------------------------------------------------------------------#

```
