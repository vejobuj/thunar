#!/bin/bash
## Create AVI video with all images *.JPG in directory and add mp3 file to avi
## Put script in folder with JPG files and one MP3 file then: chmod +x jpg-mp3-to-avi.sh
## Execute the script, make sure mencoder is installed. (JPG extension is case sensitive!)
##
## JPG files must be the same resolution or this script will die
##
## Alternatively this script can be called from thunar file manager, custom actions,
## appear at folders. Pass directory as argument.

## Preview here: http://www.barrydegraaff.tk/blog/index.php?blog=20090822234803

if [ "$1" == "" ]
then
directory=$(pwd)
else
directory=$1
fi

mp3file=$(find "$directory" -iname "**.mp3*")
echo "*** Creating your AVI slideshow ***
Your audio was found: " $mp3file 
echo "Your working dir: " $directory

echo "creating video..."
cd  "$directory"
mencoder mf://"$directory/*.JPG" -mf w=640:h=480:fps=1.00:type=jpg -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell -oac copy -audiofile "$mp3file" -o "$directory/"output.avi

#mplayer output.avi



