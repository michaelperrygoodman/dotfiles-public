#!/bin/bash

#// Set the colors you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

#// Resets the style
reset=`tput sgr0`

#arg $1 = message
#arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
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

#// Install GNU core utilities (those that come with OS X are outdated).
#// Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

#// Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

#// Install Bash 4
brew install bash
brew install bash-completion

#// Switch to new bash version from OSX default
#// Don't forget to add `/usr/local/bin/bash` to `/etc/shells`
chsh -u $USER -s $(brew --prefix)/bin/bash

#// Install `wget` with IRI support.
brew install wget --with-iri

#// Install more recent versions of some OS X tools.
brew tap homebrew/dupes
brew tap homebrew/versions
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

#// Install caskroom
brew tap caskroom/fonts
brew tap caskroom/versions
brew install caskroom/cask/brew-cask

#// Deprecated, install manually
#brew install caskroom/cask/xquartz
#brew install caskroom/cask/java
#
#// Install system binaries
brew_sys=(
  ack
  autoconf
  axel
  cairo
  curl
  htop
  gnu-sed
  libtool
  pv
  rename
  tree
  watch
  zsh
)

echo ""
echo "Installing development binaries..."
brew install ${brew_sys[@]}

#// Install development binaries
brew_dev=(
  automake
  awscli
  binutils
  boost
  cmake
  cscope
  eigen
  elasticsearch
  emacs
  ffmpeg
  gcc
  git
  gist
  git-crypt
  heroku-toolbelt
  jenkins
  lua
  macvim
  markdown
  msgpack # For neovim
  mysql
  nginx
  node
  nvm
  phantomjs
  postgresql
  pow
  purescript
  pyenv
  python
  python3
  qt
  rbenv
  rbenv-gem-rehash
  redis
  rhino
  scons # For neovim
  swig
  texi2html
  the_silver_searcher
  vcsh
)

echo ""
echo "Installing development binaries..."
brew install ${brew_dev[@]}

#// Install security binaries
brew_sec=(
  aircrack-ng
  bcrypt
  cifer
  dns2tcp
  ettercap
  fcrackzip
  hashpump
  hping
  hydra
  john
  knock
  netcat
  nettle
  nmap
  openssl
  skipfish
  socat
  sqlmap
  tcpdump
  tcpflow
  tcpreplay
  tcptrace
  ucspi-tcp # `tcpserver` etc.
  wireshark
)

echo ""
echo "Installing security binaries..."
brew install ${brew_sec[@]}

#// Install other useful binaries
brew_misc=(
  archey
  binwalk
  cmatrix
  cowsay
  exiv2
  ffmpeg
  geoip
  graphicsmagick
  graphviz
  imagemagick --with-webp
  irssi
  jpeg
  lynx
  mackup
  p7zip
  reattach-to-user-namespace
  speedtest-cli
  tmux
  transmission
  trash
  unrar
  xdot
  youtube-dl
  zopfli
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
  0xed
  alfred
  atom
  bartender
  charles
  codekit
  firefox
  firefoxdeveloperedition
  flame
  google-chrome
  google-chrome-canary
  iterm2
  kismac
  mactex
  macvim
  navicat-for-postgresql
  spectacle
  stay
  transmission
  transmit
  vagrant
  virtualbox
  viscosity
  vivaldi
  xscope
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
  font-fontawesome
  font-hack
  font-inconsolata
  font-inconsolata-for-powerline
  font-input
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
