#//-------------------------------------------------
#// settings
#//-------------------------------------------------

#// gcc
set -x ARCHFLAGS '-arch x86_64'
set -x CC '/usr/bin/gcc' #// correct this for osx, do not use homebrew version

#// language default
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

#// editor
set -x EDITOR 'vim'

#// workspace
set -x WORKSPACE_HOME $HOME/Workspace

#// LSCOLORS
set -x LSCOLORS 'ExGxFxDxCxDxDxhbhdacEc'

#// allow 256 colors
set -x CLICOLOR 1

#// grep colors
set -e GREP_OPTIONS
#set -x GREP_OPTIONS '--color=auto'

#// LESS with colors
#// from http://blog.0x1fff.com/2009/11/linux-tip-color-enabled-pager-less.html
set -x LESS '-RSM~gIsw'

#// colorful man pages
#// from http://pastie.org/pastes/206041/text
set -x LESS_TERMCAP_mb (set_color -o red)
set -x LESS_TERMCAP_md (set_color -o red)
set -x LESS_TERMCAP_me (set_color normal)
set -x LESS_TERMCAP_se (set_color normal)
set -x LESS_TERMCAP_so (set_color -b blue -o yellow)
set -x LESS_TERMCAP_ue (set_color normal)
set -x LESS_TERMCAP_us (set_color -o green)

#// to make ruby faster
#// http://tmm1.net/ruby21-rgengc/?utm_source=rubyweekly&utm_medium=email
set -x  RUBY_GC_HEAP_INIT_SLOTS 600000
set -x  RUBY_GC_HEAP_FREE_SLOTS 600000
set -x  RUBY_GC_HEAP_GROWTH_FACTOR 1.25
set -x  RUBY_GC_HEAP_GROWTH_MAX_SLOTS 300000

#// python variables
set -x PIP_REQUIRE_VIRTUALENV true
set -x PIP_USE_WHEEL true
set -x PIP_CACHE_DIR $HOME/.cache/pip
set -x PIP_WHEEL_DIR $PIP_CACHE_DIR/wheels
set -x PIP_FIND_LINKS $PIP_WHEEL_DIR
set -x PIP_TIMEOUT 15
set -x PIP_ALLOW_ALL_EXTERNAL false
set -x PIP_NO_ALLOW_INSECURE false

#// php variables
set -x PHP_AUTOCONF (which autoconf)

#// neovim variables
set -x XDG_CONFIG_HOME $HOME/.config

#// wine variables
#set -x WINEPREFIX $HOME/.wine32


#//-------------------------------------------------
#// PATH
#//-------------------------------------------------

#// prepend to path helper
function prepend_to_path -d 'Prepend the given directory, if it exists, to PATH'
  if test -d $argv[1]
    set PATH $argv[1] $PATH
  end
end

#// add homebrew to the beginning of PATH
set -x PATH '/usr/local/bin' $PATH
set -x PATH '/usr/local/sbin' $PATH

#// ruby
#// setup rbenv (from https://gist.github.com/2937920)
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $HOME/.rbenv/versions $PATH
rbenv rehash >/dev/null ^&1

#// nodejs
set -x NODE_PATH /usr/local/lib/node_modules $NODE_PATH
#//set -x PATH './node_modules/.bin' $PATH

#// npm
set -x PATH $HOME/.npm-global/bin $PATH

#// yarn
set -x PATH $HOME/.yarn/bin $PATH

#// respect local bins
set -x PATH './bin' $PATH
