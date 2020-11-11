#!/bin/bash

if [ "$1" == "vid" ]; then
	bgpath=$(shuf -n1 -e $HOME/.local/share/BGs/*.m??)
else
	bgpath=$(shuf -n1 -e $HOME/.local/share/BGs/*)
fi
ftype=$(echo "$bgpath" | awk -F . '{print $NF}')

pkill mpv

case $ftype in
	png|jpg|jpeg)
		echo "Setting image background..."
		wal -i "$bgpath"
		;;
	mp4|mkv)
		echo "Setting video background..."
		ffmpeg -i "$bgpath" -vframes 1 /tmp/$(basename "$bgpath").png -y
		wal -i /tmp/$(basename "$bgpath").png
		$HOME/.local/bin/livebackground.sh "$bgpath" &
		;;
	*)
		echo "Couldn't set background! Unknown file extension."
		;;
esac


