#!/usr/bin/sh

icon="/home/mariano/Pictures/tux-icon.png"
tmpbg='/tmp/screen.png'

# (( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" -blur 0x9 "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"