# Ubuntu Notes
> Mon, 24-Sep-2018 13:46:16.372 +0530

## dig
> incomplete
```sh
dig @dns2.internic.ca berp.ca ANY +noall +answer
```
- Options
    - A (Host address)
    - AAAA (IPv6 host address)
    - ALIAS (Auto resolved alias)
    - CNAME (Canonical name for an alias)
    - MX (Mail eXchange)
    - NS (Name Server)
    - PTR (Pointer)
    - SOA (Start Of Authority)
    - SRV (location of service)
    - TXT (Descriptive text)


## fsck
```sh
sudo umount /dev/sdc2
sudo e2fsck -fpv /dev/sdc2
```
- Output
	```
	sudo e2fsck -fpv /dev/sdc2

	      407357 inodes used (19.09%, out of 2133936)
	         418 non-contiguous files (0.1%)
	         347 non-contiguous directories (0.1%)
	             # of inodes with ind/dind/tind blocks: 0/0/0
	             Extent depth histogram: 376117/100
	     7394433 blocks used (86.71%, out of 8527588)
	           0 bad blocks
	           3 large files

	      311257 regular files
	       62614 directories
	           8 character device files
	           0 block device files
	           0 fifos
	          31 links
	       33466 symbolic links (31121 fast symbolic links)
	           3 sockets
	------------
	      407379 files
	```
- Syntax (Redacted)
	```
	e2fsck [ -pacnyrdfkvtDFV ] [ -b superblock ] [ -B blocksize ] [ -l|-L bad_blocks_file ] [ -C fd ] [ -j external-journal ] [ -E extended_options ] device

	-f     Force checking even if the file system seems clean.
	-p     Automatically  repair  ("preen")  the  file system.  This option will cause e2fsck to automatically fix any filesystem problems that can be safely fixed without human intervention.  If e2fsck
		   discovers a problem which may require the system administrator to take additional corrective action, e2fsck will print a description of the problem and then exit with the  value  4  logically
		   or'ed into the exit code.  (See the EXIT CODE section.)  This option is normally used by the system's boot scripts.  It may not be specified at the same time as the -n or -y options.
	-v     Verbose mode.
	-y     Assume an answer of `yes' to all questions; allows e2fsck to be used non-interactively.  This option may not be specified at the same time as the -n or -p options.
	```
- Also see https://www.tecmint.com/manage-ext2-ext3-and-ext4-health-in-linux/
		- `sudo dumpe2fs /dev/sda10`
		- `dumpe2fs -b`
		- `sudo fsck -Vt ext4 /dev/sda10`
		- `sudo tune2fs -l /dev/sda10`
		- `sudo tune2fs -l /dev/sda10`
		- `sudo debugfs /dev/sda10`
		- `debugfs: freefrag` (To show free space fragmentation)



## Mount folder on another folder
- Command
	```sh
	sudo mount -o bind /sourcefolderurl /destinationfolderurl
	# e.g.
	sudo mount -o bind /var/cache/apt/archives/ /media/sda7/ftpshared/archives
	# USAGE
	SRC_DIR="";
	DST_DIR="${HOME}/.nuget/packages";
	sudo mount -o bind ${SRC_DIR} ${DST_DIR};
	```
- To automatically mount the folder, make an entry in /etc/fstab file at the very end,
	`/var/cache/apt/archives /media/sda7/ftpshared/archives auto bind,gid=46,defaults 0 0`


## Create Archive
- Verbose
	```sh
	# --exclude=PATTERN
	#	Exclude files matching PATTERN, a glob(3)-style wildcard pattern.
	#	Can have multiple occurances.
	# --overwrite
	#	Overwrite existing files when extracting.
	#
	SRC_ROOT="./out";
	OUT_ZIP_NAME="${HOME}/Documents/zip-name-$(date +"%y%m%d").zip";
	rm -vf ${OUT_ZIP_NAME};
	zip -vr ${OUT_ZIP_NAME} ${SRC_ROOT};
	echo -n  "created archive "; ls -1 ${OUT_ZIP_NAME};
	```
- Silent Mode, do not print file names that are added.
	```sh
	zip -qr ${OUT_ZIP_NAME} ${SRC_ROOT};
	```
***

## Extract archives
### .deb
```sh
DEB_FILE="full-path-to-file.deb";
DIR_DEST="/";
sudo dpkg-deb -vx ${DEB_FILE} ${DIR_DEST};
```
- also see
	- `dpkg-deb -R original.deb tmp`

### .bz2
- **NOTE**: Inspect archive to verify if contents are at root level.
- Also see `zip` and `unzip`

```sh
TAR_FILE="full-path-to-file.bz2";
CMP_TYPE="j";	# See 'Compression options' below
DIR_DEST="/usr";
echo sudo tar -vx${CMP_TYPE} --strip-components=1 -C ${DIR_DEST} -f ${TAR_FILE};
```

**Compression options:**

- `-j`, `--bzip2`
	- Filter the archive through bzip2(1).
- `-J`, `--xz`
	- Filter the archive through xz(1).
- `--lzip`
	- Filter the archive through lzip(1).
- `--lzma`
	- Filter the archive through lzma(1).
- `--lzop`
	- Filter the archive through lzop(1).
- `-z`, `--gzip`, `--gunzip`, `--ungzip`
	- Filter the archive through gzip(1).
- `-Z`, `--compress`, `--uncompress`
	- Filter the archive through compress(1).

**Other Options of interest**
- `--exclude=PATTERN`
	- Exclude files matching PATTERN, a glob(3)-style wildcard pattern.
- `--one-file-system`
	- Stay in local file system when creating archive.
- `--recursion`
	- Recurse into directories (default).
- `-T, --files-from=FILE`
	- Get names to extract or create from FILE.
- `-v, --verbose`
	- Verbosely list files processed.

***

## General, to classify
### Default applications
- /usr/share/applications/defaults.list
- ~/.local/share/applications/mimeapps.list
`xdg-mime` command

### Default Browser
`x-www-browser` command alias for registered browser

### Mime Types
- /etc/mime.types
- /usr/share/mime/application

- `mimetype` command
- `inode/directory`

- Associate icon with mime-type
	```sh
	sudo cp text-x-python.svg /usr/share/icons/gnome/scalable/mimetypes
	sudo gtk-update-icon-cache /usr/share/icons/gnome/ -f
	```
