#!/bin/bash

# video.sh is an effort to bring video to everyone on the web. It encodes video in a range of formats so everyone gets his browsers favourite.
# See: http://en.wikipedia.org/wiki/HTML5_video#Browser_support
#
# Currently mp4 is broken and must be fixed for this project to succeed.

mkdir "vidout"
filename=`echo "$3" | cut -d'.' -f1`
filename=$2"/vidout/"$filename
#ffmpeg2theora -v 3 -F 25 -c 1 -H 22050 --max_size 640x480 "$1" -o "$filename.ogv" &
#avconv -i "$1"  -r 25  -ac 1 -ab 384 -ar 22050 -s 640x480 -qscale 0.01 -f webm "$filename.webm" &
#avconv -i "$1"  -r 25  -ac 1 -ab 384 -ar 22050 -s 640x480 -qscale 15 -f flv "$filename.flv" &
#avconv -i "$1" -an -ss 00:00:03 -r 1 -vframes 1 "$filename"-03thumb.jpg &
#avconv -i "$1" -an -ss 00:00:06 -r 1 -vframes 1 "$filename"-06thumb.jpg &
#avconv -i "$1" -an -ss 00:00:09 -r 1 -vframes 1 "$filename"-09thumb.jpg &
#avconv -i "$1" -an -ss 00:00:12 -r 1 -vframes 1 "$filename"-12thumb.jpg &
#avconv -i "$1" -an -ss 00:00:18 -r 1 -vframes 1 "$filename"-18thumb.jpg &
#HandBrakeCLI -i "$1" -o "$filename.mp4" -q 30.0 --optimize --preset="iPhone & iPod Touch" &
##HandBrakeCLI -i "$1" -o "$filename.mp4" -q 30.0 --optimize --preset="High Profile" &
HandBrakeCLI -i "$1" -o "$filename.mp4" -e x264 -q 20 -B 160

#http://diveintohtml5.info/video.html handbrake cli for mp4?
#http://debian-multimedia.org/dists/wheezy/main/binary-amd64/package/handbrake-cli.php

echo "All done, please check if there are any messages in the terminal. And hit enter key to exit."
read end;
exit 0
