EDITOR=vim
PAGER=less
bindkey -v

autoload colors; colors

setopt prompt_subst
setopt histignorespace

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

# Prompt stuff
zgit_branch() {
	branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/') || return
	echo "%{$fg[cyan]%}${branch}"
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

prompt_command_ps1() {
	local _PS1
	_PS1="%{$fg[yellow]%}%{%}%n@%m%{%}"
	if [ "x${PGMODE}" = "1" ]; then
		_PS1="${_PS1}%{$fg[white]%}|%{$fg[green]%}${PGUSER}%{$fg[yellow]%}@%{$fg[green]%}${PGHOST}%{$fg[yellow]%}:%{$fg[green]%}${PGPORT}%{$fg[yellow]%}/%{$fg[green]%}${PGDATABASE}"
	fi
	if [ ! "x${STY}" = "x" ]; then
		_PS1="${_PS1}%{$fg[yellow]%}%{$fg[white]%}|${STY}"
	fi
	_PS1="${_PS1} %{$fg[yellow]%}%#%{$reset_color%} "
	if [ "x${PGMODE}" = "x1" ]; then
		PGVERSION=`pg_config --version | awk '{print $2}'`
		_PS1="(${PGVERSION})${_PS1}"
	fi
	echo ${_PS1}
}

prompt_command_rps1() {
	local _RPS1

	if junk=$(git branch 2> /dev/null); then
		_RPS1="%{$fg[yellow]%}(%{$fg[cryan]%}$(zgit_branch)"
		_RPS1="${_RPS1}%{$fg_bold[red]%}$(zgit_clean)%{$reset_color%}"
		_RPS1="${_RPS1}%{$fg[yellow]%})"
	fi
	_RPS1="${_RPS1}%{$fg[yellow]%}[%{$fg[green]%}%{%}%~%{%}%{$fg[yellow]%}]%{$reset_color%}"
	echo ${_RPS1}
}

PS1='$(prompt_command_ps1)'
RPS1='$(prompt_command_rps1)'

# Color sterr
# This doesn't play nice with some programs. i.e. sudo su -
#exec 2>>(while read line; do
#	print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0'; done &)

case $TERM in
	xterm*|*rxvt)
		precmd () {print -Pn "\e]0;%n@%m: %~\a"}
		;;
esac

if [ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then
	source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi

export LESS="-r -x4"
#export LC_ALL="en_US.utf-8"
export LC_ALL="C"
export LANG="$LC_ALL"
