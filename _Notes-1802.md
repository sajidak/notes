# Notes 1802

## 2018 Jul 27
### JS ecma-262 9.0
- ISO 8601 Date Time String Format
	- `YYYY-MM-DDTHH:mm:ss.sssZ`

## Jul 01 2018
### Domain prices - 10 yrs
| TLD    |   INR |
| ------ | -----:|
| .xyz   |  5670 |
| .rocks |  5890 |
| .space |  3960 |
| .name  |  6750 |
| .guru  |     ? |
| .today |     ? |
| .info  |   860 |
| .co.in | 3,990 |
| .in    | 4,990 |
| .tech  | 5,490 |

## 15 Jun 2018

### Small linux
#### 4MLinux
- http://4mlinux.com/
- 4MLinux is a miniature, 32-bit Linux distribution focusing on four capabilities: maintenance (as a system rescue live CD), multimedia (for playing video DVDs and other multimedia files), miniserver (using the inetd daemon), and mystery (providing several small Linux games). The distribution includes support for booting on UEFI-enabled machines.

#### Linux Lite
- https://www.linuxliteos.com/
- http://sparkylinux.org/
- http://www.tinycorelinux.net/welcome.html
- [CrunchBang++](https://crunchbangplusplus.org/)
- Bodhi Linux
- SparkyLinux
- Tiny Core - CorePlus
- Modern X
- Elive
- wattOS
- Nanolinux
- TurnKey GNU/Linux
- ToriOS
- HD Scania



## 09 May 2018

### Timestamp format
- Pluma
	- `%Y-%m-%d %H:%M:%S`
	- `2018-05-09 22:12:49`
- Atom
	- `ddd, DD-MMM-YYYY HH:mm:ss Z`
	- `Wed, 09-May-2018 22:13:41 +05:30`


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
