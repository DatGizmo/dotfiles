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

# Put your fun stuff here.
alias docker-emb="docker -H tcp://emb.data-modul.com:2375"
alias boldssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias findn='find -iname'

keychain --noask ~/.ssh/id_rsa
source ~/.keychain/swe-gentoo-sh 
source ~/.keychain/swe-gentoo-sh-gpg

#eval `keychain --eval --agents ssh,gpg id_rsa`

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

export LESS_TERMCAP_mb=$'\E[01;31m' 
export LESS_TERMCAP_md=$'\E[01;31m' 
export LESS_TERMCAP_me=$'\E[0m' 
export LESS_TERMCAP_se=$'\E[0m' 
export LESS_TERMCAP_so=$'\E[01;44;33m' 
export LESS_TERMCAP_ue=$'\E[0m' 
export LESS_TERMCAP_us=$'\E[01;32m'

