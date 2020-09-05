#!/bin/sh

EDP=`xrandr | grep "\<connected\>" | grep -i edp | cut -d " " -f 1`

connect3() {
	xrandr --output $EDP --mode 1920x1080 --pos 1920x1200 \
			--output $1 --primary --mode 1920x1200 --pos 1920x0 \
			--output $2 --mode 1920x1080 --pos 0x0 \
			--output $3 --mode 1920x1080 --pos 3840x0
}

# Notes: 2048x1152 on the laptop display seems to be quite sharper than
# 1920x1080.

PROVIDERS=`xrandr --listproviders | head -n 1 | cut -d ":" -f 3`

for i in `seq 1 $PROVIDERS`; do
	xrandr --setprovideroutputsource $i 0
done

# it seems like xrandr --list monitors should show connected monitors that
# are not active
CONNECTED=`xrandr | grep "\<connected\>" | wc -l`

if [ $CONNECTED -eq 1 ]; then
	xrandr --output $EDP --mode 1920x1080 --primary
elif [ $CONNECTED -eq 4 ]; then
	connect3 `xrandr | grep "\<connected\>" | grep -v -i edp | cut -d " " -f 1 | sort | xargs`
fi
