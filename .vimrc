""""""""""""""""""""""""""""""""""""""
" VIM Config file:
"
" Denis Zanin
" https://github.com/deniszanin/dotfiles
" 
""""""""""""""""""""""""""""""""""""""

" Load plugin
execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""
" :: General
""""""""""""""""""""""""""""""""""""""
" Fixes the problem where arrow keys do not function properly
set nocompatible

" Sets how many lines of history VIM has to remember
set history=50

" Enable filetype plugins
filetype plugin on
filetype indent on

" Sets to auto read when a file is changed from outside
set autoread

" Sets VIM to allow you to copy between files, remember your
" cursor position and other things
set viminfo='100,\"2500,:200,%,n~/.vim/.viminfo

""""""""""""""""""""""""""""""""""""""
" :: VIM user interface
""""""""""""""""""""""""""""""""""""""
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" A buffer becomes hidden when its abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Set auto indent
set autoindent

" Set cursor line
set cursorline

""""""""""""""""""""""""""""""""""""
" => Color settings
"""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Colorscheme generated at
"   http://sweyla.com/themes
"
"   installed ~/.vim/colors/*.vim
colorscheme ohgen006

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Display line numbers on the left
set number

" Hide sections of code
set foldmethod=manual

""""""""""""""""""""""""""""""""""""""
" :: Indentation options
""""""""""""""""""""""""""""""""""""""
" Indentation options
" Indentation settings according to personal preference.
" Indentation settings for using 4 spaces instead of tabls;
" Do not change 'tabstop' from its default value of 8 with this setup.

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
set tabstop=4

""""""""""""""""""""""""""""""""""""""
" :: Visual mode related
""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

""""""""""""""""""""""""""""""""""""""
" :: Customs remaps
""""""""""""""""""""""""""""""""""""""
nnoremap <C-f> :!iceweasel %<CR>
map <C-n> :NERDTreeToggle<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>

" Tagbar plugin
nmap <F9> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""
" :: Auto load syntax schemes
""""""""""""""""""""""""""""""""""""""
" Apache2 filetype
autocmd BufRead /etc/httpd/*.conf,httpd.conf setlocal filetype=apache foldmethod=marker foldcolumn=7 foldlevel=2

" SH filetype
autocmd BufRead *.sh,*.cron,*.bash setlocal filetype=sh

" Net-profiles filetype
autocmd BufRead /etc/network.d/* setlocal filetype=conf

" Python filetype
autocmd BufRead *.py setlocal filetype=python

" PHP filetype
autocmd BufRead *.php setlocal filetype=php

""""""""""""""""""""""""""""""""""""""
" Auto load plugins
""""""""""""""""""""""""""""""""""""""
" NERDTree plugin
autocmd vimenter * NERDTree

" NeoComplete plugin
"   more information https://github.com/Shougo/neocomplete.vim
let g:neocomplete#enable_at_startup = 1
