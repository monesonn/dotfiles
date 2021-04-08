"      _      _ __        _
"     (_)__  (_) /_ _  __(_)_ _
"    / / _ \/ / __/| |/ / /  ' \
"   /_/_//_/_/\__(_)___/_/_/_/_/

" Author: monesonn <git.io/monesonn>

" Sections:
"	-> General
"	-> User interface
"   -> Files and backups
"   -> Text, tab and indent related
"   -> Visual mode related
"	-> Shortcuts
"	-> Functions
"   -> Plugins configuration

" Installing plug-in for nvim, if absent and auto-install plugins below
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugins I used
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
" Some usefull stuff
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
" File browsers
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/NERDTree'
" Coding .. Language support, Snippets
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich' 
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

"Plug 'lervag/vimtex'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'powerman/vim-plugin-ruscmd'
call plug#end()

"==========="
"= GENERAL ="
"==========="

let mapleader = "\<Space>"  " Sets mapleader

autocmd! bufwritepost init.vim source $HOME/.config/nvim/init.vim " Auto-reload nvim when editing it

set history=50  " Sets how many lines of history VIM has to remember
syntax enable   " Enabling syntax in .* files
set confirm     " Confirmation of saving changes to the file on exit

filetype on     " Enable filetype detection
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

"=================="
"= USER INTERFACE ="
"=================="

set list
set listchars=
set listchars+=tab:·\ 
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:░

" split style
set fillchars=vert:▒

set so=7        " Set 7 lines to the cursor - when moving vertically using j/k
let $LANG='en'  " Set English as default language
set langmenu=en " Set English as langmenu

set title       " Title

set nocompatible
set noshowmode
set noshowcmd
set noruler 

set modelines=0
set scrolloff=1
set display+=lastline
set completeopt-=preview

set wildmenu         " Turn on Wild menu
set wildignorecase
set wildmode=longest,list,full
set wildignore=*.o,*~,*.pyc
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

" Ignore compiled files
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" set updatetime=300
set cmdheight=1     " Height of the command bar
set hid             " A buffer becomes hidden when it is abandoned

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase      " Ignore case when searching
set smartcase       " Ignore case if search pattern is all lowercase,case-sensitive otherwise 
set hlsearch        " Highlight search
set incsearch       " Incremental search

set lazyredraw      " Don't redraw while executing macros (good performance config)
set magic           " For regular expressions turn magic on

set showmatch       " Show matching brackets when text indicator is over them
set mat=2           " How many tenths of a second to blink when matching brackets

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"===================="
"= COLORS AND FONTS ="
"===================="

set background=dark     " Set background 
set ffs=unix,dos,mac    " Use Unix as the standard file type

hi ColorColumn  term=NONE cterm=NONE ctermfg=NONE ctermbg=242
hi Comment      term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi Constant     term=NONE cterm=NONE ctermfg=101  ctermbg=NONE
hi Cursor       term=NONE cterm=NONE ctermfg=242  ctermbg=NONE
hi CursorLine   term=NONE cterm=NONE ctermfg=NONE ctermbg=234
hi DiffAdd      term=NONE cterm=NONE ctermfg=103  ctermbg=NONE
hi DiffChange   term=NONE cterm=NONE ctermfg=NONE ctermbg=16
hi DiffDelete   term=NONE cterm=NONE ctermfg=251  ctermbg=16
hi DiffText     term=NONE cterm=NONE ctermfg=251  ctermbg=101
hi Directory    term=NONE cterm=NONE ctermfg=101  ctermbg=16
hi Error        term=NONE cterm=NONE ctermfg=238  ctermbg=66
hi ErrorMsg     term=NONE cterm=NONE ctermfg=66   ctermbg=16
hi FoldColumn   term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi Folded       term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi Function     term=NONE cterm=NONE ctermfg=251  ctermbg=NONE
hi Identifier   term=NONE cterm=NONE ctermfg=66   ctermbg=NONE
hi IncSearch    term=NONE cterm=NONE ctermfg=247  ctermbg=247
hi NonText      term=NONE cterm=NONE ctermfg=101  ctermbg=NONE
hi Normal       term=NONE cterm=NONE ctermfg=249  ctermbg=NONE
hi PreProc      term=NONE cterm=NONE ctermfg=66   ctermbg=NONE
hi Search       term=NONE cterm=NONE ctermfg=251  ctermbg=247
hi Special      term=NONE cterm=NONE ctermfg=66   ctermbg=NONE
hi SpecialKey   term=NONE cterm=NONE ctermfg=101  ctermbg=NONE
hi Statement    term=NONE cterm=NONE ctermfg=251  ctermbg=NONE
hi StatusLine   term=NONE cterm=NONE ctermfg=238  ctermbg=NONE
hi StatusLineNC term=NONE cterm=NONE ctermfg=236  ctermbg=NONE
hi String       term=NONE cterm=NONE ctermfg=66   ctermbg=NONE
hi TabLineSel   term=NONE cterm=NONE ctermfg=251  ctermbg=NONE
hi Todo         term=NONE cterm=NONE ctermfg=251  ctermbg=66
hi Type         term=NONE cterm=NONE ctermfg=242  ctermbg=NONE
hi VertSplit    term=NONE cterm=NONE ctermfg=236  ctermbg=16
hi Visual       term=NONE cterm=NONE ctermfg=16   ctermbg=101
hi WarningMsg   term=NONE cterm=NONE ctermfg=103  ctermbg=NONE
"hi LineNr       term=NONE cterm=NONE ctermbg=234  ctermfg=237
"hi CursorLineNr term=NONE cterm=NONE ctermbg=237  ctermfg=16
hi Pmenu        term=NONE cterm=NONE ctermfg=249  ctermbg=16
hi PmenuSel     term=NONE cterm=NONE ctermfg=238  ctermbg=66
hi PmenuSbar    term=NONE cterm=NONE ctermfg=238  ctermbg=66
hi PmenuThumb   term=NONE cterm=NONE ctermfg=238  ctermbg=66
hi Underlined   term=underline cterm=underline ctermfg=NONE   ctermbg=NONE

hi! link diffAdded       DiffAdd
hi! link diffRemoved     DiffDelete
hi! link diffChanged     DiffChange
hi! link Title           Normal
hi! link MoreMsg         Normal
hi! link Question        DiffChange
hi! link TabLine         StatusLineNC
hi! link TabLineFill     StatusLineNC
hi! link VimHiGroup      VimGroup


" Set utf8 as standard encoding and en_US as the standard language
scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
	set encoding=utf-8
	set termencoding=big5
endfun

fun! UTF8()
	set encoding=utf-8
	set termencoding=big5
	set fileencoding=utf-8
	set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
	set encoding=big5
	set fileencoding=big5
endfun

"==========================="
"= FILES, BACKUPS AND UNDO ="
"==========================="

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

"================================"
"= TEXT, TAB AND INDENT RELATED ="
"================================"

set expandtab       " Expand TABs to spaces
set smarttab        " Insert tabs on the start of a line according to context   

set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " sets the number of columns for a TAB
set tabstop=4       " the width of a TAB is set to 4.
                    " still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set bs=indent,eol,start

set lbr
set tw=500

set autoindent      " Auto indentation
set smartindent     " Smart indentation
set wrap            " Wrapping lines

"======================="
"= VISUAL MODE RELATED ="
"======================="

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"============="
"= SHORTCUTS ="
"============="

nnoremap <silent> ,<leader> :set hlsearch!<CR>
nmap <silent><leader>/ :nohl<CR>
nmap <leader>p :set paste!<BAR>set paste?<CR>
map <leader>] :cn<CR>
map <leader>[ :cp<CR>

nmap <leader>w :w!<CR> 
nmap <leader>q :q!<CR>
nmap <leader>wq :wq<CR>
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader>ss :setlocal spell!<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map tt :tabnext<cr> 

map <leader>pp :setlocal paste!<cr>
noremap <leader>rc :e $HOME/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>d :GitGutterToggle<cr>

map <leader>dm :del a-zA-Z0-9<cr>

" Use <Leader>Esc to leave terminal mode
tnoremap <Leader><Esc> <C-\><C-n>
tnoremap <Leader>jj <C-\><C-n>

nnoremap <silent><C-z> :NERDTreeToggle<CR>
nnoremap <silent><leader>z :NERDTreeFind<CR>
map <C-u> :red<CR>
map <C-f> :Files<CR>
map <C-o> :Ranger<CR>
nnoremap <silent><C-g> :Goyo \| set linebreak<CR>
" map <C>, :set hlsearch!<CR>

" Navigating through split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

" Function, that hide UI 
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

" Run code from Neovim
autocmd filetype python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype go nnoremap <F5> :w <bar> exec '!go run '.shellescape('%')<CR>
autocmd filetype rust nnoremap <F5> :w <bar> exec '!rustc '.shellescape('%').' && ./.shellescape('%:r')<CR> 
autocmd filetype markdown nnoremap <F5> :w <bar> exec '!pandoc .shellescape('%') -t beamer --pdf-engine=xelatex -o '.shellescape('%').pdf' && mupdf '.shellescape('%').pdf'<CR>

"============="
"= Functions ="
"============="

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"========================="
"= PLUGINS CONFIGURATION ="
"========================="

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
      \ 'subseparator': { 'left': '|', 'right': '|' },
      \ }

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" => Ale <=

let g:ale_linters = {
  \ 'go': ['gopls'],
  \}
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

set omnifunc=ale#completion#OmniFunc

" => NerdTree <=

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize=50
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
" autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif

" => Goyo <=

let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

" => Golang <=

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_auto_type_info = 1
let g:go_fmt_fail_silently = 1
let g:go_list_type = 'quickfix'
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_function_parameters = 1
let g:go_addtags_transform = 'camelcase'
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_fmt_command = 'goimports'
let g:go_jump_to_error = 1
let g:go_loaded_gosnippets = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
" let g:go_loaded_install = 1
let g:go_highlight_string_spellcheck=0

" => UltiSnips <=

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" => GitGutter <=

let g:gitgutter_enabled=0

" => Vim-multiple-cursor <=

let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

let g:AutoPairsShortcutToggle='<,>p'  

"au filetype go inoremap <buffer> . .<C-x><C-o>
