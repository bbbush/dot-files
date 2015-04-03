# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias screen='screen -U -D -RR -t "\$ |" irssi'
alias emacs='emacs -nw'
alias start='xdg-open'
alias xfreerdp='xfreerdp /size:1280x900 /d:msdomain1 /u:byuan +clipboard'

C_NONE="\[\033[m\]"
C_RED="\[\033[1;31m\]"
C_GREEN="\[\033[1;32m\]"
C_DARKGREEN="\[\033[0;32m\]"
C_YELLOW="\[\033[1;33m\]"
C_DARKYELLOW="\[\033[0;33m\]"
C_BLUE="\[\033[1;34m\]"
C_DARKBLUE="\[\033[0;34m\]"
C_MAG="\[\033[1;35m\]"
C_DARKMAG="\[\033[0;35m\]"
C_CYAN="\[\033[1;36m\]"
C_WHITE="\[\033[1;37m\]"
C_GRAY="\[\033[0;37m\]"
C_PADDING="\[\033[0000m\]"
[ "$PS1" = "[\u@\h \W]\\$ " ] &&
PS1="$C_PADDING$C_GRAY[$C_DARKBLUE\u$C_DARKMAG@$C_GRAY\h $C_DARKBLUE\W$C_GRAY]$C_RED\\$ $C_NONE"

SCREEN_TS="\[\033k\]"
SCREEN_FS="\[\033\0134\]"
[ "$TERM" = "screen" ] &&
PROMPT_COMMAND="echo -n -e \"\033k\033\0134\"; $PROMPT_COMMAND"

unset LC_ALL

export EDITOR=vim
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth

function ssh_keygen_internal_server
{
  if [ "$1" = "" ] || [ "$SSH_USER" = "" ]; then
    echo "run ssh-keygen without params"
    ssh-keygen
  else
    SSH_USER_HOST=$SSH_USER@$1
    ssh-keygen -t rsa -b 4096 -C $SSH_USER_HOST -f ~/.ssh/id_rsa_$1
    #ssh-copy-id -i ~/.ssh/id_rsa_$1 $SSH_USER_HOST
  fi
}

alias ssh-keygen=ssh_keygen_internal_server

# vim: set ai expandtab sw=2:

