#!/bin/bash
# workspaces.sh

# starting at 2 because the first returned isn't a workspace
# however many workspaces you have; I use 10
for i in {2..11}
do

# query bspc wm for the status of the workspaces
SPACE=$(bspc wm --get-status | cut -d ":" -f $i)
	if [[ "$SPACE" == *u* ]] # check for urgency
	then
		echo -ne "%{F#FF0000}" # urgent workspace color
	elif [[ "$SPACE" == *O* ]] # check for focused workspace
	then
		echo -ne "%{F#00FF00}" # active workspace color
	elif [[ "$SPACE" == *o* ]]
	then
		echo -ne "%{F#34baeb}" # unfocused, non-free desktop color
	else
		echo -ne "%{F-}" # free desktop color
	fi
echo -ne "${SPACE:1}%{F-} " # print workspaces to conky
done

