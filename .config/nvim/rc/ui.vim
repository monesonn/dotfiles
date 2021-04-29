" █ █ ▄▀▀ ██▀ █▀▄   █ █▄ █ ▀█▀ ██▀ █▀▄ █▀ ▄▀▄ ▄▀▀ ██▀
" ▀▄█ ▄██ █▄▄ █▀▄   █ █ ▀█  █  █▄▄ █▀▄ █▀ █▀█ ▀▄▄ █▄▄

set list
set listchars=
set listchars+=tab:·\ 
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:░

" split style
set fillchars+=vert:\ 

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
set wildmode=longest:full,full
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

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

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
hi StatusLine   term=NONE cterm=NONE ctermfg=248  ctermbg=NONE
hi StatusLineNC term=NONE cterm=NONE ctermfg=246  ctermbg=NONE
hi String       term=NONE cterm=NONE ctermfg=66   ctermbg=NONE
hi TabLineSel   term=NONE cterm=NONE ctermfg=251  ctermbg=NONE
hi Todo         term=NONE cterm=NONE ctermfg=251  ctermbg=66
hi Type         term=NONE cterm=NONE ctermfg=242  ctermbg=NONE
hi VertSplit    term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
hi Visual       term=NONE cterm=NONE ctermfg=16   ctermbg=101
hi WarningMsg   term=NONE cterm=NONE ctermfg=103  ctermbg=NONE
hi LineNr       term=NONE cterm=NONE ctermbg=NONE ctermfg=238
hi CursorLineNr term=NONE cterm=NONE ctermbg=NONE ctermfg=101
hi CursorcineNr term=NONE cterm=NONE ctermbg=237  ctermfg=16
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

hi! link SignColumn      LineNr
