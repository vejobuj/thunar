#!/bin/bash

rm "/tmp/$2.jpg"
rm "/tmp/$2-1.jpg"
ffmpeg -ss 00:00:10 -i "$1" -frames 1 -vf "select=not(mod(n\,1000)),scale=320:240,tile=2x3" -y "/tmp/$2.jpg"
geeqie "/tmp/$2.jpg"
sleep 5
rm "/tmp/$2.jpg"
rm "/tmp/$2-1.jpg"


