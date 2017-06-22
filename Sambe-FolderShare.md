# Folder Sharing - Ubuntu

## From Ubuntu Virtual Guest
`Thu, 22-Jun-2017 22:06:32 +0530`

With VM shutdown
- Settings > Shared Folders
	- create folder with name `<shared-folder>`
- On start, share will be wisible as
	- `sf_<shared-folder>`
- Need to member fo `vboxsf` to open share
	- `sudo adduser [username] vboxsf`
	- to verify membership `id [username]`

---

## With 'Samba' - Folder Share on Network
`Thu, 22-Jun-2017 21:06:38 +0530`

### Links
https://itsfoss.com/share-folders-local-network-ubuntu-windows/
https://www.samba.org/

### Install Samba server
`sudo apt-get install samba samba-common system-config-samba python-glade2 gksu`

### Configure Samba server on Ubuntu
- Open UI
	- Menu > Administration > Samba
	- or `gksu system-config-samba &`
		- **NOTE:** If UI fails to launch, run `sudo touch /etc/libuser.conf`
- Preferences > Server Settings
	- Basic
		- **Workgroup** This is the name of the Workgroup of the computer you want to connect to
		- **Description** This is the name of your computer as seen by others. Don’t use spaces or non-internet friendly characters.
	- Security
		- Allowing ‘Guests’ is not advisable so there is no reason to change security settings. Keep as it is.

### Create a system user
Menu > Administration > Users & Groups
	- Account Type = Standard

### Add new Samba user
Preferences > Samba Users > Add User
- Unix Username – In this case I am selecting the user that I just created.
- Windows Username – You will enter this username when you are accessing from Windows Machine.
- Samba Password – You will enter this password when you are accessing from Windows Machine.
- restart the network or Samba services
	`sudo restart smbd && sudo restart nmbd`

### Share folders or files over the network
File > Add Share

---
