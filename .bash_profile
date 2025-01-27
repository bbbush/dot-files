# User dependent .bash_profile file
eval "$(/opt/homebrew/bin/brew shellenv)"

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi



# Added by Toolbox App
export PATH="$PATH:/Users/blue.yuan/Library/Application Support/JetBrains/Toolbox/scripts"


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

