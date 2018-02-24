# buffer file
>for temporary editing

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
