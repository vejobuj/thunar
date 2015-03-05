#!/bin/sh

# /etc/sudoers :: bar     ALL=(chrome) NOPASSWD: ALL
# adduser chrome -s /sbin/nologin
# usermod -aG pulse,pulse-access,audio chrome
# chmod o-rwx /home/bar -R
# chown chrome:bar /home/chrome -R
# chmod 770 /home/chrome -R

sudo -u chrome pulseaudio -k

rm /home/bar/.local/share/recently-used.xbel
rm -Rf /home/bar/.config/google-chrome/
sudo -u chrome killall chrome
sleep 1
sudo -u chrome rm -r -f /home/chrome/Downloads/*
sudo -u chrome rm /home/chrome/.local/share/recently-used.xbel
sudo -u chrome rm -r -f /home/chrome/.cache/google-chrome
sudo -u chrome rm -r -f /home/chrome/.config/google-chrome
sudo -u chrome cp -u -r /home/chrome/.config/google-chrome-default /home/chrome/.config/google-chrome
sudo -u chrome rm -r -f /home/chrome/.macromedia

sudo -u chrome /usr/bin/pulseaudio --start

xhost +
sudo -u chrome google-chrome $1
