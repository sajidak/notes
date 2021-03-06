# Notes 1801

## 09 Feb 2018
### Data Modeling tools for MySQL
- https://dbeaver.jkiss.org/
	- `dbeaver-ce-4.3.4-linux.gtk.x86_64.tar.gz`
- http://mogwai.sourceforge.net/erdesignerng.html
- https://jeddict.github.io/
- http://squirrel-sql.sourceforge.net/
- Also
	- http://www.modelsphere.com/org/open_modelsphere.html
	-

## 06 Feb 2018
### Remove VP-UML backup files
`rm *.vpp.bak_*; rm *.vpp.vbak*;`
`alias rm-vpp-bak='rm *.vpp.bak_*; rm *.vpp.vbak*;'`

## 04 Feb 2018
### Trust Relationship
A manager should trust their devs not to do stupid things, and if the devs do stupid things, the manager is at fault
- either because the appropriate expectations haven't been put in place
- or because the wrong people were hired.

## 31 Jan 2018
### Default applications
- /usr/share/applications/defaults.list
- ~/.local/share/applications/mimeapps.list
`xdg-mime` command

### Default Browser
`x-www-browser` command alias for registered browser

### Mime Types
- /etc/mime.types
- /usr/share/mime/application

`mimetype` command
`inode/directory`

Associate icon with mime-type
```sh
sudo cp text-x-python.svg /usr/share/icons/gnome/scalable/mimetypes
sudo gtk-update-icon-cache /usr/share/icons/gnome/ -f
```


## Website offline
- Web Page Downloader
- HTTrack (http://www.httrack.com/)
- Getleft ()
- wget -r -p //www.makeuseof.com

---

## Task Coach
```sh
sudo add-apt-repository ppa:taskcoach-developers/ppa
sudo apt-get install taskcoach
```

---

## Bootstrap 4.0.0 on live machine
```sh
sudo mkdir -v -p /10-Base
sudo chown -v 999:999 /10-Base
mkdir -v -p /10-Base/ruby-gems

sudo apt-get install build-essential manpages-dev ruby-full zlib1g-dev openjdk-8-jre

# wget https://nodejs.org/dist/v8.9.4/node-v8.9.4-linux-x64.tar.xz
## Manually extract and rename

sudo ln -vsT /10-Base/node/bin/node /bin/node
sudo ln -vsT /10-Base/node/bin/npm /bin/npm

npm install -g grunt-cli
sudo ln -s /10-Base/node/lib/node_modules/grunt-cli/bin/grunt /bin/grunt

sudo gem install bundler

pushd /media/ubuntu-mate/70_Current/Work/bootstrap4/bootstrap-4.0.0
npm install jquery popper.js
npm install

# sudo bundle install
bundle install --path /10-Base/ruby-gems/bundle

npm run dist
npm run docs
npm run docs-serve

http://localhost:9001


# /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0
```

## 23 Jan 2018

- bunsenlabs
- ps-mem

### Light Linux Notes
**1**
ubuntu server
openbox window manager
tint2 panel (single panel autostarted - with taskbar button list, launchers, clock and systemtray)
compton compositor (autostarted)
wicd network manager (not autostarted and deamon not running - so only used when actively launched from panel launcher - to save on memory)
volti volume-manager (autostarted and running as daemon in system tray)
gsimplecal calendar (launched on left click of Tint2 panel clock)
nitrogen wallapaper manager (autostarted).
obmenu (used to fully customise openbox menu)
pcmanfm file manager
no login manager used. Instead, after logging into the command line interface, I have set it up to automatically run startx
finally, the usual other lightweight system/preferences stuff such as lxtask, lxterminal, obconf, lxappearance etc

**2**
openbox with comton and nitrogen but nothing esle, comes in at around 117MB.

**3**
x-tile
x-tile q
killall x-tile

**4**
http://fluxbox.org/6 and vala-panel

**5**
ps_mem
```sh
$ wget https://github.com/pixelb/ps_mem/raw/master/ps_mem.py
$ sudo mv ps_mem.py /usr/local/bin/
$ sudo chmod 755 /usr/local/bin/ps_mem.py
```

ps_umem.sh
```sh
#!/bin/bash
for i in $(ps -e -o user= | sort | uniq); do
    printf '%-20s%10s\n' $i $(sudo ps_mem --total -p $(pgrep -d, -u $i))
done
```

**6**
.xinitrc
awesome
exec marco &
exec mate-panel

**7**
free -m

**8**
Network manager applet = wicd-gtk
Volume control applet= volti
sound device switching applet = indicator-sound-switcher
Calendar on left or right click of panel clock = gsimplecal

**9**
sudo apt-get remove grub2-themes-ubuntu-mate

### Interesting Apps
http://www.fosshub.com/Android-x86.html/
http://taskcoach.org/
http://www.ganttproject.biz
https://www.fosshub.com/Graphic-Apps.html
	- yEd
	- LibreCAD
	- [Sweet Home 3D](http://www.sweethome3d.com/)
	- Vectr
