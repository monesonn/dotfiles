"          __          _
"    ___  / /_ _____ _(_)__  ___
"   / _ \/ / // / _ `/ / _ \(_-<
"  / .__/_/\_,_/\_, /_/_//_/___/
" /_/          /___/

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.vim}/plugged"'))
" {{ Basics }}
Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" {{ File browsers }}
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/NERDTree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" {{  Themes }}
Plug 'yuttie/hydrangea-vim'
" {{  Code, language support, Snippets }}
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'editorconfig/editorconfig-vim'
Plug 'leafOfTree/vim-svelte-plugin'
" Plug 'sheerun/vim-polyglot'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'thinca/vim-quickrun'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'powerman/vim-plugin-ruscmd'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
" {{ Junegunn Choi Plugins }}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
call plug#end()
