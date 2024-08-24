#!/bin/bash

# Install pi4wayland on pi4.local
# Orignal design by Michael, EA7KIR

GOVERSION=1.22.5
GIOUIVERSION=7.1

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
   read -p "Install pi4lite using Go version $GOVERSION (y/n)? " answer
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
Install X11 components
###################################################
"

sudo apt -y install xserver-xorg xinit x11-xserver-utils
sudo apt -y install blackbox
sudo apt -y install xterm
sudo apt -y install lightdm

echo "
###################################################
Making changes to config.txt TODO:
###################################################
"

#sudo sh -c "echo '\n# EA7KIR Additions' >> /boot/firmware/config.txt"

# Disable Wifi
#sudo sh -c "echo 'dtoverlay=disable-wifi' >> /boot/firmware/config.txt"

# Disable Bluetooth
#sudo sh -c "echo 'dtoverlay=disable-bt' >> /boot/firmware/config.txt"

# EXPERIMENTAL: raspi-config, select System / Audio, choose 1
#sudo sh -c "echo 'dtparam=audio=off' >> /boot/firmware/config.txt"

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
Installing gioui tools $GIOUIVERSION
###################################################
"

/usr/local/go/bin/go install gioui.org/cmd/gogio@$GIOUIVERSION

echo "
###################################################
Installing wayfire TODI:
###################################################
"

cd
mkdir .config
touch .config/wayfire.ini
sudo apt install wayfire seatd xdg-user-dirs lightdm

echo "
###################################################
Prevent this script form being executed again
###################################################
"

chmod -x /home/pi/pi4lite/etc/install.sh

echo "
###################################################
INSTALL HAS COMPLETED
###################################################
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
