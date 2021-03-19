#!/bin/bash

#//                           ██
#//                          ░██
#//   ██████   ██████  █████ ░██
#//  ░░░░░░██ ░░██░░█ ██░░░██░██████
#//   ███████  ░██ ░ ░██  ░░ ░██░░░██
#//  ██░░░░██  ░██   ░██   ██░██  ░██
#// ░░████████░███   ░░█████ ░██  ░██
#//  ░░░░░░░░ ░░░     ░░░░░  ░░   ░░

#//-------------------------------------------------
#// arch linux setup script
#//-------------------------------------------------

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
echo ">>> Setting up Arch..."
cecho "Have you read through the script you're about to run and " $red
cecho "understood that it will make changes to your computer? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  #// Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes." $red
  echo ""
  exit
fi

#// Ask for the administrator password upfront
sudo -v
echo ""
cecho "*** Root access granted ***" $red

#// Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#// Make sure we’re using the latest repo
sudo pacman -Syyu

#// Install system binaries
arch_sys=(
  ack
  autoconf
  axel
  bash
  bat
  cairo
  curl
  fd
  findutils
  fish
  htop
  libtool
  moreutils
  ncdu
  p7zip
  prettyping
  pv
  rename
  tldr
  tree
  unzip
  watch
  zsh
)

echo ""
echo "Installing system binaries..."
sudo pacman -S ${arch_sys[@]}

#// Install development binaries
arch_dev=(
  automake
  #awscli
  binutils
  #boost
  cmake
  #cscope
  #eigen
  #elasticsearch
  #emacs
  #ffmpeg
  #firebase-cli
  gcc
  git
  #git-annex
  gist
  #git-crypt
  #heroku-toolbelt
  #jenkins
  #lua
  #markdown
  mariadb
  #msgpack # For neovim
  #mysql
  neovim
  nginx
  node
  node@10
  #nvm
  postgresql
  #pow
  #purescript
  pyenv
  #python
  #python3
  #qt
  rbenv
  #rbenv-gem-rehash
  redis
  #rhino
  #scons # For neovim
  sqlite
  #swig
  #texi2html
  #the_silver_searcher
  #vcsh
  yarn
)

echo ""
echo "Installing development binaries..."
sudo pacman -S ${arch_dev[@]}

#// Install security binaries
arch_sec=(
  #aircrack-ng
  bcrypt
  #cifer
  #dns2tcp
  #ettercap
  #fcrackzip
  #hashpump
  hping
  #hydra
  #john
  #knock
  netcat
  #nettle
  nmap
  #ntopng
  openssl
  #scrypt
  #skipfish
  #socat
  #sqlmap
  tcpdump
  #tcpflow
  #tcpreplay
  #tcptrace
  #ucspi-tcp # `tcpserver` etc.
  wireshark
)

echo ""
echo "Installing security binaries..."
sudo pacman -S ${arch_sec[@]}

#// Install other useful/fun binaries
arch_misc=(
  archey
  binwalk
  cmatrix
  cowsay
  #exiv2
  ffmpeg
  #geoip
  #graphicsmagick
  #graphviz
  #imagemagick --with-webp
  irssi
  #jpeg
  lynx
  mutt
  #mackupi
  neofetch
  speedtest-cli
  tmux
  transmission
  #unrar
  youtube-dl
)

echo ""
echo "Installing misc binaries..."
sudo pacman -S ${arch_misc[@]}

#// Remove outdated versions from the cellar
echo ""
echo "Cleaning up..."
sudo pacman -S cleanup

#// Install AUR applications
aur_apps=(
  datagrip
  dropbox
  evernote
  #firefox
  firefox-developer-edition
  #google-chrome
  #google-chrome-canary
  slack
  spotify
  #visual-studio-code
  vlc
)

#// Install apps to /Applications
#// Default is: /Users/$user/Applications
echo ""
echo "Installing AUR applications..."
yay -S ${aur_apps[@]}

#// Install AUR fonts
aur_fonts=(
  font-input
)

echo ""
echo "Installing AUR fonts..."
yay -S ${aur_fonts[@]}

#// ----------

#// Finish the script
echo ""
cecho "Done!"
echo ""
# echo ""
# cecho "Note that some of these changes require a logout/restart to take effect." $red
# cecho "Killing some open applications in order to take effect." $red
# echo ""
