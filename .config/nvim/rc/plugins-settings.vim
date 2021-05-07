" █▀▄ █   █ █ ▄▀  █ █▄ █ ▄▀▀   ▄▀▀ ▄▀▄ █▄ █ █▀
" █▀  █▄▄ ▀▄█ ▀▄█ █ █ ▀█ ▄██   ▀▄▄ ▀▄▀ █ ▀█ █▀

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

" => NerdTree <=

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize=50
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
" let NERDTreeQuitOnOpen = 1

" autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif

" => Goyo <=

let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

" => Golang <=

" General
let g:go_gopls_enabled = 1
let g:go_gopls_options = ['-remote=auto']

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_referrers_mode = 'gopls'

let g:go_diagnostics_enable = 1

" Auto formatting and importing, silent fail
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

" Status line types
let g:go_auto_sameids = 0
let g:go_auto_type_info = 1

" Go syntax highlighting
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_string_spellcheck=0
let g:go_highlight_functions = 1
let g:go_highlight_types = 1

let g:go_metalinter_enabled = []
let g:go_jump_to_error = 0

let g:go_list_type = 'quickfix'

let g:go_loaded_gosnippets = 1
let g:go_loaded_install = 0

" => GitGutter <=

let g:gitgutter_enabled=1

"au filetype go inoremap <buffer> . .<C-x><C-o>

let g:coc_global_extensions = [
            \ 'coc-json',
            \ 'coc-git',
            \ 'coc-prettier',
            \ 'coc-svelte',
            \ 'coc-snippets',
            \ 'coc-sql',
            \ 'coc-pairs',
            \]

" Setup prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" DISABLE SIGNCOLUMN IN COC.NVIM
"autocmd BufRead,BufNewFile * setlocal signcolumn=no
"autocmd BufRead,BufNewFile * highlight clear SignColumn

call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

" only / and ? are enabled by default
call wilder#set_option('modes', ['/', '?', ':'])

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     [
      \       wilder#check({_, x -> empty(x)}),
      \       wilder#history(),
      \       wilder#result({
      \         'draw': [{_, x -> ' ' . x}],
      \       }),
      \     ],
      \     wilder#cmdline_pipeline(),
      \     wilder#search_pipeline(),
      \   ),
      \ ])

"au! BufNewFile,BufRead *.svelte set ft=html
let g:vim_svelte_plugin_load_full_syntax = 1

function! OnChangeSvelteSubtype(subtype)
  echom 'Subtype is '.a:subtype
  if empty(a:subtype) || a:subtype == 'html'
    setlocal commentstring=<!--%s-->
    setlocal comments=s:<!--,m:\ \ \ \ ,e:-->
  elseif a:subtype =~ 'css'
    setlocal comments=s1:/*,mb:*,ex:*/ commentstring&
  else
    setlocal commentstring=//%s
    setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
  endif
endfunction

autocmd FileType svelte inoremap <buffer><expr> OnChangeSvelteSubtype()

let g:fzf_layout = { 'down': '30%' }
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
