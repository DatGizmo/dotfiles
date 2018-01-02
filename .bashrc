# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

if [[ $TERM == xterm ]]; then
    TERM=xterm-256color
fi
source acd_func.sh

# Put your fun stuff here.
function findn()
{
    search=$1
    path=$2
    [ -z $path ] && path="."
    echo Search for $search in $path
    find $path -iname "*$search*"
}

function findx()
{
    search=$1
    path=$2
    [ -z $path ] && path="."
    echo "Search for $search in '.' exluding source-mirror and buil*"
    find $path -type d \( -path "*/sourc*" -o -path "*/buil*" \) -prune -o -iname "*$search*" -print
}

alias ls="ls --group-directories-first --color=auto"
alias ll="ls -al"
alias docker-emb="docker -H tcp://emb.data-modul.com:2375"
alias pandoc='docker run -e PUID=${UID} -e PGID=${GID} -ti --rm -v ${PWD}:/source --rm silviof/docker-pandoc'
alias boldssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias picoS0='picocom -e p -b 115200 -f n /dev/ttyS0'
alias picoS5='picocom -e p -b 115200 -f n /dev/ttyS5'
alias picoS6='picocom -e p -b 115200 -f n /dev/ttyS6'
alias picoUSB0='picocom -e p -b 115200 -f n /dev/ttyUSB0'
alias picoUSB1='picocom -e p -b 115200 -f n /dev/ttyUSB1'
alias picoUSB2='picocom -e p -b 115200 -f n /dev/ttyUSB2'
alias picoUSB3='picocom -e p -b 115200 -f n /dev/ttyUSB3'
alias thunderbird='LANG=de_de.UTF-8 thunderbird'
alias tree='tree -C'

keychain --noask --agents gpg,ssh id_rsa
source ~/.keychain/$HOSTNAME-sh
source ~/.keychain/$HOSTNAME-sh-gpg

if [[ $USER == "mogwai" ]]; then
	source ~/.keychain/$HOSTNAME-sh-gpg
	alias mpch="mpc -h GizmoMpD@192.168.1.102"
	export MPD_HOST=GizmoMpD@192.168.1.102
fi

complete -o nospace -d cd


#keychain ~/.ssh/id_rsa
#source ~/.keychain/swe-gentoo-sh
#source ~/.keychain/swe-gentoo-sh-gpg

if test -z "${XDG_RUNTIME_DIR}"; then
	export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
	if ! test -d "${XDG_RUNTIME_DIR}"; then
		mkdir "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
	fi
fi

# set options for less
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
# or the short version
# export LESS='-F -i -J -M -R -W -x4 -X -z-4'

export LESS_TERMCAP_mb=$'\E[01;31m' 
export LESS_TERMCAP_md=$'\E[01;31m' 
export LESS_TERMCAP_me=$'\E[0m' 
export LESS_TERMCAP_se=$'\E[0m' 
export LESS_TERMCAP_so=$'\E[01;44;33m' 
export LESS_TERMCAP_ue=$'\E[0m' 
export LESS_TERMCAP_us=$'\E[01;32m'
export PATH=~/bin:$PATH

if [[ ${EUID} == 0 ]] ; then
       PS1='\[\033[01;34m\]\w \n\[\033[01;30m\]\t \[\033[01;31m\]\h \[\033[01;34m\]\$\[\033[00m\] '
else
       PS1='\[\033[01;34m\]\w \n\[\033[01;30m\]\t \[\033[01;32m\]\u@\h \[\033[01;34m\]\$\[\033[00m\] '
fi

export EDITOR=vim

