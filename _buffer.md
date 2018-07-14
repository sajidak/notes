# buffer file
>for temporary editing

## Used laptops
- http://rentopc.in
- HP EliteBook 8440P - i5 - 8GB RAM - 1 TB HDD
	- https://www.ebay.in/itm/hp-elitebook-8440p-i5-8gb-ram-1-tb-hdd-with-one-year-seller-warranty/222641396722?hash=item33d6761bf2
	- Rs. 11,999.00


## Hotel Property Management
- online free software
	- https://nobeds.com/app/en/Dashboard
	- https://kwhotel.com/en/download/kwhotel-free.

- latest and  used by Branded hotels  ( for reference)
	- https://docs.oracle.com/cd/E53547_01/opera_5_04_03_core_help/index.htm?toc.htm?359.htm

- Other
	- https://www.softwareadvice.com/hotel-management/

## tigervnc
```sh
# Commands to install tigervnc on machine.
## Run from location of tar file.
WORK_DIR="${HOME}/Downloads";
tar -xz -C ${WORK_DIR} -f tigervnc-1.8.0.x86_64.tar.gz;
mv -vf ${WORK_DIR}/tigervnc* ${WORK_DIR}/tigervnc
sudo rsync -vrh ${WORK_DIR}/tigervnc/ /;
```

## Pandoc
```sh
SRC_DIR="XYZ";
/usr/bin/pandoc -f markdown -t html5 -N -p -s --self-contained --toc --toc-depth=3 -o Development-Guidelines.html --highlight-style=pygments ${SRC_DIR}/Development-Guidelines.md
```

## Clean Work files
### VPUML working files
`rm /media/sak/70_Current/Work/Novelty-Data/VVC/Bitbucket/xtra/BPM-Architecture.vpp.bak_*`
`rm /media/sak/70_Current/Work/Ramazan/20-Elaborate/CanesJK.vpp.bak_*`


## RDLC Reports with Object data source
`28-Oct-2017 18:33:21.328 +0530`

- https://msdn.microsoft.com/en-us/library/ms252094.aspx
- https://msdn.microsoft.com/en-us/library/ms251784.aspx
- https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.objectdatasource.aspx
- https://docs.microsoft.com/en-us/dotnet/api/system.web.ui.webcontrols.objectdatasource?view=netframework-4.6.1

9aba-4922-59b5
