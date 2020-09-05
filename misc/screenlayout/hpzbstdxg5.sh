#!/bin/sh

# Notes: 2048x1152 on the laptop display seems to be quite sharper than
# 1920x1080.

CHECK=`lsmod | grep nouveau`
PROVIDERS=`xrandr --listproviders | head -n 1 | cut -d ":" -f 3`

# nouveau driver not loaded, assuming hybrid mode with intel driver

# run this in order to detect monitors connect via egpu
for i in `seq 1 $PROVIDERS`; do
	xrandr --setprovideroutputsource $i 0
done

# it seems like xrandr --list monitors should show connected monitors that
# are not active
CONNECTED=`xrandr | grep "\<connected\>" | wc -l`

if [ $CONNECTED -eq 1 ]; then
		#xrandr --output eDP1 --mode 2048x1152 --primary
		xrandr --output eDP1 --mode 1920x1080 --primary
elif [ $CONNECTED -eq 4 ]; then
		xrandr --setprovideroutputsource 1 0
		xrandr --output eDP1 --mode 2048x1152 --pos 1856x1200 \
				--output DisplayPort-1-2 --primary --mode 1920x1200 --pos 1920x0 \
				--output DisplayPort-1-3 --mode 1920x1080 --pos 0x0 \
				--output DisplayPort-1-4 --mode 1920x1080 --pos 3840x0
fi
