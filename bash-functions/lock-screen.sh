#!/usr/bin/env bash
#take screen shot
import -window root /tmp/screenshot.png
#blur it
#convert /tmp/screenshot.png -blur 0x5 /tmp/screenshot-blur.png
#rm /tmp/screenshot.png
#i3lock -i /tmp/screenshot-blur.png
icon="$HOME/Pictures/icon.png"
tmpbg='/tmp/screenshot.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"
