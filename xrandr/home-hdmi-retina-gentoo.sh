#!/bin/sh

sleep 1

monitor=`xrandr | grep -i edp | cut -d " " -f 1`
xrandr --newmode  "1440x900"  106.50  1440 1528 1672 1904  900 903 909 934 -hsync +vsync
xrandr --addmode $monitor 1440x900
xrandr --output $monitor --mode 1440x900

monitor1=`xrandr | grep ^DP1 | cut -d " " -f 1`
monitor2=`xrandr | grep HDMI1 | cut -d " " -f 1`
if [ "x$monitor1" = "xDP1" ] && [ "x$monitor2" = "xHDMI1" ]; then
	xrandr --output VIRTUAL1 --off --output eDP1 --mode 1440x900 \
			--pos 1200x1080 --rotate normal --output DP1 --mode 1920x1080 \
			--pos 0x0 --rotate normal --output HDMI2 --mode 1920x1080 \
			--pos 1920x0 --rotate normal --output HDMI1 --off --output DP2 \
			--off
fi
