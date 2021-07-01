# GStreamer commands
> 2021 Jun 30

## Notes:
3 stage live streaming
- Sender
- Relay
- User

- Command continuation is `\` for Nix and `^` for Win. Replace to suit environment
- for debugging, use `gst-launch-1.0 -v --gst-debug-level=6`
- `EXTADRS` = Public IP of the relay server
- `INTADRS` = Private IP of the relay server, can be set to 0.0.0.0 if only one adapter
- For Default Camera use `autovideosrc` and for Test pattern use `videotestsrc is-live=true`
- For Default Microphone use `autoaudiosrc` and for Test signal use `audiotestsrc is-live=true volume=0.8 wave=Sine freq=700`
	- **Note:** `audiotestsrc` is not converting to format `flac`

***

## Commands

### Relay stage
> Should be started first, for sender to connect

**RELAY CAM:**
```sh
gst-launch-1.0 -v tcpserversrc name=relayinCam host=${INTADRS} port=9010  \ 
  ! queue name=qrelayCam max-size-time=3000000000 silent=true  \ 
  ! capsfilter name=cfrelayinCam caps-change-mode=immediate caps=image/jpeg,sof-marker=0,width=640,height=480,pixel-aspect-ratio=1/1,framerate=10/1,interlace-mode=progressive,colorimetry=bt601,chroma-site=jpeg  \ 
  ! queue name=qrelaydecCam max-size-time=3000000000 silent=true  \ 
  ! jpegdec name=decrelayCam  \ 
  ! videoflip name=vfrelayCam method=horizontal-flip  \ 
  ! videoconvert name=convrelaydecCam  \ 
  ! capsfilter name=cfrelayscaleCam caps-change-mode=immediate caps=video/x-raw,format=BGRx,width=640,height=480,framerate=10/1,pixel-aspect-ratio=1/1  \ 
  ! queue name=qrelaycsaleCam max-size-time=3000000000 silent=true  \ 
  ! videoconvert name=convrelayencCam  \ 
  ! capsfilter name=cfrelayoutCam caps-change-mode=immediate caps=video/x-raw,format=YUY2,width=640,height=480,framerate=10/1,pixel-aspect-ratio=1/1  \ 
  ! jpegenc name=encrelayCam  \ 
  ! queue name=qrelayoutCam max-size-time=3000000000 silent=true  \ 
  ! tcpserversink name=relayoutCam host=${INTADRS} port=7010 recover-policy=keyframe sync-method=latest-keyframe sync=true
```

**RELAY MIC:**
```sh
gst-launch-1.0 -v tcpserversrc name=relayinMic host=${INTADRS} port=9020  \ 
  ! queue name=qtrelayMic max-size-time=3000000000 silent=true  \ 
  ! capsfilter name=cfrelayinMic caps-change-mode=immediate caps=audio/x-flac,channels=2,rate=44100,streamheader=(buffer)"<7f464c414301000002664c614300000022120012000000000000000ac443700000000000000000000000000000000000000000,84000028200000007265666572656e6365206c6962464c414320312e332e3320323031393038303400000000>" \
  ! flacparse name=relayparseMic  \ 
  ! queue name=qrelaydecMic max-size-time=3000000000 silent=true  \ 
  ! flacdec name=decMic  \ 
  ! capsfilter name=cfrelaydecMic caps-change-mode=immediate caps=audio/x-raw,format=S24_32LE,layout=interleaved,rate=44100,channels=2,channel-mask=(bitmask)0x0000000000000003  \ 
  ! queue name=qrelayconvMic max-size-time=3000000000 silent=true  \ 
  ! audioconvert name=convrelaydecMic  \ 
  ! queue name=qrelayrsmpMic max-size-time=3000000000 silent=true  \ 
  ! audioresample name=rsmprelayMic  \ 
  ! queue name=qconvrelayMic max-size-time=3000000000 silent=true  \ 
  ! capsfilter name=cfrelayrsMic caps-change-mode=immediate caps=audio/x-raw,format=F32LE,layout=interleaved,rate=44100,channels=2,channel-mask=(bitmask)0x0000000000000003  \ 
  ! audioconvert name=convrelayencMic  \ 
  ! flacenc name=encrelayMic  \ 
  ! capsfilter name=cfrelayoutMic caps-change-mode=immediate caps=audio/x-flac,channels=2,rate=44100,streamheader=(buffer)"<7f464c414301000002664c614300000022120012000000000000000ac443700000000000000000000000000000000000000000,84000028200000007265666572656e6365206c6962464c414320312e332e3320323031393038303400000000>" \
  ! queue name=qrelayoutMic max-size-time=3000000000 silent=true  \ 
  ! tcpserversink name=relayoutMic host=${INTADRS} port=7020 recover-policy=keyframe sync-method=latest-keyframe sync=true
```

**RELAY SCR:**
```sh
gst-launch-1.0 -v tcpserversrc name=relayinScr host=${INTADRS} port=9030  \ 
  ! queue name=qrelayinScr max-size-time=3000000000 silent=true  \ 
  ! capsfilter name=cfrelaydecScr caps-change-mode=immediate caps=image/jpeg,sof-marker=0,width=1200,height=675,pixel-aspect-ratio=1/1,framerate=10/1,interlace-mode=progressive,colorimetry=bt601,chroma-site=jpeg  \ 
  ! queue name=qrelaydecScr max-size-time=3000000000 silent=true  \ 
  ! jpegdec name=decScr  \ 
  ! queue name=qrelayconvScr max-size-time=3000000000 silent=true  \ 
  ! videoconvert name=convdecrelayScr  \ 
  ! capsfilter name=cfrelayconvdecScr caps-change-mode=immediate caps=video/x-raw,format=BGRx,width=1200,height=675,framerate=10/1,pixel-aspect-ratio=1/1  \ 
  ! queue name=qrelayScr max-size-time=3000000000 silent=true  \ 
  ! videoconvert name=convencrelayScr  \ 
  ! capsfilter name=cfrelayconvencScr caps-change-mode=immediate caps=video/x-raw,format=YUY2,width=1200,height=675,framerate=10/1,pixel-aspect-ratio=1/1,colorimetry=bt601,chroma-site=jpeg  \ 
  ! queue name=qrelayencScr max-size-time=3000000000 silent=true  \ 
  ! jpegenc name=encrelayScr  \ 
  ! queue name=qrelayoutScr max-size-time=3000000000 silent=true  \ 
  ! tcpserversink name=relayoutScr host=${INTADRS} port=7030 recover-policy=keyframe sync-method=latest-keyframe sync=true
```

***

### Send Stage
> Should be started after Relays are started, and before Users start.

**SEND CAM:**
```sh
gst-launch-1.0 -v autovideosrc name=sendinCam  \ 
  ! queue name=qsendinCam max-size-time=3000000000 silent=true  \ 
  ! videorate name=ratesendCam \ 
  ! queue name=qsendconvCam max-size-time=3000000000 silent=true  \ 
  ! videoconvert name=convCam  \ 
  ! capsfilter name=cfsendoutCam caps-change-mode=immediate caps=video/x-raw,format=YUY2,width=640,height=480,framerate=10/1,pixel-aspect-ratio=1/1  \ 
  ! jpegenc name=encCam  \ 
  ! queue name=qsendoutCam max-size-time=3000000000 silent=true  \ 
  ! tcpclientsink name=sendoutCam host=${EXTADRS} port=9010
```

**SEND MIC:**
```sh
gst-launch-1.0 -v autoaudiosrc name=sendinMic  \ 
  ! capsfilter name=cfsendinMic caps-change-mode=immediate caps=audio/x-raw,format=F32LE,layout=interleaved,rate=44100,channels=2,channel-mask=(bitmask)0x0000000000000003  \ 
  ! queue name=qsendinMic max-size-time=3000000000 silent=true  \ 
  ! audioconvert name=convsendMic  \ 
  ! flacenc name=encMic  \ 
  ! capsfilter name=cfsendoutMic caps-change-mode=immediate caps=audio/x-flac,channels=2,rate=44100,streamheader=(buffer)"<7f464c414301000002664c614300000022120012000000000000000ac443700000000000000000000000000000000000000000,84000028200000007265666572656e6365206c6962464c414320312e332e3320323031393038303400000000>" \
  ! queue name=qsendoutMic max-size-time=3000000000 silent=true  \ 
  ! tcpclientsink name=sendoutMic host=${EXTADRS} port=9020
```

**SEND SCR:**
```sh
gst-launch-1.0 -v gdiscreencapsrc name=sendinScr cursor=false monitor=0  \ 
  ! queue name=qsendinScr max-size-time=3000000000 silent=true  \ 
  ! videoscale name=vssendScr  \ 
  ! videoconvert name=convsendScr  \ 
  ! capsfilter name=cfsendconvScr caps-change-mode=immediate caps=video/x-raw,format=YUY2,width=1200,height=675,framerate=10/1,pixel-aspect-ratio=1/1,colorimetry=bt601,chroma-site=jpeg  \ 
  ! queue name=qsendencScr max-size-time=3000000000 silent=true  \ 
  ! jpegenc name=encScr  \ 
  ! queue name=qsendoutScr max-size-time=3000000000 silent=true  \ 
  ! tcpclientsink name=sendoutScr host=${EXTADRS} port=9030
```

***

### Use stage
> Should be started only after Sender has started

**USE CAM:**
```sh
gst-launch-1.0 -v tcpclientsrc name=userinCam host=${EXTADRS} port=7010  \ 
  ! queue name=qusrinCam max-size-time=3000000000 silent=true  \ 
  ! capsfilter name=cfusrinCam caps-change-mode=immediate caps=image/jpeg,sof-marker=0,width=640,height=480,pixel-aspect-ratio=1/1,framerate=10/1,interlace-mode=progressive,colorimetry=bt601,chroma-site=jpeg  \ 
  ! queue name=qusrdecCam max-size-time=3000000000 silent=true  \ 
  ! jpegdec name=decCam  \ 
  ! videoconvert name=convusrCam  \ 
  ! capsfilter name=cfusrscaleCam caps-change-mode=immediate caps=video/x-raw,format=BGRx,width=640,height=480,framerate=10/1,pixel-aspect-ratio=1/1  \ 
  ! queue name=qusrcsaleCam max-size-time=3000000000 silent=true  \ 
  ! videoscale name=vsusrCam  \ 
  ! queue name=qusroutCam max-size-time=3000000000 silent=true  \
  ! glimagesink
```

**USE MIC:**
```sh
gst-launch-1.0 -v tcpclientsrc name=userinMic host=${EXTADRS} port=7020  \ 
  ! queue name=qusrinMic max-size-time=3000000000 silent=true  \ 
  ! capsfilter name=cfusrinMic caps-change-mode=immediate caps=audio/x-flac,channels=2,rate=44100,streamheader=(buffer)"<7f464c414301000002664c614300000022120012000000000000000ac443700000000000000000000000000000000000000000,84000028200000007265666572656e6365206c6962464c414320312e332e3320323031393038303400000000>" \
  ! flacparse name=usrparseMic  \ 
  ! queue name=qusrdecMic max-size-time=3000000000 silent=true  \ 
  ! flacdec name=decMic  \ 
  ! capsfilter name=cfusrdecMic caps-change-mode=immediate caps=audio/x-raw,format=S24_32LE,layout=interleaved,rate=44100,channels=2,channel-mask=(bitmask)0x0000000000000003  \ 
  ! queue name=qusrconvMic max-size-time=3000000000 silent=true  \ 
  ! audioconvert name=convusrMic  \ 
  ! queue name=qusrrsmpMic max-size-time=3000000000 silent=true  \ 
  ! audioresample name=rsmpuserMic  \ 
  ! queue name=qusroutMic max-size-time=3000000000 silent=true  \ 
  ! autoaudiosink
```

**USE SCR:**
```sh
gst-launch-1.0 -v tcpclientsrc name=userinScr host=${EXTADRS} port=7030  \ 
  ! queue name=qusrinScr max-size-time=3000000000 silent=true  \ 
  ! capsfilter name=cfusrdecScr caps-change-mode=immediate caps=image/jpeg,sof-marker=0,width=1200,height=675,pixel-aspect-ratio=1/1,framerate=10/1,interlace-mode=progressive,colorimetry=bt601,chroma-site=jpeg  \ 
  ! queue name=qusrdecMic max-size-time=3000000000 silent=true  \ 
  ! jpegdec name=decScr  \ 
  ! queue name=qusrconvScr max-size-time=3000000000 silent=true  \ 
  ! videoconvert name=convusrScr  \ 
  ! capsfilter name=cfusrconvScr caps-change-mode=immediate caps=video/x-raw,format=BGRx,width=1200,height=675,framerate=10/1,pixel-aspect-ratio=1/1  \ 
  ! videoscale name=vsrecv01  \ 
  ! queue name=qusroutScr max-size-time=3000000000 silent=true \
  ! glimagesink
```

***
