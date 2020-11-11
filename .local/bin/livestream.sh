#!/usr/bin/env sh
#streamlink -p "mpv --no-audio --wid=$1" file://home/slendi/.local/share/bg.mp4 best
mpv --really-quiet --no-audio --wid=$1 --loop $2
