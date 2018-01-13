export TERM=tmux-256color
export COLORTERM=truecolor
export LESS="-r -x4"

export GTK2_RC_FILES="$HOME/.gtkrc-2.0-solarized-dark"
export EDITOR=vim
export PAGER=less

bindkey -v

autoload colors; colors

setopt prompt_subst
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt inc_append_history

umask 022

# SSH hosts tab completion

autoload -U compinit; compinit
local _myhosts
_myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*' hosts $_myhosts

bindkey '\e/' vi-history-search-backward

# History stuff

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zhistory
setopt inc_append_history

# Prompt and window title bar functions

PS_SHOW_PATH=0

zgit_branch() {
	branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/') || return
	echo "%{$fg[cyan]%}${branch}"
}

zgit_branch_title() {
	branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/') || return
	echo "(${branch}$(zgit_clean))"
}

zgit_clean() {
	if git diff --quiet 2>/dev/null; then
		echo ""
	else
		echo "!"
	fi
}

zgit_unmerged() {
	local -a flist
	flist=($(git ls-files -u))
	if [ $#flist -gt 0 ]; then
		echo "%{$fg[red]%}*"
	else
		echo ""
	fi
}

precmd() {
	local _GITINFO
	if junk=$(git branch 2> /dev/null); then
		_GITINFO=" $(zgit_branch_title)"
	fi
	print -Pn "\e]0;%n@%m: %~$_GITINFO\a"
	print -Pn "\a"
}

prompt_command_ps1_min() {
	echo "%{$fg[yellow]%}%#%{$reset_color%} "
}

prompt_command_ps1() {
	local _PS1

	_PS1="%{$fg[yellow]%}%{%}%n@%m%{%}"
	if [ "x${PGMODE}" = "x1" ]; then
		_PS1="${_PS1}%{$fg[brwhite]%}|%{$fg[green]%}${PGUSER}%{$fg[yellow]%}@%{$fg[green]%}${PGHOST}%{$fg[yellow]%}:%{$fg[green]%}${PGPORT}%{$fg[yellow]%}/%{$fg[green]%}${PGDATABASE}"
	fi
	_PS1="${_PS1} %{$fg[yellow]%}%#%{$reset_color%} "
	if [ "x${PGMODE}" = "x1" ]; then
		PGVERSION=`pg_config --version | awk '{print $2}'`
		_PS1="(${PGVERSION})${_PS1}"
	fi
	echo "${_PS1}"
}

prompt_command_rps1() {
	local _RPS1

	if junk=$(git branch 2> /dev/null); then
		_RPS1="%{$fg[yellow]%}(%{$fg[cyan]%}$(zgit_branch)"
		_RPS1="${_RPS1}%{$fg_bold[red]%}$(zgit_clean)%{$reset_color%}"
		_RPS1="${_RPS1}%{$fg[yellow]%})"
	fi
	if [ $PS_SHOW_PATH -eq 1 ]; then
		_RPS1="${_RPS1}%{$fg[yellow]%}[%{$fg[green]%}%{%}%~%{%}%{$fg[yellow]%}]"
	fi
	echo "${_RPS1}%{$reset_color%}"
}

hide() {
	if [ "x$1" = "xps1" ]; then
		PS1='$(prompt_command_ps1_min)'
	elif [ "x$1" = "xrps1" ]; then
		unset RPS1
	elif [ "x$1" = "xpath" ]; then
		PS_SHOW_PATH=0
	else
		echo "$0: don't know what you meant"
	fi
}

show() {
	if [ "x$1" = "xps1" ]; then
		PS1='$(prompt_command_ps1)'
	elif [ "x$1" = "xrps1" ]; then
		RPS1='$(prompt_command_rps1)'
	elif [ "x$1" = "xpath" ]; then
		PS_SHOW_PATH=1
	else
		echo "$0: don't know what you meant"
	fi
}

PS1='$(prompt_command_ps1)'

# Color sterr
# This doesn't play nice with some programs. i.e. sudo su -
#exec 2>>(while read line; do
#	print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0'; done &)

VIRTUALENVWRAPPER="/usr/bin/virtualenvwrapper.sh"
if [ -f "$VIRTUALENVWRAPPER" ]; then
	source $VIRTUALENVWRAPPER
fi

# For awesome
which wmname > /dev/null 2>&1
if [ $? -eq 0 ]; then
	wmname LG3D
fi

which dircolors > /dev/null 2>&1
if [ $? -eq 0 ]; then
	alias ls="ls --color=auto"
	eval `dircolors ~/.dir_colors`
fi

which keychain > /dev/null 2>&1
if [ $? -eq 0 ] && ! [ "x$DISPLAY" = "x" ]; then
	eval `keychain --eval --agents ssh,gpg`
fi
