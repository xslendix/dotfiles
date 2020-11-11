#!/bin/sh

while :; do
	echo -n " "
	$HOME/.local/bin/workspaces_bspwm.sh
	echo -n " - "
	dots.py 60 "$(xdotool getactivewindow getwindowname | tr -d '\n')"
	echo -n "%{r}"
	printf "$(mpc | head -n1) - $(mpc | sed -n '2p' | cut -d' ' -f 5)"
	printf " | CPU: "
	top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{printf 100 - $1"%"}'
	printf " | MEM: "
	$HOME/.local/bin/memory
	printf " | DSK: "
	$HOME/.local/bin/disk
	printf " | WIFI: "
	BLOCK_INSTANCE=wlp5s0 $HOME/.local/lib/i3blocks/network.sh
	printf " | ETH: "
	$HOME/.local/bin/network.sh
	printf " | "
	#date '+%Y-%m-%d %I:%M:%S %P '
	date '+%Y-%m-%d %I:%M %P '
	sleep 0.5
done

