#//-------------------------------------------------
#// network utilities
#//-------------------------------------------------

#// TODO: this whole file needs work

#// general
alias ping='ping -c 10'
alias whois='whois -h whois-servers.net'

alias me='ipconfig getifaddr en0'
alias myip='curl -s checkip.dyndns.org | grep -Eo "[0-9\.]+"'
alias ips='ifconfig -a | perl -nle"/(\d+\.\d+\.\d+\.\d+)/ and print $1"'

alias net1='watch --interval=2 "sudo netstat -anlA en0"'
alias net2='watch --interval=2 "sudo netstat -an"'
alias net3='sudo lsof -i'

#// nmap
alias netaudit='sudo nmap -sT -O localhost'

#// view HTTP traffic
alias httpdump='sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\"'
alias sniff='sudo ngrep -d "en1" -t "^(GET|POST) " "tcp and port 80"'

#// TODO: add wireshark aliases
#// TODO: add netcat aliases


#//-------------------------------------------------
#// OSX utilities
#//-------------------------------------------------

#// desktop apps
alias f='open -a Finder '
alias fh='open -a Finder .'
alias hex='open -a "Hex Fiend"'
alias preview="open -a '$PREVIEW'"
alias photoshop="open -a '/Applications/Adobe Photoshop CS3/Adobe Photoshop.app'"
alias xcode="open -a '/Applications/XCode.app'"
alias safari="open -a safari"
alias firefox="open -a firefox"
alias chrome="open -a google\ chrome"
alias skype='open -a Skype'

#// clipboard
function clip --description 'Copy to clipboard'
  pbcopy $argv
end

#// trash
alias trash='mv --target-directory=$HOME/.Trash/'
alias empty='rm -rfv $HOME/.Trash/*'

#// recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

#// flush directory service cache
alias flush='dscacheutil -flushcache'

#// show/hide hidden files in Finder
alias show='defaults write com.apple.Finder AppleShowAllFiles -bool true and killall Finder'
alias hide='defaults write com.apple.Finder AppleShowAllFiles -bool false and killall Finder'

#// hide/show all desktop icons (useful when presenting)
alias showdesktop='defaults write com.apple.finder CreateDesktop -bool true and killall Finder'
alias hidedesktop='defaults write com.apple.finder CreateDesktop -bool false and killall Finder'

#// CLI spotlight search
alias spot='mdfind -name '

#// enable/disable spotlight
alias spoton='sudo mdutil -a -i on'
alias spotoff='sudo mdutil -a -i off'

#// load/unload kext
alias kload='sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/'
alias kunload='sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/'

#// use Finder's quick look on a file (^C or space to close)
alias ql='qlmanage -p 2>/dev/null'

#// mute/unmute system volume
alias mute="osascript -e 'set volume output muted true'"
alias unmute="osascript -e 'set volume output muted false'"

#// talk to me
alias helloworld="say 'Hello World.'"


#//-------------------------------------------------
#// system utilities
#//-------------------------------------------------

alias dfh='df -h'

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

function randpw --description 'generate a random password'
  dd if=/dev/urandom bs=1 count=16 2>/dev/null | base64 | rev | cut -b 2- | rev
end

function pkill --description 'pkill a process interactively'
  ps aux | peco | awk '{ print $2 }' | xargs kill
end

function ppkill --description 'kill -9 a process interactively'
  ps aux | peco | awk '{ print $2 }' | xargs kill -KILL
end

function pgrep --description 'pgrep a process interactively'
  ps aux | peco | awk '{ print $2 }'
end
