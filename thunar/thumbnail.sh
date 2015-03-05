#!/bin/bash

rm "/tmp/$2.jpg"
rm "/tmp/$2-1.jpg"
ffmpeg -i "$1" -an -ss 00:00:10 -an -r 1 -vframes 1 -y "/tmp/$2.jpg"
#ffmpeg -i "$1" -an -ss 00:05:10 -an -r 1 -vframes 1 -y "/tmp/$2-1.jpg"
geeqie "/tmp/$2.jpg"
#pqiv -i "/tmp/$2-1.jpg"
sleep 5
rm "/tmp/$2.jpg"
rm "/tmp/$2-1.jpg"


