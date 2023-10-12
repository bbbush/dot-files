# vim: set ai expandtab sw=2:
# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ $PS1 && -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
 alias rm='rm -i'
 alias cp='cp -i'
 alias mv='mv -i'
#
# Default to human readable figures
 alias df='df -h'
 alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
 alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
 alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
 alias ll='ls -l'                              # long list
 alias la='ls -A'                              # all but . and ..
 alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle ()
# {
#   echo -ne "\e]2;$@\a\e]1;$@\a";
# }
#
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
#
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
#
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
#
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
#
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
#
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
#
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
#
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
#
#   return 0
# }
#
# alias cd=cd_func

function print_screen_title {
  echo -n '\[\ek'"$@"'\e\\\]'
}

function print_tty_title {
  echo -n '\[\e]0;'"$@"'\a\]'
}

[ "$TERM" = "screen" ] &&
  PS1="$(print_tty_title)\n$(print_screen_title)${PS1/\\n/}"

alias screen='screen -D -R -R'
alias l.='ls -Ad .*'
alias vi='nvim -u ~/.vimrc'
[[ $(command -v shasum) && !$(command -v sha1sum) ]] && alias sha1sum=shasum
[[ $(command -v podman) ]] && alias docker=podman

function ssh_keygen_internal_server
{
  if [ "$1" = "" ]; then
    echo "run ssh-keygen without params"
    ssh-keygen
  else
    SSH_USER_HOST=msdomain1\\byuan@$1
    ssh-keygen -o -t rsa -b 4096 -C $SSH_USER_HOST -f ~/.ssh/id_rsa_$1
    #ssh-copy-id -i ~/.ssh/id_rsa_$1 $SSH_USER_HOST
  fi
}

alias ssh-keygen=ssh_keygen_internal_server
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth
export LESS=-R
export HOMEBREW_NO_AUTO_UPDATE=1
export PIP_REQUIRE_VIRTUALENV=1

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
[[ "$PS1" =~ "\h:\W" ]] &&
  PS1="$C_PADDING$C_GRAY[$C_DARKBLUE\u$C_DARKMAG@$C_GRAY\h $C_DARKBLUE\W$C_DARKGREEN\$(__git_ps1)$C_GRAY]$C_RED\\$ $C_NONE"

SCREEN_TS="\[\033k\]"
SCREEN_FS="\[\033\0134\]"
[ "$TERM" = "screen" ] &&
PROMPT_COMMAND="echo -n -e \"\033k\033\0134\"; $PROMPT_COMMAND"

function aws_try_login
{
  aws sts get-caller-identity || { aws sso login; aws-sso-cred-restore && aws sts get-caller-identity; } || __aws_reset_login
}

function __aws_reset_login
{
 mkdir -p ~/.aws && \
   base64 -d > ~/.aws/config <<<W2RlZmF1bHRdCnNzb19zdGFydF91cmwgPSBodHRwczovL21vcm5pbmdzdGFyLXNzby5hd3NhcHBzLmNvbS9zdGFydC8Kc3NvX3JlZ2lvbiA9IHVzLWVhc3QtMQo= && \
   aws configure sso --profile default && \
   sed -i -e 's,\[default],[profile default],' ~/.aws/config
 aws-sso-cred-restore && aws sts get-caller-identity
}

function aws_paste_credentials
{
  sed 's,\[.*\],[default],' > ~/.aws/credentials
}

