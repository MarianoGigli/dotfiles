#!/bin/sh

# setxkbmap es
# setxkbmap -model latitude -layout latam
# setxkbmap us
setxkbmap -model default -layout us -variant altgr-intl
# start redshift
redshift -m randr -PO 5000
# init pulseaudio
start-pulseaudio-x11 &
# lock
#xautolock -time 10 -locker xtrlock &

# Start bspwm
#exec /usr/bin/bspwm
exec /usr/bin/spectrwm
