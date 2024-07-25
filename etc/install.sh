#!/bin/bash

# Install pi4wayland Raspberry Pi 4
# Orignal design by Michael, EA7KIR

GOVERSION=1.22.5

whoami | grep -q pi
if [ $? != 0 ]; then
  echo Install must be performed as user pi
  exit
fi

hostname | grep -q pi4
if [ $? != 0 ]; then
  echo Install must be performed on host pi4
  exit
fi

while true; do
   read -p "Install q100receiver using Go version $GOVERSION (y/n)? " answer
   case ${answer:0:1} in
       y|Y ) break;;
       n|N ) exit;;
       * ) echo "Please answer yes or no.";;
   esac
done

echo "
###################################################
Update Pi OS
###################################################
"

sudo apt update
sudo apt -y full-upgrade
sudo apt -y autoremove
sudo apt clean

echo "
###################################################
Making changes to config.txt
###################################################
"

# TODO: as needed

echo "
###################################################
Making changes to config.txt
###################################################
"

echo "
###################################################
Making changes to .profile
###################################################
"

sudo sh -c "echo '\n# EA7KIR Additions' >> /home/pi/.profile"

# Adding go path to .profile
echo -e 'export PATH=$PATH:/usr/local/go/bin' >> /home/pi/.profile

echo "
###################################################
Installing Go $GOVERSION
###################################################
"

GOFILE=go$GOVERSION.linux-arm64.tar.gz
cd /usr/local
sudo wget https://go.dev/dl/$GOFILE
sudo tar -C /usr/local -xzf $GOFILE
cd

echo "
###################################################
Installing gioui dependencies
###################################################
"

sudo apt -y install gcc pkg-config libwayland-dev libx11-dev libx11-xcb-dev libxkbcommon-x11-dev libgles2-mesa-dev libegl1-mesa-dev libffi-dev libxcursor-dev libvulkan-dev

echo "
###################################################
Installing gioui tools
###################################################
"

/usr/local/go/bin/go install gioui.org/cmd/gogio@latest

echo "
###################################################
Prevent this script form being executed again
###################################################
"

chmod -x /home/pi/Q100/etc/install.sh # to prevent it from being run a second time

echo "
INSTALL HAS COMPLETED

    AFTER REBOOTING...

    Ues your finger to configure some Desktop settings:

    Screen Layout Editor
	    move DSI-1 to the left of HDMI-1
	    Layout/Screens set DSI-1 to Active, Primary
	    Layout/Screens set HDMI-1 to Active, 1920x1080, 50Hz
    Appearance Settings
	    DSI-1 Layout No Image
	    HDMI-1 Layout NoVideo.jpg
	    Disable Wastebasket & External Disks
    Raspberry Pi Configuration
	    System set Network at Boot to ON

    Then login from your PC, Mc, or Linux computer

    ssh pi@rxtouch.local

    Now execute the following commands
    
    cd pi4wayland
    go mod tidy
    go build .
    sudo systemctl enable q100receiver
    sudo systemctl start q100receiver

"

while true; do
    read -p "I have read the above, so continue (y/n)? " answer
    case ${answer:0:1} in
        y|Y ) break;;
        n|N ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo reboot