export LC_ALL="en_US.utf-8"
export LANG="en_US.utf-8"
export TERM=rxvt-unicode-256color
export COLORTERM=rxvt-unicode-256color

export BROWSER="/usr/bin/firefox-bin"

~/.screenlayout/home-2hdmi.sh &

setxkbmap -layout us -variant altgr-intl
eval `ssh-agent`

exec i3
#exec awesome
#openbox-session
#startlxde
