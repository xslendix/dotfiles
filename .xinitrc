#!/bin/sh

compton &
#~/.local/bin/setbf.sh &
~/.local/bin/setbf.sh vid &
safeeyes &
(mpd --kill && mpd --no-daemon) &
xcmenu --daemon &
dunst &
xset r rate 300 50 &
xrandr --dpi 96 --output HDMI-1 --mode 1920x1080 --refresh 144 &
unclutter -idle 1.5 -noevents &
~/.local/bin/fcp.sh &

#ssh-agent i3 
#ssh-agent openbox
#xterm
ssh-agent bspwm
#exec startlxde

