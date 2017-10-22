# VirtualBox Notes


## Frequent Commands
- Clone HDD


## Snapshots
- VM is currently running
	- 'Machine' > 'Take snapshot'
- VM is currently in either the "saved" or the "powered off" state
	- 'Snapshots' tab on the top right of the main window

### restore
- the entire state of the virtual hard drive will be reverted
- all files that have been created since the snapshot and all other file changes will be lost
- write-through hard drives are not included in snapshots

### delete
- will not affect the state of the virtual machine
- can take a considerable amount of time since large amounts of data may need to be copied between several disk image files


## Cloning VBoxManage
- VirtualBox assigns a unique identity number (UUID) to each disk image

### clonemedium
- only make copies of virtual disk images using the utility supplied with VirtualBox
```
VBoxManage clonemedium      [disk|dvd|floppy] <uuid|inputfile> <uuid|outputfile>
                            [--format VDI|VMDK|VHD|RAW|<other>]
                            [--variant Standard,Fixed,Split2G,Stream,ESX]
			    			[--existing]
```

### createhd
```
VBoxManage createmedium     [disk|dvd|floppy]    --filename <filename>
                            [--size <megabytes>|--sizebyte <bytes>]
                            [--diffparent <uuid>|<filename>
                            [--format VDI|VMDK|VHD] (default: VDI)
                            [--variant Standard,Fixed,Split2G,Stream,ESX]
```


## Special image write modes

### normal images

### write-through hard disks
- their state is not saved when a snapshot is taken
- are not restored when a snapshot is restored

### Shareable hard disks
- **Warning**: expert feature, and misuse can lead to data loss
- a variant of write-through hard disks
- may be attached to several VMs which may run concurrently
- Only fixed size images can be used in this way

### immutable images
- only remember write accesses temporarily while the virtual machine is running
- all changes are lost when the virtual machine is powered on the next time
- same immutable image can be used with several virtual machines
- first create a "normal" image and then, when you deem its contents useful, later mark it immutable.

### multiattach mode
- can be attached to more than one virtual machine at the same time
- data that is written to such a virtual disk by one machine is not seen by the other machines
- each machine creates its own write history of the multiattach image

### read-only image
