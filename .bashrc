# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
       for rc in ~/.bashrc.d/*; do
               if [ -f "$rc" ]; then
                       . "$rc"
               fi
       done
fi


# User specific aliases and functions
#alias screen='screen -U -D -RR -t "\$ |" irssi'
alias screen='tmux attach'
alias screen='abduco -Af dvtm'
alias abduco='[[ "$TERM" =~ "dvtm" ]] && echo "in dvtm" || \abduco'
alias emacs='emacs -nw'
alias start='xdg-open'
alias rdp-client='wlfreerdp /d:msdomain1 /u:byuan +auto-reconnect +clipboard +fonts'

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
[ "$PS1" = "[\u@\h \W]\\$ " ] && ! [[ "$TERM" =~ "dvtm" ]] &&
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
#alias npm="PREFIX=$HOME/.npm-modules/ npm"
alias avro-tools="java -jar /opt/avro-tools/avro-tools-1.9.0.jar"

# vim: set ai expandtab sw=2:
