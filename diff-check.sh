#!/bin/sh

DOTFILES=`dirname $BASH_SOURCE`
LISTING=`ls $DOTFILES | grep -v $(basename $0) | grep -v README.md | grep -v LICENSE | grep -v misc`

heading() {
	local BORDER1=""
	local SPACE=""

	LENGTH=`echo $2 | wc -m`
	MIDDLE=$(( ($WIDTH + 1) / 2 - $LENGTH ))
	for i in `seq 1 $LENGTH`; do
		BORDER1="$BORDER1$1"
	done
	local BORDER2="$BORDER1"
	for i in `seq 1 $( echo $DOTFILES | wc -m )`; do
		BORDER2="$BORDER2$1"
	done

	echo -n $BORDER1
	echo -ne "\033[${MIDDLE}C"
	echo $BORDER2
	echo -n ".$2"
	echo -ne "\033[${MIDDLE}C"
	echo "$DOTFILES/$2"
	echo -n $BORDER1
	echo -ne "\033[${MIDDLE}C"
	echo $BORDER2
}

show_diff() {
	local FILE=$1

	diff -s $HOME/.$FILE $DOTFILES/$FILE > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		return
	fi

	which colordiff > /dev/null 2>&1
	WIDTH=`tput cols`
	heading "-" "$FILE"
	if [ $? -eq 0 ]; then
		DIFF="colordiff"
	else
		DIFF="diff"
	fi
	$DIFF -y -W $WIDTH --suppress-common-lines $HOME/.$FILE $DOTFILES/$FILE
}

for OBJ in $LISTING; do
	if [ ! -f "$HOME/.$OBJ" ] && [ ! -d "$HOME/.$OBJ" ]; then
		continue
	fi

	diff -s $HOME/.$OBJ $DOTFILES/$OBJ > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		if [ -d "$HOME/.$OBJ" ]; then
			for FILE in `(cd $DOTFILES && find $OBJ -type f -print)` ; do
				if [ -f "$HOME/.$FILE" ]; then
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
