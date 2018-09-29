# Ubuntu Notes
> Mon, 24-Sep-2018 13:46:16.372 +0530

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
