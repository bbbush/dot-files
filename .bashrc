# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth

[[ -f /etc/bash_completion ]] && . /etc/bash_completion
