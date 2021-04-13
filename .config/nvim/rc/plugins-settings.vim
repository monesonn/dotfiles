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
