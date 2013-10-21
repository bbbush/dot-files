# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

function print_screen_title {
  echo -n '\[\ek'"$@"'\e\\\]'
}

function print_tty_title {
  echo -n '\[\e]0;'"$@"'\a\]'
}

[ "$TERM" = "screen" ] &&
  PS1="$(print_tty_title \\u@\\h `uptime` \\w)$(print_screen_title \\h)$PS1"

export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth
