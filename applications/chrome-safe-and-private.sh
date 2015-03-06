#!/bin/sh

# /etc/sudoers :: bar     ALL=(chrome) NOPASSWD: ALL
# adduser chrome -s /sbin/nologin
# usermod -aG pulse,pulse-access,audio chrome
# chmod o-rwx /home/bar -R
# chown chrome:bar /home/chrome -R
# chmod 770 /home/chrome -R

# systemctl stop pulseaudio
# systemctl disable pulseaudio
# systemctl mask pulseaudio

# DANGER your MIC is now OPEN (a bit more)! But I removed my MIC so OK!
# cat /etc/pulse/default.pa | grep cookie
# load-module module-native-protocol-unix auth-anonymous=1 auth-cookie-enabled=0
# nano /etc/pulse/default.pa 

killall pulseaudio
sudo -u chrome killall pulseaudio
 
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

xhost +
sudo -u chrome google-chrome $1
