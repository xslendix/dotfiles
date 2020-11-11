#!/bin/bash

FPS="60"
QUAL="faster"
GOP="60"
GOPMIN="30"
CBR="1500k"
ABR="96k"
SIZE="19201080"
OUTPUT="rtmp://live-jfk.twitch.tv/app/$(base64 -d ~/.twitchcode)"
INRES="$(xdpyinfo | grep dimensions | awk '{print $2;}')"

# Modify so it fits your system settings.
ffmpeg -f x11grab -video_size 1920x1080 -framerate 24 -i $DISPLAY -f alsa -i default -af acompressor=threshold=0.089:ratio=9:attack=200:release=1000 -vf scale=1280x720 -c:v h264 -g 24 -b:v 2M -preset ultrafast -c:a aac -pix_fmt yuv420p -f flv $OUTPUT
