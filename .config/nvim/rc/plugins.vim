" █▀▄ █   █ █ ▄▀  █ █▄ █ ▄▀▀
" █▀  █▄▄ ▀▄█ ▀▄█ █ █ ▀█ ▄██

" Installing plug-in for nvim, if absent and auto-install plugins below
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
" {{ Basics }}
"Plug 'itchyny/lightline.vim'
Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" {{ File browsers }}
Plug 'francoiscabrol/ranger.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/NERDTree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" {{  Themes }}
Plug 'yuttie/hydrangea-vim'
Plug 'romgrk/doom-one.vim'
" {{  Code, language support, Snippets }}
Plug 'editorconfig/editorconfig-vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'sheerun/vim-polyglot'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'thinca/vim-quickrun'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'powerman/vim-plugin-ruscmd'
" :UpdateRemotePlugins needed
Plug 'gelguy/wilder.nvim'
" {{ Junegunn Choi Plugins }}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
call plug#end()
