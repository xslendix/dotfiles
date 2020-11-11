#!/usr/bin/env sh
xwinwrap -fs -fdt -ni -b -nf -un -o 1.0 -debug -- mpv --really-quiet -wid WID --loop "$1" #--no-audio "$1"
