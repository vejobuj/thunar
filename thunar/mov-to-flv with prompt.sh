#!/bin/bash

# This script will convert Minolta MOV video to FLV web quality (high) and ask for 
# start time and duration

starttime=$(zenity --entry --title "Enter start time" --text "Enter where to start converting this video. For example 00:01:50, will start converting at 1 minute and 50 seconds" --width=200 --height=100)
duration=$(zenity --entry --title "Enter duration" --text "Enter duration of video to convert. Calculate end-time minus start time. For example 00:01:50, will give a video length of 1 minute and 50 seconds" --width=200 --height=100)

ffmpeg -i $1 -r 30 -ac 1 -ab 384 -ar 11025 -s 640x480 -ss $starttime -t $duration -f flv -qscale 6 -y $1.flv

