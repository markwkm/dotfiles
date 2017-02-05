#!/bin/sh
EXT_MON=`xrandr | grep -v "^eDP1" | grep " connected " | cut -d " " -f 1`
for MON in $EXT_MON; do
	xrandr --output $MON --off
done
