# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias sc='systemctl'
alias emacs='emacs -nw'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

unset LC_ALL

export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth

#[ -e /usr/bin/tracker-control ] && [ -x /usr/bin/tracker-control ] && /usr/bin/tracker-control -r > /dev/null


