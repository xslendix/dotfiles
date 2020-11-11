#!/bin/sh

IFS="
"
INTERFACE="${BLOCK_INSTANCE:-enp4s0}"
state="$(cat /sys/class/net/$INTERFACE/operstate)"

[ -z "$state" ] && exit 1

if [ "$state" = "down" ]; then
	echo -n "%{F#FF0000}DOWN%{F-}"
else
	speed="$(cat /sys/class/net/$INTERFACE/speed 2> /dev/null)"

	id=$(nmcli -t -f name,device c show --active | grep $INTERFACE | cut -d ':' -f 1)
	realip="$(ip addr show $INTERFACE | perl -n -e'/inet (.+)\// && print $1')"
	ip="${realip:-0.0.0.0}"

	#[ -n "$id" ] && echo -n "$id "
	echo -n "%{F#00FF00}$ip%{F-}"
	[ -n "$speed" ] && printf " ($speed Mbps)" || printf ''
	#printf $ip
fi

