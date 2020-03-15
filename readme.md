![](pics/mote.jpg)

# mote

Setup Raspberry Pi's

- Samba
- Wifi
- Commandline
- Reconfigure the default RPi
- etc

Command line:

	kevin@Logan lib $ ssh pi@raven.local
	Last login: Mon May  8 01:36:22 2017 from fe80::f41f:25ff::e764%usb0

	 _ __ __ ___   _____ _ __  
	| '__/ _` \ \ / / _ \ '_ \
	| | | (_| |\ V /  __/ | | |
	|_|  \__,_| \_/ \___|_| |_|


	Wednesday, 10 May 2017,  2:17:19 am UTC
	Linux 4.9.26+ armv6l GNU/Linux

	Uptime.............: 0 days, 00h00m42s
	Memory.............: 253 MB (Free) / 370 MB (Total)
	Storage............: 1.9GB (Free) / 15GB (Total)
	Load Averages......: 0.85, 0.24, 0.08 (1, 5, 15 min)
	CPU Temperature....: 78 F
	Running Processes..: 93
	IP Addresses.......: 192.168.2.18


## Setup

- Install: `sudo apt install libarchive-tools coreutils quilt parted qemu-user-static debootstrap zerofree zip dosfstools libcap2-bin grep rsync xz-utils file git curl bc`

## `config`

```
IMG_NAME="mote"
TARGET_HOSTNAME="mote"
FIRST_USER_PASS="<passwd>"
DEPLOY_ZIP=1
LOCALE_DEFAULT="en_US.UTF-8"
KEYBOARD_KEYMAP="us"
KEYBOARD_LAYOUT="English (US)"
ENABLE_SSH=1
STAGE_LIST="stage0 stage1 stage2 kevin"
WPA_ESSID=<ssid>
WPA_PASSWORD=<passwd>
WPA_COUNTRY=us
APT_PROXY=http://172.17.0.1:3142
```

## Build

1. Clone [pi-gen](https://github.com/RPi-Distro/pi-gen): `git clone --depth=1 https://github.com/RPi-Distro/pi-gen.git`
1. `cp -R kevin pi-gen/`
1. `cp config pi-gen`
	- Set correct `<ssid>` and `<passwd>` for your network
	- Set correct `<passwd>` for default user
1. `cd pi-gen`
1. `rm -fr stage3 stage4 stage5 export-noobs`
1. `rm stage2/EXPORT_NOOB`
1. `mv stage2/EXPORT_IMAGE kevin/`
1. `./build-docker.sh`
	- `PRESERVE_CONTAINER=1` keeps the container around so you can look at it, but you can leave it out too
	- If the build fails, you can fix the error and then run: `CONTINUE=1 ./build-docker.sh`
1. When complete, the zipped image should be in the folder: `deploy`

# Licenses

## Software: MIT License

Copyright (c) 2017 Kevin J. Walchko

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Documentation: Community Commons

<p align="center">
	<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">
		<img alt="Creative Commons License"  src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" />
	</a>
	<br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
</p>
