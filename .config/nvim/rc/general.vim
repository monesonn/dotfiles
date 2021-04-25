" ▄▀  ██▀ █▄ █ ██▀ █▀▄ ▄▀▄ █
" ▀▄█ █▄▄ █ ▀█ █▄▄ █▀▄ █▀█ █▄▄

let mapleader = "\<Space>"  " Sets mapleader

autocmd! bufwritepost init.vim source $HOME/.config/nvim/init.vim " Auto-reload nvim when editing it
autocmd! bufwritepost ./rc/* source $HOME/.config/nvim/init.vim

set history=50      " Sets how many lines of history VIM has to remember
syntax enable       " Enabling syntax in .* files
set confirm         " Confirmation of saving changes to the file on exit
set signcolumn=no   " Disable signcolumn by default, it's toggled by function CallSignColumn()
set autochdir       " Change $PWD from currently opened file. Used for fzf.

filetype on         " Enable filetype detection
filetype plugin on  " Enable filetype-specific indenting 
filetype indent on  " Enable filetype-specific plugins

au FocusGained,BufEnter * checktime
set number relativenumber   " Sets numbers on left to easily jump on file
set mouse=a                 " Enable mouse in all modes
set ttyfast                 " Should make scrolling faster
set laststatus=2            " Always show the status line
set t_Co=256                " 256 color mode
set clipboard+=unnamedplus

" Set to auto read when a file is changed from the outside
set autoread
set autowrite

set splitbelow splitright
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
