# get root access at start
sudo echo "> this script now has root"

# did u install fucking xcode????
xcode-select --install
sudo xcodebuild -license

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew tap homebrew/versions
brew install caskroom/cask/brew-cask
brew tap caskroom/fonts
brew tap caskroom/versions
brew tap neovim/neovim

# pre-requisites
brew install homebrew/dupes/grep
brew install Caskroom/cask/xquartz
brew install Caskroom/cask/java

binaries=(
  ack
  autoconf
  automake
  awscli
  bash
  boost
  brew-cask
  cairo
  cmake
  coreutils
  cscope
  curl
  drip
  eigen
  emacs
  faac
  ffmpeg
  findutils
  flac
  fltk
  fontconfig
  freetype
  fzf
  gdbm
  gettext
  git
  git-crypt
  glib
  gmp
  gnutls
  graphicsmagick
  grep
  heroku-toolbelt
  hub
  imagemagick
  jpeg
  lame
  leiningen
  libevent
  libffi
  liblo
  libogg
  libpng
  libsndfile
  libtasn1
  libtool
  libvorbis
  mackup
  macvim
  mr
  msgpack
  mysql
  nettle
  nginx
  node
  openssl
  ossp-uuid
  pcre
  pixman
  pkg-config
  portaudio
  portmidi
  postgresql
  qt
  rbenv
  rbenv-gem-rehash
  readline
  reattach-to-user-namespace
  redis
  rename
  ruby-build
  scons
  sqlite
  swig
  texi2html
  the_silver_searcher
  tmux
  trash
  tree
  vcsh
  webkit2png
  wget
  x264
  xvid
  xz
  yasm
  z
  zopfli
  zsh
)

echo "installing binaries..."
brew install ${binaries[@]}

# neovim only supports install from head
brew install neovim --HEAD
sudo easy_install pip
sudo pip install neovim

# fix bug in os x terminal backspace implementation
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti

brew cleanup

# Apps
apps=(
  airmail-beta
  github
  screenflick
  alfred
  google-chrome
  seil
  appcleaner
  google-chrome-canary
  sketch
  bartender
  google-hangouts
  skype
  beamer
  hazel
  slack
  cloudup
  instacast
  spectacle
  dash
  iterm2
  spotify
  dropbox
  java
  tinygrab
  firefox
  limechat
  transmission
  firefoxdeveloperedition
  macdown
  transmit
  flash
  macvim
  trim-enabler
  flux
  mailbox
  vagrant
  phantomjs
  virtualbox
  qlcolorcode
  vlc
  qlprettypatch
  xquartz
  qlstephen
  quicklook-json
  herok-toolbelt
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link

# fonts
brew tap caskroom/fonts

fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
  font-sauce-code-powerline
  font-fontawesome
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}




#==================================================================

chsh -s $(which zsh)

# shell dev env
#vcsh clone 'git@github.com:lynndylanhurley/dotfiles.git' 'dotfiles'
mkdir -p ~/.antigen
mkdir -p ~/.tmux/plugins
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > .antigen/antigen.zsh
#curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# nginx

# configure nginx as pow proxy
mkdir -p /usr/local/etc/nginx/sites-available
mkdir -p /usr/local/etc/nginx/sites-enabled
curl -L https://gist.github.com/lynndylanhurley/a08339aad03af9dc8591/raw/c1fa1399a1c8dbc7fb5cc417bb6777c9271e12d6/pow.dev > /usr/local/etc/nginx/sites-available/pow.dev
ln -s /usr/local/etc/nginx/sites-available/pow.dev /usr/local/etc/nginx/sites-enabled/pow.dev

# run nginx as root on startup (for port 80 access)
sudo cp /usr/local/opt/nginx/homebrew.mxcl.nginx.plist /Library/LaunchDaemons/

# ruby
mkdir -p ~/.rbenv/plugins

ruby_version=2.1.3

rbenv install ${ruby_version}
rbenv global ${ruby_version}

gems=(
  bundler
  tmuxinator
  wirble
  interactive_editor
  hub
  pry
  pry-remote
  mailcatcher
  powder
)

gem install ${gems[@]}


# heroku
heroku plugins:install git://github.com/ddollar/heroku-accounts.git
heroku plugins:install git://github.com/tpope/heroku-remote.git
heroku plugins:install git://github.com/tpope/heroku-binstubs.git
heroku plugins:install git://github.com/tpope/heroku-wildcards.git

mackup restore

# pow
powder install
powder up
