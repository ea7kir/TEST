# Notes

running under wayland desktop

Errors in ~/.xsession-errors
    xrdb: Can't open display ''
    xhost:  unable to open display ""


## Ultra Minimal Kiosk

https://gist.github.com/seffs/2395ca640d6d8d8228a19a9995418211

## Via SSH

```
sudo apt install wayfire seatd xdg-user-dirs

touch ~/.config/wayfire.init

```

Force Wayland through raspi-config --> reboot

```wayfire``` ---> A black screen will appear with the mouse pointer at the center.

This workss, but if executed via SSH we get some errors...

```
EE 27-07-24 14:08:21.421 - [EGL] command: eglQueryDeviceStringEXT, error: EGL_BAD_PARAMETER (0x300c), message: "eglQueryDeviceStringEXT"
EE 27-07-24 14:08:21.421 - [EGL] command: eglQueryDeviceStringEXT, error: EGL_BAD_PARAMETER (0x300c), message: "eglQueryDeviceStringEXT"

EE 27-07-24 14:08:23.944 - [xwayland/server.c:442] Cannot find Xwayland binary "/usr/bin/Xwayland"


EE 27-07-24 14:08:24.335 - [types/wlr_cursor.c:875] Cannot map device "vc4-hdmi-0" to output (not found in this cursor)
EE 27-07-24 14:08:24.335 - [types/wlr_cursor.c:875] Cannot map device "vc4-hdmi-1" to output (not found in this cursor)
```

## Via an attached keyboard & Mouse

Also works. To kill it, login over SSH and execute...

```sudo killall wayfire```

Errors after kill...  Note: unable to see the end of the message - touchscreen not wide enough

```
cursor)7.299 - [types/wlr_cursor.c:875] Cannot map device "vc4-hdmi-1" to output (not fo)
```

