#!/bin/sh

bspc desktop -f '^2'
pkill vimpc
pkill cli-visualizer
sleep 0.1
st -e vimpc &
st -e cli-visualizer &

