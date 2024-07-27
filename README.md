# pi4wayland

Strictly for testing gioui on Raspberry Pi OS Lite (64-bit)

## Hardware
- Raspberry Pi 4B with 4GB RAM (minimum)
- Raspberry Pi Official 7" Touch Screen

## Installing

NOTE: CURRENTLY REQUIRES Raspberry Pi OS Lite (64-bit)

### Using Raspberry Pi Imager v1.8.5:
```
CHOOSE OS: Raspberry Pi OS (other) -> Raspberry Pi OS Lite (64-bit)

CONFIGURE:
	Set hostname:			pi4
	Enable SSH
		Use password authentication
	Set username and password
		Username:			pi
		Password: 			<password>
	Set locale settings
		Time zone:			<Europe/Madrid> # or wherever you are
		Keyboard layout:	<us>
	Eject media when finished
SAVE and WRITE
```

Insert the card into the Raspberry Pi and switch on

WARNING: the Pi may reboot during the install, so please allow it to complete

### Remote login from a Mac, PC or Linux host
```
ssh pi@pi4.local

sudo apt update
sudo apt -y install git
cd
git clone https://github.com/ea7kir/pi4lite.git
cd pi4lite/etc
chmod +x install.sh
./install.sh
```

THEN FOLLOW THE INSTRUCTIONS TO CONFIGURE THE DESKTOP

## License
Copyright (c) 2023 Michael Naylor EA7KIR (https://michaelnaylor.es)

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see https://www.gnu.org/licenses/.

