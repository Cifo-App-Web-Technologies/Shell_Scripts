echo '" TABLE OF CONTENTS:

" 1. Generic settings
" 2. File settings
" 3. UI
" 4. Maps and functions

"-----------------------------------------
" 1. GENERIC SETTINGS
"-----------------------------------------

set nocompatible " disable vi compatibility mode
set history=1000 " increase history size
set syntax=on

"-----------------------------------------
" 1.1  PERSONAL  SETTINGS
"-----------------------------------------

set mouse=av

"---------------------------------------
" 2. FILE SETTINGS
"-----------------------------------------

" Stop creating backup files, please use Git for backups

set nobackup
set nowritebackup
set noswapfile
set backspace=indent,eol,start

" Modify indenting settings

set autoindent " autoindent always ON.
set expandtab " expand tabs
set shiftwidth=2 " spaces for autoindenting
set softtabstop=2 " remove a full pseudo-TAB when i press <BS>

" Modify some other settings about files

set encoding=utf-8 " always use unicode
set hidden
set ignorecase
set scrolloff=8 " Keep at least 8 lines below cursor
set foldmethod=manual " To avoid performance issues, I never fold anything so...

"-----------------------------------------
" 3. UI
"-----------------------------------------

set fillchars+=vert:\ " Remove unpleasant pipes from vertical splits

" Sauce on this: http://stackoverflow.com/a/9001540

set wildmenu " enable visual wildmenu
" set number 
" show line numbers
set showmatch " higlight matching parentheses and brackets
set nohlsearch
set lazyredraw
set ttyfast
set hidden

"-----------------------------------------
" 4. MAPS AND FUNCTIONS
"-----------------------------------------

let mapleader=","

" Snippet for console.log
nmap <leader><leader>c oconsole.log({});<Esc>==f{a

" To avoid undo points when using arrow keys
inoremap <Left> <c-g>U<Left>
inoremap <Right> <c-g>U<Right>

" Whit leader p you can delete things without saving to register so you can
" paste what you have before
vnoremap <leader>p "_d

" Make window navigation less painful.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Working with buffers is cool.
map <C-d> :bnext<CR>
map <C-a> :bprev<CR>
imap <C-D> <Esc>:bnext<CR>a
imap <C-A> <Esc>:bprev<CR>a

" Capital Y to copy to the end of the line like C or D
nnoremap Y y$

" To move in the search list but keeping the cursor in the middle of screen
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv

" To close buffers without closing splits
nnoremap <silent> <C-q> :lclose<bar>b#<bar>bd #<CR>' > ~/.vimrc
