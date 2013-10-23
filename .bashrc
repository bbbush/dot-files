# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions

function print_screen_title
{
  echo -n '\[\ek'"$@"'\e\\\]'
}

function do_print_screen_title
{
  echo -ne '\033k'"$@"'\033\\'
}

function print_tty_title
{
  echo -n '\[\e]0;'"$@"'\a\]'
}

case "$TERM" in
  screen)
  OLDPS1=$PS1
  PS1="$(print_tty_title \\u@\\h `uptime` \\w)$(print_screen_title \\h)$OLDPS1"
  # http://mg.pov.lt/blog/bash-prompt.html
  # Show the currently running command in the terminal title:
  # http://www.davidpashley.com/articles/xterm-titles-with-bash.html
  on_next_command()
  {
    case "$BASH_COMMAND" in
      echo\ -ne\ \"\\033*)
      ;;
      *)
      #echo -n $BASH_COMMAND
      PS1CMD=$(echo -n $BASH_COMMAND | cut -d " " -f1)
      do_print_screen_title ${HOSTNAME/.*/} $PS1CMD
      PS1="$(print_tty_title \\u@\\h `uptime` \\w)$(print_screen_title \\h)$OLDPS1"
      ;;
    esac
  }
  trap on_next_command DEBUG
  ;;
esac

export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth

# vim: set ai noexpandtab sw=2:
