#!/bin/bash

#// MacOS Setup Script
#// ==================

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

#// Install command-line tools using Homebrew.
echo ""
echo "Installing Xcode..."
xcode-select install
sudo xcodebuild -license

#// Install homebrew (Xcode CLI tools required)
if test ! $(which brew); then
  echo ""
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

#// Fix bug in macOS terminal backspace implementation
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti

echo ""

#// Set your network hostname
echo ""
echo "Would you like to set your computer name"
echo "(as done via System Preferences > Sharing)?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "What would you like it to be?"
  read COMPUTER_NAME
  sudo scutil --set ComputerName $COMPUTER_NAME
  sudo scutil --set HostName $COMPUTER_NAME
  sudo scutil --set LocalHostName $COMPUTER_NAME
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME
  dscacheutil -flushcache
fi

#// Removing duplicates in the 'Open With' menu
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

#// Show the ~/Library folder in Finder
chflags nohidden ~/Library

#// Hide the /opt folder in Finder
chflags hidden /opt

#// Use Plain Text Mode as Default in Text Edit
defaults write com.apple.TextEdit RichText -int 0

#// Finder settings
echo ""
echo "Show icons for hard drives, servers, and removable media on the desktop? (y/n)"
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
fi

echo ""
echo "Show hidden files in Finder by default? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  defaults write com.apple.Finder AppleShowAllFiles -bool true
fi

echo ""
echo "Show all filename extensions in Finder by default? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
fi

echo ""
echo "Show status bar in Finder by default? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  defaults write com.apple.finder ShowStatusBar -bool true
fi

echo ""
echo "Display full POSIX path as Finder window title? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
fi

echo ""
echo "Avoid creation of .DS_Store files on network volumes? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
fi

echo ""
echo "Disable disk image verification? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  defaults write com.apple.frameworks.diskimages skip-verify -bool true
  defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
  defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
fi

#// Allowing text selection in Quick Look/Preview in Finder by default
defaults write com.apple.finder QLEnableTextSelection -bool true

echo ""
echo "Show item info near icons on the desktop and in other icon views? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
fi

echo ""
echo "Show item info to the right of the icons on the desktop? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  /usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist
fi

echo ""
echo "Enable snap-to-grid for icons on the desktop and in other icon views? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
fi

#// Increase grid spacing for icons on the desktop and in other icon views? (y/n)
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

echo ""
cecho "########################################################################" $white

#// Dock & Mission Control
echo ""
echo "Wipe all (default) app icons from the Dock? (y/n)"
echo "(This is only really useful when setting up a new Mac, or if you don't use the Dock to launch apps.)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  defaults write com.apple.dock persistent-apps -array
fi

#// Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate
defaults write com.apple.dock tilesize -int 36

#// Speeding up Mission Control animations and grouping windows by application
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

echo ""
echo "Set Dock to auto-hide and remove the auto-hiding delay? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock autohide-delay -float 0
  defaults write com.apple.dock autohide-time-modifier -float 0.425
fi

echo ""
cecho "########################################################################" $white

#// Terminal
echo ""
echo "Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default..."
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

echo ""
cecho "########################################################################" $white

#// Transmission.app
echo ""
echo "Do you use Transmission for torrenting? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Setting up new Transmission defaults..."
  #// Setting up an incomplete downloads folder in Downloads
  mkdir -p ~/Downloads/Incomplete
  defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
  defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Incomplete"

  #// Setting auto-add folder to be Downloads
  defaults write org.m0k.transmission AutoImportDirectory -string "${HOME}/Downloads"

  #// Don't prompt for confirmation before downloading
  defaults write org.m0k.transmission DownloadAsk -bool false

  #// Trash original torrent files after adding them
  defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

  #// Hiding the donate message
  defaults write org.m0k.transmission WarningDonate -bool false

  #// Hiding the legal disclaimer
  defaults write org.m0k.transmission WarningLegal -bool false

  #// Setting up the block list
  defaults write org.m0k.transmission EncryptionRequire -bool true
  defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
  defaults write org.m0k.transmission BlocklistNew -bool true
  defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
fi

echo "Enable verbose boot..."
#// Always verbose boot sequence
sudo nvram boot-args="-v"

#// Finish the script
echo ""
cecho "Done!" $cyan
echo ""
cecho "Note that some of these changes require a logout/restart to take effect." $red
cecho "Killing some open applications in order to take effect." $red
echo ""

find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
  "Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
  "Terminal" "Transmission"; do
  killall "${app}" > /dev/null 2>&1
done
