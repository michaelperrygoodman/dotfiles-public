#!/bin/bash

#// Alot of these configs have been taken from the various places
#// on the web

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
cecho "Have you read through the script you're about to run and " $red
cecho "understood that it will make changes to your computer? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  #// Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes." $red
  exit
fi

#// Ask for the administrator password upfront.
sudo -v
cecho "*** Root access granted ***" $red

#// Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#// Make sure we’re using the latest Homebrew.
brew update

#// Upgrade any already-installed formulae.
brew upgrade

#// Install GNU core utilities (those that come with macOS are outdated).
#// Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

#// Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

#// Install Bash 5
brew install bash
brew install bash-completion

#// Switch to new bash version from macOS default
#// Don't forget to add `/usr/local/bin/bash` to `/etc/shells`
chsh -u $USER -s $(brew --prefix)/bin/bash

#// Install `wget` with IRI support.
brew install wget #--with-iri

#// Install caskroom
brew tap caskroom/fonts
brew tap caskroom/versions

#// Install Xquartz
brew install cask xquartz

#// Install system binaries
brew_sys=(
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
  watch
  zsh
)

echo ""
echo "Installing system binaries..."
brew install ${brew_sys[@]}

#// Install development binaries
brew_dev=(
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
brew install ${brew_dev[@]}

#// Install security binaries
brew_sec=(
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
brew install ${brew_sec[@]}

#// Install other useful/fun binaries
brew_misc=(
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
brew install ${brew_misc[@]}

#// Remove outdated versions from the cellar
echo ""
echo "Cleaning up homebrew cellar..."
brew cleanup

#// Install cask applications
cask_apps=(
  #0xed
  1password
  #airy
  alfred
  #android-file-transfer
  #bartender
  #blender
  #charles
  #codekit
  #csound
  #datagrip
  #discord
  dropbox
  evernote
  #firefox
  firefox-developer-edition
  #firefox-nightly
  #flame
  #google-chrome
  google-chrome-canary
  #google-drive
  #imageoptim
  istat-menus
  iterm2
  #karabiner-elements
  #kismac
  #little-snitch
  #mactex
  #macvim
  #monolingual
  #navicat-for-postgresql
  #omnidisksweeper
  onyx
  #rested
  #sequel-pro
  #sketch
  slack
  #sourcetree
  #spectacle
  spotify
  stay
  #supercollider
  #the-unarchiver
  #torbrowser
  transmission
  #transmit
  #unison
  #vagrant
  #virtualbox
  #viscosity
  visual-studio-code
  #vivaldi
  vlc
  #vox
  #whatsapp
  #xscope
)

#// Install apps to /Applications
#// Default is: /Users/$user/Applications
echo ""
echo "Installing cask applications..."
brew cask install --appdir="/Applications" ${cask_apps[@]}

#// Install cask fonts
cask_fonts=(
  font-anonymous-pro
  font-anonymous-pro-for-powerline
  font-droid-sans
  font-fira-code
  font-fontawesome
  font-hack
  font-inconsolata
  font-inconsolata-for-powerline
  font-input
  font-iosevka
  font-meslo-lg
  font-meslo-lg-for-powerline
  font-roboto
  font-source-code-pro
  font-sauce-code-powerline
)

echo ""
echo "Installing cask fonts..."
brew cask install ${cask_fonts[@]}

#// Complete
echo ""
cecho "Done!" $cyan
echo ""
echo ""
cecho "########################################################################" $white
echo ""
