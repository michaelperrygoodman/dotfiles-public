#//-------------------------------------------------
#// aliases and functions
#//-------------------------------------------------

#// general
alias c='clear'
alias k='clear'
alias cls='clear'
alias qq='exit'

alias aliases='nvim ~/.config/fish/custom/aliases.fish'
alias vimrc='nvim ~/.config/nvim/init.vim'

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

#// chmod and permissions commands
alias mx='chmod a+x'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'

#// directory listing
alias l='ls -CF'
alias ll='ls -ahlF'
alias la='ls -A'
alias ls='ls -h'
alias lsd='ls -l | grep "^d"'

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
alias grep='grep --color=always'
alias egrep='egrep --color=always'

#// tmux
alias tx='tmux'
alias txa='tmux a -t'
alias txl='tmux ls'
alias txn='tmux new -s'

#// vim
alias v='nvim'
alias nv='nvim'

#// homebrew
alias bup='brew update ;and brew upgrade'
alias bupc='brew update ;and brew upgrade ;and brew cleanup'
alias bout='brew outdated'
alias bin='brew install'
alias brm='brew uninstall'
alias bcl='brew cleanup'
alias bls='brew list'
alias bsr='brew search'
alias binf='brew info'
alias bdr='brew doctor'
alias bed='brew edit'

#// homebrew cask
alias bcup='brew cask upgrade'
alias bcin='brew cask install'
alias bcrm='brew cask uninstall'
alias bczp='brew cask zap'
alias bccl='brew cask cleanup'
alias bcsr='brew cask search'
alias bcls='brew cask list'
alias bcinf='brew cask info'
alias bcdr='brew cask doctor'
alias bced='brew cask edit'

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
alias ipy='ipython'

#// ruby/rails/gems
alias killgems='gem uninstall -aIx'

alias r='rails'
alias rg='rails g'
alias rs='rails s'
alias rc='rails c'
alias rn='rails new'
alias rb='rails dbconsole'
alias rp='rails plugin'
alias ra='rails application'
alias rd='rails destroy'
alias dbm='rake db:migrate'

alias ss='script/server'
alias ts='thin start'     # thin server
alias sc='script/console'
alias restartapp='touch tmp/restart.txt'
alias restart='touch tmp/restart.txt'  # restart passenger
alias devlog='tail -f log/development.log'
alias taild='tail -f log/development.log' # tail dev log

#// bundler
alias be='bundle exec'
alias bi='bundle install'
alias bl='bundle list'
alias bu='bundle update'
alias bp='bundle package'

#// vs code
function code
  set location "$PWD/$argv"
  open -n -b "com.microsoft.VSCode" --args $location
end

#// local servers
#// nginx
alias nginx.start='sudo nginx'
alias nginx.stop='sudo nginx -s stop'
alias nginx.restart='nginx.stop; and nginx.start'
alias nginx.conf='nvim /usr/local/etc/nginx/nginx.conf'

#// php-fpm
alias php-fpm.start='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php70.plist'
alias php-fpm.stop='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php70.plist'
alias php-fpm.restart='php-fpm.stop; and php-fpm.start'

#// mysql
alias mysql.start='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
alias mysql.stop='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
alias mysql.restart='mysql.stop; and mysql.start'

#// nginx logs
alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log'
alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
alias nginx.logs.default.access='tail -250f /usr/local/etc/nginx/logs/default.access.log'
alias nginx.logs.default-ssl.access='tail -250f /usr/local/etc/nginx/logs/default-ssl.access.log'
alias nginx.logs.phpmyadmin.access='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.access.log'⏎

#// irc
alias irc='irssi'

#// vps
source $custom_home/custom/vps.fish

#// .plan
alias plan='nvim ~/.plan'
