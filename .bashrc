#//  ██                        ██
#// ░██                       ░██
#// ░██       ██████    ██████░██
#// ░██████  ░░░░░░██  ██░░░░ ░██████
#// ░██░░░██  ███████ ░░█████ ░██░░░██
#// ░██  ░██ ██░░░░██  ░░░░░██░██  ░██
#// ░██████ ░░████████ ██████ ░██  ░██
#// ░░░░░    ░░░░░░░░ ░░░░░░  ░░   ░░

#//-------------------------------------------------
#// global definitions
#//-------------------------------------------------
#// if not running interactively, don't do anything
[ -z "$PS1" ] && return

#// don't put duplicate lines in the history. See bash(1) for more options
#// or force ignoredups and ignorespace
export HISTCONTROL=ignoredups:ignorespace

#// append to the history file, don't overwrite it
shopt -s histappend

#// save multi-line commands as one command
shopt -s cmdhist

#// record each line as it gets issued
PROMPT_COMMAND='history -a'

#// huge history. doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

#// avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

#// don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history"

#// useful timestamp format
HISTTIMEFORMAT='%F %T '

#// check the window size after each command and, if necessary,
#// update the valyes of LINES and COLUMNS
shopt -s checkwinsize

#// correct spelling errors during tab-completion
shopt -s dirspell

#// correct spelling errors in arguments supplied to cd
shopt -s cdspell

#// make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


#//-------------------------------------------------
#// greetings, motd, et al..
#//-------------------------------------------------
#// define colors
BLACK='\e[0;30m\]'
gray='\e[0;37m\]'
GRAY='\e[1;30m\]'
red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
magenta='\[\e[0;35m\]'
MAGENTA='\[\e[1;35m\]'
cyan='\[\e[0;36m\]'
CYAN='\[\e[1;36m\]'
NC='\[\e[0m\]' #// no color

#// variables you might want
T12h="\T"
T12a="\@"
PathS="\w"
PathF="\W"
NewL="\n"
Jobs="\j"

#// bash motd
clear
echo -e "\033[1;36mThis is BASH \033[1;31m$BASH_VERSION\033[m \n"
echo -en ;date
echo -en ;uptime
echo -e " "

#// run upon exit of shell
function _exit() {
  echo -e "\n\n\033[0;32m[ exiting shell ]\033[m\n"
}
trap _exit EXIT

#// dir colors
export CLICOLOR=1
export LSCOLORS='ExGxFxDxCxDxDxhbhdacEc'
#// export LSCOLORS='gxfxcxdxbxegedabagacad'

#//-------------------------------------------------
#// shell prompt
#//-------------------------------------------------
source $HOME/Scripts/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true

twolevelprompt='$([ "$PWD" != "${PWD%/*/*/*}" ] && echo "/...${PWD##${PWD%/*/*}}" || echo "$PWD")'
gitprompt='$(__git_ps1 "[%s]")'
#arrow=$'\xe2\x86\x92'

#// if command returns zero, user is root
if [ $(id -u) -eq 0 ]; then
    #// you are root, red prompt
    PS1="${RED}\u@\h ${NC}[$twolevelprompt] #// "
  else
    #// standard
    PS1="${GREEN}\u@\h ${NC}[${BLUE}$twolevelprompt${NC}]${CYAN}$gitprompt${NC} $ "
fi

#// This one isn't required for bash prompt and is a small bonus
#// which gives you git-specific auto-completion. Sometimes this can slow
#// things down. Feel free to disable it if you are experiencing latency.
source $HOME/Scripts/git-completion.sh


#//-------------------------------------------------
#// settings
#//-------------------------------------------------
set -o notify
set -o noclobber
set -o ignoreeof
#set -o nounset
#set -o xtrace #// for debugging

#// enable:
#// shopt -s cdspell

#// disable:
#// shopt -u mailwarn
unset MAILCHECK #// shell warning of new mail

export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HITSTIMEFORMAT="%H:%M"
export HISTIGNORE="&bg:fg:11:h"
export HOSTFILE=$HOME/.hosts #// list of remote hosts

export ARCHFLAGS="-arch x86_64"
export CC=/usr/bin/gcc #// correct this for osx, do not use homebrew version


#//-------------------------------------------------
#// aliases and functions
#//-------------------------------------------------
#// general system aliases
alias cls='clear'
alias h='history'
alias ls='ls -h'
alias la='ls -A'
alias ll='ls -alF'
alias l='ls -CF'
alias trash='mv --target-directory=$HOME/.Trash/' #// osx only
alias empty='rm -rf $HOME/.Trash/*' #// osx only
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias root='sudo su -l'
alias runlevel='sudo /sbin/init'
alias grep='grep --color=always'
alias egrep='egrep --color=always'
alias dfh='df -h'
alias nano='nano -wc'
alias irc='irssi'
alias bashrc='nano ~/.bashrc'
alias profile='nano ~/.profile'

#// enable programmable completion features (you don't need to enable
#// this, if it's already enabled in /etc/bash.bashrc and /etc/profile
#// sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

#// system info
#// TODO: fix this for osx
alias cpuu="ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu | sed '/^ 0.0 /d'"
alias memu='ps -e -o rss=,args= | sort -b -k1,1n | pr -TW$COLUMNS'
alias pg='ps aux | grep' #// requires an argument

#// list terminal colors
colors () {
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}

#// extract - extraction of all file types
extract () {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       rar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#ziprm - extract and delete zipfile
ziprm () {
  if [ -f $1 ] ; then
    unzip $1
    rm $1
  else
    echo "Need a valid zipfile"
  fi
}

#psgrep - advanced grep feature
psgrep() {
  if [! -z $1 ]; then
    echo "Grepping for processes matching $1..."
    ps aux | grep $1 | grep -v grep
  else
    echo "Need name to grep for"
  fi
}

#// grab - take ownership of file
grab() {
  sudo chown -R ${USER} ${1:-.}
}

#// network
#// TODO: fix these
alias me='ipconfig getifaddr en0' #// osx only
alias ping='ping -c 10'
alias whois='whois -H'
alias netaudit='sudo nmap -sT -O localhost'
alias net1='watch --interval=2 "sudo netstat -apn -l -A inet"'
alias net2='watch --interval=2 "sudo netstat -anp --inet --inet6"'
alias net3='sudo lsof -i'
alias net4='watch --interval=2 "sudo netstat -p -e --inet --numeric-hosts"'
alias net5='watch --interval=2 "sudo netstat -tulpan"'
alias net6='sudo netstat -tulpan'
alias net7='watch --interval=2 "sudo netstat -utapen"'
alias net8='watch --interval=2 "sudo netstat -ano -l -A inet"'

#// netinfo - shows network information for your system
#// TODO: fix this for full osx functionality
#// add homebrew awk, sed, lynx
netinfo () {
  echo "--------------- Network Information ---------------"
  ifconfig | awk /'inet addr/ {print $2}'
  ifconfig | awk /'Bcast/ {print $3}'
  ifconfig | awk /'inet addr/ {print $4}'
  ifconfig | awk /'HWaddr/ {print $4,$5}'
  myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
  echo "${myip}"
  echo "---------------------------------------------------"
}

#// dirsize - finds directory sizes and lists them for the current directory
#// TODO: what the fuck is this supposed to do??
dirsize () {
  du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
  egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
  egrep '^ *[0-9.]*M' /tmp/list
  egrep '^ *[0-9.]*G' /tmp/list
  rm -rf /tmp/list
}

#// copy and go to dir
cpg () {
  if [ -d "$2" ]; then
    cp $1 $2 && cd $2
  else
    cp $1 $2
  fi
}

#// move and go to dir
mvg () {
  if [ -d "$2" ]; then
    mv $1 $2 && cd $2
  else
    mv $1 $2
  fi
}

#// directory navigation aliases
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

#// chmod and permissions commands
alias mx='chmod a+x'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'
alias perm='stat --printf "%a %n \n "' #// requires a file name e.g. perm file

#// aliases for OSX
alias cleanup='find . -type f -name '*.DS_Store' -ls -delete'
alias spot='mdfind -name '

#// aliases for Ruby/Rails/RubyGems
alias killgems='gem uninstall -aIx'

#// aliases for git
#// TODO: bash git aliases vs gitconfig features
alias undopush='git push -f origin HEAD^:master'

#// fun stuff
#alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'hey noob idiot bitch t(._.t)'"


#//-------------------------------------------------
#// PATH
#//-------------------------------------------------
echo $PATH | grep -q -s "/usr/local/bin"
if [ $? -eq 1 ]; then
  PATH=$PATH:/usr/local/bin
  export PATH
fi

#// PATH export
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/X11/bin

#// init rbenv
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#// init pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
