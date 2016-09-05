export GTK2_RC_FILES="$HOME/.gtkrc-2.0-solarized-dark"

export BROWSER="/usr/bin/firefox-bin"

~/.screenlayout/home-2hdmi.sh &

setxkbmap -layout us -variant altgr-intl
if [ -d /usr/share/fonts/mplus ]; then
	xset +fp /usr/share/fonts/mplus
fi
eval `ssh-agent`

# disable audible bell
xset b off

exec i3
