# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.1-1

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

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
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

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

OPT=/c/cygwin64/Opt

#export vi='"C:/Program Files (x86)/Vim/vim81/gvim.exe"'
#export EDITOR=$vi
#alias vi=$vi
alias subl='"C:/Program Files/Sublime Text 3/subl"'
#alias chocolatey='$OPT/chocolatey/bin/chocolatey.bat'
#alias start=cygstart
#alias showimage=cygstart
alias screen='screen -D -R -R'
alias l.='ls -Ad .*'
#alias fish='PATH=/usr/local/bin:/usr/bin:$OPT/Git/cmd fish'
alias rustc='$OPT/Rust/20150112/bin/rustc'
#alias sn='"$PROGRAMFILES/Microsoft SDKs/Windows/v8.1A/bin/NETFX 4.5.1 Tools/x64/sn.exe"'
alias nuget='$OPT/NuGet-5/nuget.exe'
alias mvn='JAVA_HOME="C:/Program Files/Amazon Corretto/jdk11.0.11_9" \
  $OPT/apache-maven-3/bin/mvn'
alias java='"C:/Program Files/Amazon Corretto/jdk11.0.11_9/bin/java"'
alias msbuild='"C:/Windows/Microsoft.NET/Framework/v4.0.30319/msbuild.exe"'
alias msbuild_jb15='$OPT/JetMSBuild.v15.9.20.62856/MSBuild/15.0/Bin/MSBuild.exe'
alias msbuild_jb16='"C:/Program Files/JetBrains/JetBrains Rider 2019.3.1/tools/MSBuild/Current/Bin/MSBuild.exe"'
alias msbuild_vs2019='"C:/Program Files (x86)/Microsoft Visual Studio/2019/Professional/MSBuild/Current/Bin/MSBuild.exe"'
alias vstest_vs2019='"C:/Program Files (x86)/Microsoft Visual Studio/2019/Professional/Common7/IDE/CommonExtensions/Microsoft/TestWindow/vstest.console.exe"'
alias jconsole='"C:/Program Files/Amazon Corretto/jdk11.0.11_9/bin/jconsole"'
alias avro-tools='java -jar $OPT/apache-avro-1.9/avro-tools-1.9.2.jar'
#alias winpty='$OPT/winpty-0.4.2-cygwin-2.6.1-ia32/bin/winpty'
alias 7z='"C:/Program Files/7-zip/7z"'
alias redis-cli='docker run --rm -it --name redis-cli redis redis-cli'
alias tf='docker run --rm -i --name terraform hashicorp/terraform'
#alias tf='$OPT/terraform-0.12-x64/terraform.exe'
alias jq='$OPT/jq-1.6-x64/jq-win64.exe'
alias mc='winpty $OPT/minikube-x64/minikube-windows-amd64.exe'
alias kc='$OPT/kubernetes-client-x64/kubectl.exe'
alias kubefed='$OPT/kubernetes-client-x64/kubefed.exe'
alias pr='git pr'
alias s3key='docker run --rm -i s3key'
alias emacs='emacsclient --alternate-editor="" -n'
alias aws='MSYS_NO_PATHCONV=1 docker run -v ~/.aws:/root/.aws -i --rm amazon/aws-cli'
alias aws_cd='MSYS_NO_PATHCONV=1 docker run -v ~/.aws:/root/.aws -v $(pwd):/.pwd -i --rm amazon/aws-cli'

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

function link
{
  # Windows needs to be told if it's a directory or not. Infer that.
  # Also: note that we convert `/` to `\`. In this case it's necessary.
  if [[ -d "$2" ]]; then
    cmd <<< "mklink /D \"$1\" \"${2//\//\\}\"" > /dev/null
  else
    cmd <<< "mklink \"$1\" \"${2//\//\\}\"" > /dev/null
  fi
}

alias ssh-keygen=ssh_keygen_internal_server
export GIT_TFS_CLIENT=2008
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth
export LESS=-R

# vim: set ai expandtab sw=2:

