# Notes

Compile withou x11

go build --tags nox11 .


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

Press Control-C to stop it

## Via an attached keyboard & Mouse


Errors after kill...  Note: unable to see the end of the message - touchscreen not wide enough

```
cursor)7.299 - [types/wlr_cursor.c:875] Cannot map device "vc4-hdmi-1" to output (not fo)
```

Press Control-C to stop it

## Moving on...

```sudo apt install xwayland``` solves:   Cannot find Xwayland binary "/usr/bin/Xwayland"

Install wayfire-plugins-extra package. Unfortunately it is not available in the Bookworm repos. You have two ways to install it [1]

https://github.com/WayfireWM/wayfire-plugins-extra

## Giving up on the above

Trying another way without wayland or wayfire, but with only X11.



