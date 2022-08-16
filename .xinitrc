#!/bin/bash

pkill dwmblocks
dwmblocks &

/home/dwarf/.scripts/start_transmission_qt.sh -m &
telegram-desktop &
#discord &

sxhkd -c ~/.config/sxhkd/sxhkdrc &

picom &

feh --bg-scale $HOME/Pictures/Wallpapers/892803.png

exec dwm

#sxhkd &
#exec bspwm
