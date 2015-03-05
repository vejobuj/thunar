#!/bin/bash

# This script is meant for integration with thunar: appearance: folders
# passed %f
#
# requires zenity, thunar

# recurse find

/usr/bin/ffmpeg -i "$1" -an -ss 00:00:03 -an -r 1 -vframes 1 -y "$1.jpg"
wget http://www.barrydegraaff.tk/js/mediabox/player_flv_maxi.swf

echo '
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html><head><meta content="text/html; charset=UTF-8" http-equiv="content-type"><title>New Flash video</title></head><body><p>
<br>
<object type="application/x-shockwave-flash" data="player_flv_maxi.swf" height="350" width="425">
<param name="movie" value="player_flv_maxi.swf">
    <param name="allowFullScreen" value="true">
    <param name="FlashVars" value="flv='$3'&amp;autoplay=0&amp;width=425&amp;height=350&amp;showfullscreen=1&amp;startimage='$3.jpg'">
</object>
<br>
</p></body></html>' >> "$2/flash_video.html"

exit 0
