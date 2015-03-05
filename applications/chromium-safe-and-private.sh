#!/bin/sh

# /etc/sudoers :: bar     ALL=(chrome) NOPASSWD: ALL


rm /home/bar/.local/share/recently-used.xbel
rm -Rf /home/bar/.config/chromium/
sudo -u chrome killall chromium
sleep 1
sudo -u chrome rm -r -f /home/chrome/Downloads/*
sudo -u chrome rm /home/chrome/.local/share/recently-used.xbel
sudo -u chrome rm -r -f /home/chrome/.cache/chromium
sudo -u chrome rm -r -f /home/chrome/.config/chromium
sudo -u chrome cp -u -r /home/chrome/.config/chromium-default /home/chrome/.config/chromium
sudo -u chrome rm -r -f /home/chrome/.macromedia

xhost +
sudo -u chrome chromium --ppapi-flash-path=/home/chrome/.gcsc-pepflash/libpepflashplayer.so $1
