# Notes 2019 June

## Links
- https://www.freelancer.com/signup
	- https://www.naukri.com/job-listings-Hiring-Freelance-Developers-for-Ruby-on-Rails-RISYST-PRIVATE-LIMITED-Kochi-2-to-4-years-050619000453?src=cluster&sid=15606184517332&xp=35&px=1
	- https://www.naukri.com/job-listings-Fixed-Term-Contract-Data-Analysis-Role-GODREJ-AGROVET-LTD-Mumbai-Vikhroli-1-to-4-years-140619005192?src=jobsearchDesk&sid=15606188324429&xp=19&px=1


## PDF Printers, Virtual for Windows
- https://helpx.adobe.com/in/acrobat/using/print-to-pdf.html
- http://www.bullzip.com/products/pdf/info.php
- https://www.pdfforge.org/pdfcreator
- https://www.dopdf.com/
- https://www.nchsoftware.com/pdfprinter/index.html
- http://www.cutepdf.com/products/cutepdf/writer.asp


## Light text editors
- https://neovim.io/
- http://lighttable.com/
- https://notepadqq.com/s/
	- `snap install notepadqq`

## Linux commands
- ls -l /dev/disk
- ls -l /dev/disk/by-label
- sudo lsblk -o name,mountpoint,label,size,uuid
	```sh
	Available columns:
	       NAME  device name
	      KNAME  internal kernel device name
	    MAJ:MIN  major:minor device number
	     FSTYPE  filesystem type
	 MOUNTPOINT  where the device is mounted
	      LABEL  filesystem LABEL
	       UUID  filesystem UUID
	         RO  read-only device
	         RM  removable device
	      MODEL  device identifier
	       SIZE  size of the device
	      STATE  state of the device
	      OWNER  user name
	      GROUP  group name
	       MODE  device node permissions
	  ALIGNMENT  alignment offset
	     MIN-IO  minimum I/O size
	     OPT-IO  optimal I/O size
	    PHY-SEC  physical sector size
	    LOG-SEC  logical sector size
	       ROTA  rotational device
	      SCHED  I/O scheduler name
	    RQ-SIZE  request queue size
	       TYPE  device type
	   DISC-ALN  discard alignment offset
	  DISC-GRAN  discard granularity
	   DISC-MAX  discard max bytes
	  DISC-ZERO  discard zeroes data
	```
- Others
	- sudo blkid /dev/mapper/vg_rootdisk-lv_var
	- sudo udevadm info --query=all --name=/dev/mapper/vg_rootdisk-lv_var
	- e2label /dev/sda2
	- mount -l
	- sudo tune2fs -l /dev/sda1
	- blkid
	- sudo fdisk -l
		- Each device is reported separately with details about size, seconds, id and individual partitions.
	- sudo sfdisk -l -uM
	- sudo parted -l
	- df -h
		- includes file systems that are not real disk partitions
	- pydf
