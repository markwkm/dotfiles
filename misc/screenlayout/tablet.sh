#!/bin/sh

CUR=`xrandr | grep eDP1 | awk '{print $4}'`
if [ "$CUR" = "(normal" ]; then
    xrandr --output eDP1 --rotate left

    # evdev
	#xinput set-prop "ELAN Touchscreen" "Evdev Axis Inversion" -1 0
	#xinput set-prop "ELAN Touchscreen" "Evdev Axes Swap" -1

	# libinput
	xinput set-prop  'ELAN Touchscreen' "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
elif [ "$CUR" = "left" ]; then
    xrandr --output eDP1 --rotate inverted

    # evdev
	#xinput set-prop "ELAN Touchscreen" "Evdev Axis Inversion" -1 -1

	# libinput
	xinput set-prop  'ELAN Touchscreen' "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
elif [ "$CUR" = "inverted" ]; then
    xrandr --output eDP1 --rotate right

    # evdev
	#xinput set-prop "ELAN Touchscreen" "Evdev Axis Inversion" 0 -1
	#xinput set-prop "ELAN Touchscreen" "Evdev Axes Swap" -1

	# libinput
	xinput set-prop  'ELAN Touchscreen' "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
elif [ "$CUR" = "right" ]; then
    xrandr --output eDP1 --rotate normal

    # evdev
	#xinput set-prop "ELAN Touchscreen" "Evdev Axis Inversion" 0 0

	# libinput
	xinput set-prop  'ELAN Touchscreen' "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
fi
