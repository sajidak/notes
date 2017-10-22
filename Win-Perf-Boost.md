# Boost Windows Performance
`Tue, 15-Aug-2017`


> Applies to Windows XP, 7, 8 & 8.1
> This is written to be helpful and is _not_ definitive, use at your own risk
> If you know of more tweaks, raise a pull request or mail me


## Hardware
- When buying hard disks, buy the fastest speeds possible in your budget
- When buying RAM,
	- Check you mainboard manufacturers specification for compatible brands and speeds
		- Though others will also work, the manufacturers recommendations are for best compatibility
		- The recommendations can have a significant result on performance and operating life
	- Buy the fastest speeds possible in your budget, speed used will be the lowest of all memory cards installed
	- Buy as much RAM as possible
	- Buy cards of larger size, this will leave room for future expansion
		- e.g. 1 x 8GB vs 2 x 4GB
- When buying Graphic (Video) card, buy with highest specification possible in your budget. Some are
	- GPU core speed
	- GPU cores count
	- Video memory
		- Memory speed
		- Memory bus width
	- Install a heatsink on the video card
	- Check you mainboard manufacturers specification for compatible brands and specifications
- Install a good (Even oversized) processor cooler, more heatpipes the better
- Place the box in a well ventilated location, with fan flow aligned to natural airflow
	- Keeping the box horizontal is better than keeping the box vertical


## Hard disk partitions
**Partitions plan**

| Ptn # | Disk | Partition |      Puprose       |                       Note                        |
|:-----:| ----:|:---------:| ------------------ | ------------------------------------------------- |
| **1** |   01 |     1     | Windows            |                                                   |
| **2** |   01 |   last    | Temp Folders       |                                                   |
| **3** |   02 |   last    | Page file          | Can also use partition `#2`                       |
| **4** |   02 |     1     | Working Files      | can also be any unused partition on disk `1`      |
| **5** |   03 |    any    | Storage, Reference | can also use unused partitions on Disk `1` or `2` |

### Post Installation
Once installation is done, apply the following
- Desktop background
	- Set to solid black
- Visual Effects
	- `Control Panel` > `System` > `Advanced System Settings` > `Advanced` > `Performance - Settings...` > `Visual Effects`
	- Choose `Adjust for best performance`
- Page file lock
	- `Control Panel` > `System` > `Advanced System Settings` > `Advanced` > `Performance - Settings...` > `Advanced` > `Change...`
	- Uncheck `Automatically manage ...`
	- Select each Drive and set `No paging file`
	- For designated drive, select and
		- Set page file size to `Custom size`, and apply `Initial Size` and `Maximum size` size to same value
		- Page file size should be `(Installed RAM) x 1.5`. This value can be got from `Recommended` size field
- Temp Folder Locations
	- `Control Panel` > `System` > `Advanced System Settings` > `Advanced` > `Environment Variables`
	- Change all `TEMP` and `TMP` locations to point to **partition #2**, designated for 'Temp Folders'
	- `Control Panel` > `Internet Options` > `General` > `Browsing history - Settings..`
		- `Move folder...` > point to a folder on **partition #2**
	- Also change temp folder location in all browsers and applications individually
- Profile folders
	- This step should be done with care, consult an expert for Windows 8 and lower
- Folder Options in Windows Exploree
	- In `View`, choose `List`
	- You can choose anything except `Details`. Details option will use processor and memory to get details


## Regular maintainence
The following should be done on a regular basis to maintain the performance boost
- Clear contents of temporary folders
- Clear browser caches
	- Using keyboard shortcut `Control + Shift + Delete`
	- Check all options
- Clear older restore points from earlier Windows updates
