"//-------------------------------------------------
"// vimrc
"//-------------------------------------------------

"// plugin config
"//-------------------------------------------------
call plug#begin('~/.config/nvim/bundle')
  Plug 'w0rp/ale'                         " ALE, better than Syntastic
  Plug 'skywind3000/asyncrun.vim'         " run shell commands in background
  Plug 'miyakogi/conoline.vim'            " highlights the line of the cursor
  Plug 'editorconfig/editorconfig-vim'    " maintain consistent coding styles between different editors
  Plug 'mattn/emmet-vim'                  " fast code completion
  Plug 'sjl/gundo.vim'                    " visualize your undo tree
  Plug 'scrooloose/nerdcommenter'         " advanced commenting
  Plug 'scrooloose/nerdtree'              " file system explorer
  Plug 'mhartington/nvim-typescript'      " typescript syntax support
  Plug 'kien/rainbow_parentheses.vim'     " different levels of parentheses in different colors
  Plug 'rust-lang/rust.vim'               " rust language support
  "Plug 'rstacruz/sparkup'                " faster html completion
  "Plug 'vim-syntastic/syntastic'         " syntax checking hacks
  Plug 'vim-airline/vim-airline'          " advanced status & tab line
  Plug 'vim-airline/vim-airline-themes'   " themes for airline
  Plug 'pangloss/vim-javascript'          " javascript syntax support
  Plug 'elzr/vim-json'                    " json syntax support
  Plug 'mxw/vim-jsx'                      " react jsx syntax support
  Plug 'elixir-editors/vim-elixir'        " elixir language support
  Plug 'terryma/vim-multiple-cursors'     " sublime text style multiple cursors
  Plug 'moll/vim-node'                    " node support
  Plug 'sheerun/vim-polyglot'             " language support pack
  Plug 'vim-ruby/vim-ruby'                " ruby language support
  Plug 'tpope/vim-sensible'               " sensible defaults
  Plug 'tpope/vim-surround'               " quoting/parenthesizing made simple
  Plug 'othree/yajs.vim'                  " yet another javascript plugin
call plug#end()


"// general
"//-------------------------------------------------
set history=1000                   " store :cmdline history
set autoread                       " reload files changed outside vim
set autowrite                      " continually write directly to file on disk
set hidden                         " keeps buffers hidden
set lazyredraw                     " don't redraw while using macros, registers, etc.
set magic                          " for regular expressions turn magic on

" turn backup off, most of this is under version control
set nobackup
set nowb
set noswapfile
set noundofile

" restrict some commands in non-default .vimrc
set secure

" modelines security measure
set modelines=0

" auto reload .vimrc on save
autocmd BufWritePost .vimrc source %

" save on losing focus
autocmd FocusLost * :wa


"// font & color
"//------------------------------------------------
if !has('nvim')
  set encoding=utf8                " character encoding
endif

set t_Co=256                       " use 256 colors in terminal
set background=dark                " dark background
syntax enable                      " turn on syntax highlighting

" set color scheme
"colorscheme visual-studio-dark
colorscheme hybrid

" use Unix as the standard file type
set ffs=unix,dos,mac


"// user interface
"//------------------------------------------------
set number                         " display line numbers
set foldcolumn=0                   " remove left margin padding
set cmdheight=2                    " height of the command bar
set ruler                          " show line + column number of cursor
set showcmd                        " show incomplete cmds down the bottom
set noshowmode                     " show current mode down the bottom [OR: noshowmode]
set visualbell                     " no sounds
set laststatus=2                   " always show the status line
set showmatch                      " show matching brackets when text indicator is over them
set matchtime=3                    " duration of parens highlight in 1/10 seconds
set splitbelow                     " spltting a window will put the new window below the current one
set splitright                     " same as above but for horizontal splits
set clipboard+=unnamed,unnamedplus " use system clipboard
set cursorline                     " highlight current line
set hidden                         " hide buffer when abandoned
set gdefault                       " apply substitution globally on lines
set modifiable                     " set buffers to modifiable

" indentation
set autoindent                     " auto indentation
set smartindent                    " be smart when indenting
set smarttab                       " be smart when using tabs
set tabstop=2                      " 1 tab = 2 spaces
set expandtab                      " use spaces instead of tabs
set nowrap                         " don't wrap lines
set softtabstop=2
set shiftwidth=2

" folding
set nofoldenable                   " dont fold by default
set foldmethod=marker              " fold based on indent
set printoptions=paper:letter
set sidescrolloff=5
set mouse=nvi

" scrolling
set scrolloff=3                    " minimum number of screen lines to keep above and below the cursor
set sidescroll=1                   " minimum number of columns to scroll horizontaly
set sidescrolloff=10               " minimum number of screen lines to keep left and right of the cursor

" wildmenu completion
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

" search & results settings
set incsearch                      " find the next match as we type the search
set hlsearch                       " highlight searches by default
set ignorecase                     " ignore case when searching...
set smartcase                      " ...unless we type a capital

" use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column --ignore-dir "bower_components" --ignore-dir ".tmp" --ignore-dir "dist"'
  let g:unite_source_grep_recursive_opt = ''
endif

" display tabs and trailing spaces visually
" TODO: fix these characters
"set list listchars=tab:▸\,trail:·,extends:»,precedes:«,nbsp:·,eol:¬

" linebreak on 500 characters
set linebreak
set textwidth=500

" return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" remember info about open buffers on close
set viminfo^=%

" TODO: spell checking option settings
set dictionary=/usr/share/dict/words


"// command input
"//------------------------------------------------
set backspace=indent,eol,start     " allow backspace in insert mode
set whichwrap+=<,>,h,l             " allow arrow key to wrap around lines

" set map leader here
let mapleader=' '
let g:mapleader=' '
set updatetime=2000

" fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the premission-denied error)
command! W :w !sudo tee % > /dev/null

" fuck everything
nmap <leader>qq :q!<cr>

" visual mode: pressing * or # searches for the current selection
" super useful! from an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<cr>
vnoremap <silent> # :call VisualSelection('b', '')<cr>

" map save to ctrl + s, macvim only
noremap  <silent> <C-S> :update<cr>
vnoremap <silent> <C-S> <C-C>:update<cr>
inoremap <silent> <C-S> <C-O>:update<cr>

" map replace mode
nmap r R

" inserting blank lines
nnoremap <cr> o<esc>

" more useful line deleting
map - dd

" remap VIM 0 to first non-blank character
map 0 ^

" toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" kill trailing whitespace
"nnoremap <leader>w :FixWhitespace<cr>

" treat long lines as break lines (useful when moving around in them)
" for when wrapping is enabled
map j gj
map k gk

" moving lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv"

" smart way to move between windows
" TODO: fix this fucking shit
nmap <silent> <C-Up> :wincmd k<cr>
nmap <silent> <C-Down> :wincmd j<cr>
nmap <silent> <C-Left> :wincmd h<cr>
nmap <silent> <C-Right> :wincmd l<cr>

" disable highlight when <leader><cr> is pressed
nnoremap <silent> <leader><space> :noh<cr>

" disable help <F1> key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" buffer controls
" map: <space>b
" open a new empty buffer
nmap <leader>bn :enew<cr>

" move to the next buffer
nmap <leader>bl :bnext<cr>

" move to the previous buffer
nmap <leader>bh :bprevious<cr>

" close the current buffer and move to the previous one
" this replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<cr>

" show all open buffers and their status
nmap <leader>bs :ls<cr>

" switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" don't close window when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" tab controls
" map: <space>t
" useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" new tab with ctrl+t
" map save to ctrl + s
noremap  <silent> <C-T> :tabnew<cr>

" let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

" opens a new tab with the current buffer's path
" super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>

" TODO: spell checking maps

" move text around
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


"// plugin configuration
"//------------------------------------------------
" airline
let g:airline_theme='luna'
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#fnamemod='%t'
let g:airline_section_c='%t'

" the separator used on the left side *
let g:airline_left_sep='*'

" the separator used on the right side *
let g:airline_right_sep='*'

if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" emmet
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  }
  \}
"autocmd FileType html,css

" NERDTree
let g:NERDTreeWinPos='left'
"let NERDTreeIgnore=['']
let g:NERDTreeWinSize=24
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>


