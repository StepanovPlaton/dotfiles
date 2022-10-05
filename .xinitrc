#!/bin/bash

pkill dwmblocks
dwmblocks &

# /home/dwarf/.scripts/start_transmission_qt.sh -m &
# telegram-desktop &
# discord &

sxhkd -c ~/.config/sxhkd/sxhkdrc &

#picom &

feh --bg-scale $HOME/Pictures/Wallpapers/892803.png
setxkbmap -layout us,ru -option grp:ctrl_shift_toggle

pkill clipmenud
clipmenud &

exec dwm

#sxhkd &
#exec bspwm
