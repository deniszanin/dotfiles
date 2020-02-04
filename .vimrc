""""""""""""""""""""""""""""""""""""""
" VIM Config file:
"
" Denis Zanin
" https://github.com/deniszanin/dotfiles
" 
""""""""""""""""""""""""""""""""""""""
"   Sources:
"      https://vim.fandom.com/wiki/Example_vimrc
"
"   Plugins suggested:
"       https://github.com/tpope/vim-pathogen
"       https://github.com/scrooloose/nerdtree
"       https://github.com/majutsushi/tagbar
"       https://github.com/Shougo/neocomplete.vim
"       https://github.com/ryanoasis/nerd-fonts
"       https://github.com/ryanoasis/vim-devicons
"       https://github.com/vim-airline/vim-airline
"       https://github.com/SolomonSklash/vim-snazzy
"
"

" Sets LEADER key for VIM shortcuts
let mapleader = ","

" Load plugin
execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""
" :: General
""""""""""""""""""""""""""""""""""""""
" Fixes the problem where arrow keys do not function properly
set nocompatible

" Enable filetype plugins
filetype plugin on
filetype indent on

" Sets to auto read when a file is changed from outside
set autoread

" Sets temporary folder for VIM
set dir=~/.vim/cache/tmp
set undodir=~/.vim/cache/tmp/undo

" UNDO files and history
set undofile
set undolevels=1000
set undoreload=10000

" Sets how many lines of history VIM has to remember
set history=50

" Sets VIM to allow you to copy between files, remember your
" cursor position and other things
set viminfo='10,/50,:60,%,n~/.vim/cache/viminfo

" Don't save swap files
set nobackup
set noswapfile

""""""""""""""""""""""""""""""""""""""
" :: VIM user interface
""""""""""""""""""""""""""""""""""""""
" One such option is the 'hidden' option, which allow you to re-use
" the same window and switch from an unsaved buffer without saving it
" first. Also allows you to keep an undo history for multiple files when
" re-using the same window in this way.
set hidden

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.swp,*.bak

" Show partial commands in the last line of the screen.
set showcmd

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

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Set auto indent
set autoindent

" Set cursor line
set cursorline

" Prompt to save unsaved changes when exiting
set confirm

" Automatically change dir to the dir you're working
if exists("+autochdir")
    set autochdir
else
    autocmd BufEnter * lcd %:p:h
endif

""""""""""""""""""""""""""""""""""""
" => Color settings
"""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Colorscheme generated at
"   http://sweyla.com/themes
"
"   installed ~/.vim/colors/*.vim
"
"   snazzy color option:
"       https://raw.githubusercontent.com/connorholyday/vim-snazzy/master/colors/snazzy.vim
"
"colorscheme snazzy-mod
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
"set wrap "Wrap lines

" Turn a nice line breaking on.
set lbr

" Use ellipsis to indicate a line break.
set showbreak=…

set shiftwidth=4
set softtabstop=4

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
set tabstop=4

" Better handling of backspace key
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""
" :: Visual mode related
""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Fix search - normal regex can be used in searching
nnoremap / /\v
vnoremap / /\v

""""""""""""""""""""""""""""""""""""""
" :: Abbreviations
""""""""""""""""""""""""""""""""""""""
iab <expr> dts strftime("%d/%m/%y")
iab <expr> dmy strftime("%d.%m.%Y")
iab <expr> dmyt strftime("%d.%m.%Y %H:%M")

""""""""""""""""""""""""""""""""""""""
" :: Customs remaps
""""""""""""""""""""""""""""""""""""""
" Use <F3> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F3>

map <C-n> :NERDTreeToggle<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>

" Tagbar plugin
nmap <F9> :TagbarToggle<CR>

" Clear highlights for a search
nnoremap <silent> <leader><space> :noh<CR>

" Toggle cursor line [cursor]
map <silent> <leader>c :set cursorline!<CR>

" Toggle displaying newline characters an tabs [list]
map <silent> <leader>v :set list!<CR>

"" BUFFERS
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<CR>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls <CR>

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
au BufNewFile,BufRead *.py set expandtab

" PHP filetype
autocmd BufRead *.php setlocal filetype=php

" Markdown filetype
" Treat .text, README, and .md files as markdown files.
au! BufNewFile,BufRead *.text set filetype=markdown
au BufNewFile,BufRead *.text set nonumber
au BufNewFile,BufRead *.text set norelativenumber 
au BufNewFile,BufRead *.text set nocursorline 
au BufNewFile,BufRead *.text set ai formatoptions=tcroqn2 comments=n:&gt;

au! BufNewFile,BufRead README set filetype=markdown
au BufNewFile,BufRead README set ai formatoptions=tcroqn2 comments=n:&gt;

au! BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.md set ai formatoptions=tcroqn2 comments=n:&gt;

""""""""""""""""""""""""""""""""""""""
" Auto load plugins
""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""
" NERDTREE plugin settings
autocmd VimEnter * NERDTree
autocmd StdinReadPre * let s:std_in=1

" Closing automatically
let NERDTreeQuitOnOpen = 1

" Deleting buffer
let NERDTreeAutoDeleteBuffer = 1

" Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"""""""""""""""""""""""
" VIM AIRLINE settings
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tabline#left_alt_sep = '┃'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline_section_z = '%p%% %v:%l/%L'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_section_y = ''
let g:airline_skip_empty_sections = 1

"""""""""""""""""""""""
" NEOCOMPLETE settings
"   more information https://github.com/Shougo/neocomplete.vim
if has('lua')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#auto_completion_start_length = 1
    let g:neocomplete#sources#buffer#cache_limit_size = 50000
    let g:neocomplete#data_directory = $HOME.'/.vim/cache/neocompl'
    let g:neocomplete#force_omni_input_patterns = get(g:, 'neocomplete#force_omni_input_patterns', {})
    let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\;\w*' 
end

"""""""""""""""""""""""
" TAGBAR plugin settings
let g:tagbar_show_linenumbers = -1
let g:tagbar_singleclick = 1
let g:tagbar_auto_open = 1
