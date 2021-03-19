#//-------------------------------------------------
#// aliases and functions
#//-------------------------------------------------

#// general
alias c='clear'
alias k='clear'
alias cls='clear'
alias qq='exit'

alias aliases='nv ~/.config/fish/custom/aliases.fish'
alias vimrc='nv ~/.vimrc'

#// shell history
alias h='history'

#// super user
alias _='sudo '
alias root='sudo su -'
alias runlevel='sudo /sbin/init'

#// directory navigation
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

function cd --description 'Auto ls for each cd'
  if [ -n $argv[1] ]
    builtin cd $argv[1]
    and ls -ahlF
  else
    builtin cd ~
    and ls -ahlF
  end
end

alias md='mkdir -p'

function mdc --description 'Auto cd and ls into'
  if [ -n $argv[1] ]
    mkdir -p $argv[1]
    and cd $argv[1]
  end
end


#// chmod and permissions commands
alias mx='chmod a+x'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'

#// directory listing
alias l='ls -CF1v --color=auto'
alias ll='ls -ahl1vFi --color=auto'
alias la='ls -A1v --color=auto'
alias lsd='ls -l1v --color=auto | grep "^d"'

#// tree
#// from http://news.ycombinator.com/item?id=4492682
function tree1; tree --dirsfirst -ChFLQ 1 $argv; end
function tree2; tree --dirsfirst -ChFLQ 2 $argv; end
function tree3; tree --dirsfirst -ChFLQ 3 $argv; end
function tree4; tree --dirsfirst -ChFLQ 4 $argv; end
function tree5; tree --dirsfirst -ChFLQ 5 $argv; end
function tree6; tree --dirsfirst -ChFLQ 6 $argv; end

#// copy/move/delete
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias rmd='rm -rf'

#// grep
#alias grep='grep --color=always'
#alias egrep='egrep --color=always'

#// misc
alias cat='bat'

#// tmux
alias tx='tmux'
alias txa='tmux a -t'
alias txl='tmux ls'
alias txn='tmux new -s'

#// vim
alias v='nvim'
alias nv='nvim'

#// thefuck - https://github.com/nvbn/thefuck
#eval (thefuck --alias | tr '\n' ';')
#alias ugh='fuck'

#// pacman
alias pup='pacman -Syyu'
alias pin='pacman -S'
alias prm='pacman -R'
alias pcl='pacman -Sc'
alias pls='pacman -Qe'

#// AUR via yay
alias yup='yay -U'
alias yin='yay -S'
alias yrm='yay -R'

#// git
alias g='git'
alias gs='git status'
alias gst='git status -sb --ignore-submodules'
alias ga='git add'
alias gca='git commit -a -m'
alias gcm='git commit -m'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -D'
alias gcob='git checkout -b'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git merge --no-ff'
alias gpt='git push --tags'
alias gp='git push'
alias undopush='git push -f origin HEAD^:master'
alias gpom='git pull origin master'
alias grs='git reset --soft'
alias grh='git reset --hard'
alias gcp='git cherry-pick'
alias gl='git lg'

#// npm
alias ni='npm install'
alias nis='npm install --save'
alias nid='npm install --save-dev'
alias nit='npm install-test'
alias nits='npm install-test --save'
alias nitd='npm install-test --save-dev'
alias nu='npm uninstall'
alias nus='npm uninstall --save'
alias nud='npm uninstall --save-dev'
alias np='npm publish'
alias nup='npm unpublish'
alias nlk='npm link'
alias nod='npm outdated'
alias nrb='npm rebuild'
alias nud='npm update'
alias nr='npm run'
alias nls='npm list'
alias nlsg='npm list --global'

#// languages
alias rb='ruby'
alias py='python'

#// local servers
#// nginx
alias nginx.enable='sudo systemctl enable nginx.service'
alias nginx.start='sudo systemctl start nginx.service'
alias nginx.stop='sudo systemctl stop nginx.service'
alias nginx.restart='nginx.stop; and nginx.start'
alias nginx.conf='sudo nvim /etc/nginx/nginx.conf'

#// mysql
#alias mysql.start='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
#alias mysql.stop='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
#alias mysql.restart='mysql.stop; and mysql.start'

#// nginx logs
alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log'
alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
alias nginx.logs.default.access='tail -250f /usr/local/etc/nginx/logs/default.access.log'
alias nginx.logs.default-ssl.access='tail -250f /usr/local/etc/nginx/logs/default-ssl.access.log'
alias nginx.logs.phpmyadmin.access='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.access.log'⏎

#// mutt
alias email='mutt'

#// irc
alias irc='irssi'

#// .plan
alias plan='nvim ~/.plan'

#// hangouts
alias gchat='hangups'

#// reddit
alias reddit='rtv'

#// vps
source $custom_home/custom/vps.fish

#// fun stuff
#alias stfu='osascript -e "set volume output muted true"'
#alias hax='growlnotify -a "Activity Monitor" "System error" -m "hey noob idiot bitch t(._.t)"'

#// games
alias quake='quakespasm'
alias doom='gzdoom'
