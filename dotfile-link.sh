#!/bin/bash

#// -- .dotfile Symlink Script --------------------------------

#// Set the colors you can use
black="\033[0;30m"        # \[\033[0;30m\]
white="\033[0;37m"        # \[\033[0;37m\]
red="\033[0;31m"          # \[\033[0;31m\]
yellow="\033[0;33m"       # \[\033[0;33m\]
green="\033[0;32m"        # \[\033[0;32m\]
cyan="\033[0;36m"         # \[\033[0;36m\]
blue="\033[0;34m"         # \[\033[0;34m\]
purple="\033[0;35m"       # \[\033[0;35m\]
magenta="\033[0;35m"

#// Resets the style
reset=`tput sgr0`
nocolor="\[\033[0m\]"     # Text Reset

#arg $1 = message
#arg $2 = Color
cecho() {
  echo -e "${2}${1}${reset}"
  return
}

#// Set continue to false by default
CONTINUE=false

echo ""
echo ">>> .dotfile Symlink Script"
cecho "Have you read through the script you're about to run and "
cecho "understood that it will make changes to your computer? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  #// Check if we're continuing and output a message if not
  echo "Please go read the script, it only takes a few minutes"
  echo ""
  exit
fi

#// Ask for the administrator password upfront
sudo -v
echo ""
cecho "*** Root access granted ***" $red

#// Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#// Create Symlinks for dotfiles
echo ""
echo ":: Symlinking dotfiles..."
echo ""
declare -a StringArray=(
  ".bash_profile"
  ".bashrc"
  ".gitattributes"
  ".gitconfig"
  ".irssi"
  ".mutt"
  ".profile"
  ".quakespasm"
  ".tmux.conf"
  ".zshrc"
  "nvim"
  "rtv"
)
for i in ${StringArray[@]}; do
  if [[ -e "$i" ]]; then
    echo $i `cecho "exists" $red`
  else
    if [[ $i == "nvim" ]] ||
      [[ $i == "rtv" ]]; then
      echo ".config/"$i
    else
      echo $i
    fi
  fi
done
# ln -s $HOME/_dotfiles/zsh/zshrc $HOME/.zshrc--test

#// Finish the script
echo ""
cecho ">>> Done" $green
echo ""
