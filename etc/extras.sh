#!/bin/bash

# https://dustinpfister.github.io/2020/03/27/linux-raspbian-lite-xserver-xorg/

sudo apt-get install xserver-xorg

sudo apt-get install xinit

sudo apt-get install x11-xserver-utils

sudo apt-get install blackbox

sudo apt-get install xterm

# startx ### this works, but only from the console

# sudo apt-get install lightdm ### lightdm.service fails to satrt
