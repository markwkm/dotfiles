#!/bin/sh

DOTFILES=`dirname $BASH_SOURCE`
LISTING=`ls $DOTFILES | grep -v $(basename $0) | grep -v README.md | grep -v LICENSE | grep -v misc`
echo $LISTING

heading() {
	local BORDER=""
	for i in `seq 2 $(echo $2 | wc -m)`; do
		BORDER="$BORDER$1"
	done
	echo $BORDER
	echo $2
	echo $BORDER
}

show_diff() {
	diff $OBJ $HOME/.$OBJ > /dev/null
	if [ $? -eq 0 ]; then
		return
	fi

	which colordiff > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		DIFF="colordiff"
	else
		DIFF="diff"
	fi
	WIDTH=`tput cols`
	$DIFF -y -W $WIDTH --suppress-common-lines $HOME/.$FILE $DOTFILES/$FILE
}

for OBJ in $LISTING; do
	if [ ! -f "$HOME/.$OBJ" ] && [ ! -d "$HOME/.$OBJ" ]; then
		continue
	fi
	diff $OBJ $HOME/.$OBJ > /dev/null
	if [ $? -ne 0 ]; then
		heading "=" ".$OBJ"
		if [ -d "$HOME/.$OBJ" ]; then
			for FILE in `(cd $DOTFILES && find $OBJ -type f -print)` ; do
				if [ -f "$HOME/.$FILE" ]; then
					heading "-" ".$FILE"
					show_diff $FILE
				fi
			done
		else
			if [ -f "$HOME/.$OBJ" ]; then
				show_diff $OBJ
			fi
		fi
	fi
done
