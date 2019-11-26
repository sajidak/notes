# Notes 2019 June

## Links
- https://www.freelancer.com/signup
	- https://www.naukri.com/job-listings-Hiring-Freelance-Developers-for-Ruby-on-Rails-RISYST-PRIVATE-LIMITED-Kochi-2-to-4-years-050619000453?src=cluster&sid=15606184517332&xp=35&px=1
	- https://www.naukri.com/job-listings-Fixed-Term-Contract-Data-Analysis-Role-GODREJ-AGROVET-LTD-Mumbai-Vikhroli-1-to-4-years-140619005192?src=jobsearchDesk&sid=15606188324429&xp=19&px=1
	- Interesting YTs
		- https://www.youtube.com/user/HyderabadDiaries/videos
		- https://www.youtube.com/watch?v=CntkO21eXig

## .net porting
> 29-08-2019

- https://docs.microsoft.com/en-us/dotnet/core/porting/
- https://docs.microsoft.com/en-us/dotnet/core/porting/libraries
- https://docs.microsoft.com/en-us/dotnet/standard/analyzers/


## IT Security Frameworks
- https://www.rapid7.com/fundamentals/information-security-risk-management/
- https://blog.netwrix.com/2018/08/02/how-to-create-an-effective-information-security-risk-management-program/
- https://en.wikipedia.org/wiki/IT_risk_management
- https://en.wikipedia.org/wiki/IT_risk#Standards_organizations_and_standards
- https://en.wikipedia.org/wiki/Cyber_risk_quantification

## Desktop multifunction printers
- https://store.hp.com/in-en/default/printers/hp-deskjet-2623-all-in-one-printer-y5h69d.html
- https://store.hp.com/in-en/default/printers/hp-deskjet-2622-all-in-one-printer-y5h67d.html


- https://www.amazon.in/dp/B07DCV3PQC?aaxitk=vNBk5WY4w2VlFdgAWolY7g&pd_rd_i=B07DCV3PQC&pf_rd_p=65eb14ef-a10e-4be0-99be-a4c4b70ff707&hsa_cr_id=2594387240902&sb-ci-n=productDescription&sb-ci-v=Brother%20DCP-T510W%20Inktank%20Refill%20System%20Printer%20with%20Built-in-Wireless%20Technology&sb-ci-a=B07DCV3PQC
- https://www.amazon.in/gp/product/B0752J9JQQ
- https://www.flipkart.com/hp-deskjet-2131-all-in-one-printer/p/itme9zuqk84ndx9w?pid=PRNE9ZUQFCTH2WFZ&lid=LSTPRNE9ZUQFCTH2WFZA9CH52&marketplace=FLIPKART&srno=b_1_2&otracker=browse&fm=organic&iid=4ee599b6-4bd5-4089-9f66-1b3bc3bffcb9.PRNE9ZUQFCTH2WFZ.SEARCH&ppt=browse&ppn=browse
- https://www.flipkart.com/hp-deskjet-2132-all-in-one-f5s41d-multi-function-printer/p/itmedkgjfxzqamtf?pid=PRNEDKGJBQRYHKHQ&lid=LSTPRNEDKGJBQRYHKHQIW7EJX&marketplace=FLIPKART&srno=b_1_3&otracker=browse&fm=organic&iid=b5a0bb00-9261-4ef0-8a4c-42e8f0bb41b5.PRNEDKGJBQRYHKHQ.SEARCH&ppt=browse&ppn=browse
- https://www.flipkart.com/hp-deskjet-ink-advantage-2138-multi-function-printer/p/itmezy3uzbfghfuw?pid=PRNEZY3U5FZED6HF&lid=LSTPRNEZY3U5FZED6HFZMFUUX&marketplace=FLIPKART&srno=b_1_7&otracker=browse&fm=organic&iid=a60e0295-e653-470b-8c97-ce46c7ac2f47.PRNEZY3U5FZED6HF.SEARCH&ppt=browse&ppn=browse


## Mobile apps
https://www.nativescript.org/nativescript-is-how-you-build-native-mobile-apps-with-angular

Ionic, NativeScript, React Native, Xamarin, PhoneGap
React Native

(2016) https://www.nativescript.org/blog/nativescript-and-xamarin
The most important thing to know about NativeScript and Xamarin in this regard, is they do not use a web view like Cordova.


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
