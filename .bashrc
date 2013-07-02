# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias screen='screen -U -D -RR -t "\$ |" irssi'
alias emacs='emacs -nw'
alias start='xdg-open'
alias xfreerdp='xfreerdp -0 -f -d msdomain1 -u byuan -x b -z --plugin cliprdr --rfx --composition --ntlm 2'

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

export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth

