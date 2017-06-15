# Online Storage
*Last Updated :* `Wed 2017-Apr-05 02:09:48.552 +05:30
`

## Criteria
- Windows, Linux and Android clients
- Folder level and/or file level sharing
-


### Sources
1.	`https://www.cnet.com/how-to/onedrive-dropbox-google-drive-and-box-which-cloud-storage-service-is-right-for-you/`
2. [box review](http://reviews.cnet.com/software/box-ios/4505-3513_7-35834897.html)

## Reviewed
1. Microsoft Onedrive
	- Win, office only, Android clients
2. Google Drive
	- Win, Android clients
	- Drive desktop app
	- built-in office suite
3. Dropbox
	- Win, Nix, Android clients
4. [box](https://www.box.com/home)
	- Free = 10 GB Storage, 250 MB file upload limit
	- notifications when a file changes
## Pending Review
1. [MEGA](http://www.mega.nz/)
2. [SpiderOAK](https://en.wikipedia.org/wiki/SpiderOak)
	- trail 60 days only?
	- best in [privacy](http://www.linuxandubuntu.com/home/encryptr-zero-knowledge-system-based-password-manager-for-linux) & [Zero Knowledge](http://zeroknowledgeprivacy.org/)
3. [Yandex Disk](https://en.wikipedia.org/wiki/Yandex_Disk)
	- Yandex Linux client is only CLI
4. Bitcasa
5. [IBM Connections](https://en.wikipedia.org/wiki/IBM_Connections#Files)
6. [SugarSync](https://en.wikipedia.org/wiki/SugarSync)

# Google Drive apps

>## drive: A Command-line Tool by a Google Drive Developer
	https://github.com/odeke-em/drive

>##	google-drive-ocamlfuse
	https://astrada.github.io/google-drive-ocamlfuse/
- google-drive-ocamlfuse is a FUSE filesystem backed by Google Drive, written in OCaml. It lets you mount your Google Drive on Linux.
- Multiple account support
- Installation
``` bash
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt-get update
sudo apt-get install google-drive-ocamlfuse
```

>## CloudCross
	https://cloudcross.mastersoft24.ru/
- supports sync with Yandex.Disk Google Drive Cloud mail.ru OneDrive and Dropbox
- bidirectional documents converting
- Unix only
**For xUbuntu 16.10 run the following:**
```bash
sudo sh -c "
echo 'deb http://download.opensuse.org/repositories/home:/MasterSoft24/xUbuntu_16.10/ /' > /etc/apt/sources.list.d/cloudcross.list" sudo 
apt-get update sudo 
apt-get install cloudcross
```
>## Rclone [looks best]
	https://rclone.org/
- complex commands, but also comprehensive functionality
- Rclone is a command line program to sync files and directories to and from
	-	Google Drive
	-	Amazon S3
	-	Openstack Swift / Rackspace cloud files / Memset Memstore
	-	Dropbox
	-	Google Cloud Storage
	-	Amazon Drive
	-	Microsoft OneDrive
	-	Hubic
	-	Backblaze B2
	-	Yandex Disk
	-	SFTP
	-	The local filesystem
-	Can sync to and from network, eg two different cloud accounts
-	Optional encryption (Crypt)
-	Optional FUSE mount (rclone mount)
- Windows `https://downloads.rclone.org/rclone-current-windows-amd64.zip`
- Linux `https://downloads.rclone.org/rclone-current-linux-amd64.zip`
- Documentation included in zip. Get detailed if needed as mht from [docs](https://rclone.org/docs/)

# Box Apps
>## unison - simplest
	https://github.com/bcpierce00/unison
- [Steps](http://www.math.cmu.edu/~gautam/sj/blog/20150807-box-webdav.html)
- [davfs2](http://savannah.nongnu.org/projects/davfs2)
- symbolic links not supported

>## Box2Tux
	https://github.com/alfredobonino/Box2Tux/archive/master.zip
- davfs2 wrapper
- [Mount Your Box.com Storage in Ubuntu Desktop](http://ubuntuhandbook.org/index.php/2014/08/map-box-com-storage-ubuntu-desktop/)

>## box-sync - easiest
	https://github.com/noiselabs/box-linux-sync/archive/master.zip
- davfs2 wrapper
- [Steps](http://tutorialforlinux.com/2016/02/13/how-to-install-box-com-sync-client-on-ubuntu-16-04-xenial-lts-step-by-step-easy-guide/)


# References & Notes:
1. https://en.wikipedia.org/wiki/Comparison_of_online_backup_services
2. https://en.wikipedia.org/wiki/Comparison_of_file_hosting_services
3. [Unison](http://www.cis.upenn.edu/~bcpierce/unison/)
- Unison is a file-synchronization tool for OSX, Unix, and Windows. It allows two replicas of a collection of files and directories to be stored on different hosts (or different disks on the same host), modified separately, and then brought up to date by propagating the changes in each replica to the other.
- runs on both Windows and many flavors of Unix (Solaris, Linux, OS X, etc.)
- updates to both replicas of a distributed directory structure
