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
  echo -e "${2}${1}${reset}"
  return
}

echo ""
cecho "Running Ruby/Rails configuration..." $red
echo ""

#// Ask for the administrator password upfront.
sudo -v
cecho "*** Root access granted ***" $red

#// Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#// nginx
#// Configure nginx as pow proxy
mkdir -p /usr/local/etc/nginx/sites-available
mkdir -p /usr/local/etc/nginx/sites-enabled
curl -L https://gist.githubusercontent.com/michaelperrygoodman/582c9a49e2bb753e3335/raw/185b3ddf89fa4766b1fa9efa87e5f627866f1896/pow.dev > /usr/local/etc/nginx/sites-available/pow.dev
ln -s /usr/local/etc/nginx/sites-available/pow.dev /usr/local/etc/nginx/sites-enabled/pow.dev

#// Run nginx as root on startup (for port 80 access)
sudo cp /usr/local/opt/nginx/homebrew.mxcl.nginx.plist /Library/LaunchDaemons/

#// Ruby
mkdir -p ~/.rbenv/plugins

ruby_version=2.1.3

rbenv install ${ruby_version}
rbenv global ${ruby_version}

gems=(
  bundler -v 1.10.5
  mailcatcher -- --with-cppflags=-I/usr/local/opt/openssl/include #// for el capitan
  pry
  pry-remote
  powder
  rails
  wirble
)

gem install ${gems[@]}

#// Postgres
#brew info postgresql for details

#// Heroku
heroku plugins:install git://github.com/ddollar/heroku-accounts.git
heroku plugins:install git://github.com/tpope/heroku-remote.git
heroku plugins:install git://github.com/tpope/heroku-binstubs.git
heroku plugins:install git://github.com/tpope/heroku-wildcards.git

#// Powder
#curl get.pow.cx | sh
powder install
powder up
