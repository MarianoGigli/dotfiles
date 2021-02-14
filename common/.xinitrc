#!/bin/sh

# setxkbmap -model latitude -layout latam
setxkbmap -model default -layout us -variant altgr-intl

# start redshift
redshift -m randr -PO 5000

# init pulseaudio
start-pulseaudio-x11 &

# Start wm
exec /usr/bin/spectrwm
