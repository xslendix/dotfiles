#!/bin/sh

panel_wid=$(xdo id -a lemonpanel)

bspc control --subscribe window_state | while read msg name state wid ; do
    [ $name = "fullscreen" -a $state = "on" ] && xdo below -t $wid $panel_wid
done
