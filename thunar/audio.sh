#!/bin/bash

# audio.sh converts an audio file to a video file, for barrydegraaff.tk gallery
# convert -size 320x240 xc:black -fill white -draw "gravity Center text 0,0 'Audio by barrydegraaff.tk'" black.png

mkdir "vidout"
filename=`echo "$3" | cut -d'.' -f1`
filename=$2"/vidout/"$filename
avconv -loop 1 -i ~/Scripts/thunar/black.png -i "$1" -shortest -acodec copy "$filename.mp4" &
avconv -i "$1" "$filename.flv" &

#http://diveintohtml5.info/video.html handbrake cli for mp4?
#http://debian-multimedia.org/dists/wheezy/main/binary-amd64/package/handbrake-cli.php

echo "All done, please check if there are any messages in the terminal. And hit enter key to exit."
read end;
exit 0
