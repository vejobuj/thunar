#!/bin/bash

# Integration in Thunar, pass %F appear files: video, audio, images

PLAYLIST="$HOME/playlist.pls"
rm "$PLAYLIST"
touch "$PLAYLIST"

# Loop until all parameters are used up
while [ "$1" != "" ]; do
    echo $1 >> "$PLAYLIST" 
    # Shift all the parameters down by one
    shift
done

mplayer -fs -playlist "$PLAYLIST"

rm "$PLAYLIST"
