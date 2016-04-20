# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth

alias vim='TERM=xterm-256color /opt/vim-7.4/bin/vim'
alias screen='screen -D -R -R'

[[ -f /etc/bash_completion ]] && . /etc/bash_completion

function print_screen_title {
  echo -n '\[\ek'"$@"'\e\\\]'
}

function print_tty_title {
  echo -n '\[\e]0;'"$@"'\a\]'
}

[ "$TERM" = "screen" ] &&
  PS1="$(print_tty_title)\n$(print_screen_title)${PS1/\\n/}"
