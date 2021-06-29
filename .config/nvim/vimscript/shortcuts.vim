"        __            __           __
"   ___ / /  ___  ____/ /_______ __/ /____
"  (_-</ _ \/ _ \/ __/ __/ __/ // / __(_-<
" /___/_//_/\___/_/  \__/\__/\_,_/\__/___/


" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" u - undo, ctrl & u - redo
map <C-u> :red<CR>

" Faster in-line navigation
noremap W 5w
noremap B 5b
noremap j gj
noremap k gk
noremap 9 0
noremap 0 $
noremap ( g0
noremap ) g$

" Remove all macros
map <leader>dm :del a-zA-Z0-9<cr>

nnoremap <silent> ,<leader> :set hlsearch!<CR>
nmap <silent><leader>/ :nohl<CR>
nmap <leader>p :set paste!<BAR>set paste?<CR>
map <leader>] :cn<CR>
map <leader>[ :cp<CR>

" Fast shortcuts for quiting and saving files
nmap <leader>w :w!<CR> 
nmap <leader>q :q!<CR>
nmap <leader>wq :wq<CR>

" set local
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader>ss :setlocal spell!<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
map <leader>pp :setlocal paste!<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>
map <leader>Right :bnext<cr>
map <leader>Left :bprevious<cr>

" Useful mappings for managing tabs
nnoremap tn :tabnew<cr>
nnoremap to :tabonly<cr>
nnoremap tc :tabclose<cr>
nnoremap tm :tabmove<cr>
nnoremap tt :tabnext<cr>
nnoremap tp :tabprevious<cr>

nnoremap <silent><leader><right> :tabnext<cr>
nnoremap <silent><leader><left> :tabprevious<cr>

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

au TabLeave * let g:lasttab = tabpagenr()
" nnoremap <silent><c-[> :exe \"tabn ".g:lasttab<cr>
" vnoremap <silent><c-[> :exe \"tabn ".g:lasttab<cr>

" Jump to nvim config file
noremap <silent> <leader>rc :e $HOME/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>d :GitGutterToggle<cr>

" Use <Leader>Esc to leave terminal mode
tnoremap <leader><Esc> <C-\><C-n>
tnoremap <leader>jj <C-\><C-n>

nnoremap <silent><C-n> :NERDTreeToggle %<CR>
nnoremap <silent><C-z> :FZFExplore<CR>
nnoremap <silent><C-f> :Files<CR>

" map <Leader>. :Ranger<CR>
nnoremap <silent><Leader>g :Goyo \| set linebreak<CR>

" map <C>, :set hlsearch!<CR>

" Make adjusing split sizes a bit more friendly
"noremap <silent><Leader>Left  :vertical resize +3<CR>
"noremap <silent><Leader>Right :vertical resize -3<CR>
"noremap <silent><Leader>Up    :resize +3<CR>
"noremap <silent><Leader>Down  :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Navigating through split windows
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

" Splitting windows
map <leader>v <C-w>v
map <leader>h <C-w>s

" Run code from Neovim

" you can use it instead of quickrun
"autocmd filetype python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR>
"autocmd filetype c nnoremap <F5> :w <bar> exec '!cc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
"autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
"autocmd filetype go nnoremap <F5> :w <bar> exec '!go run '.shellescape('%')<CR>
"autocmd filetype rust nnoremap <F5> :w <bar> exec '!rustc '.shellescape('%').' && ./.shellescape('%:r')<CR> 
"autocmd filetype markdown nnoremap <F5> :w <bar> exec '!pandoc .shellescape('%') -t beamer --pdf-engine=xelatex -o '.shellescape('%').pdf' && mupdf '.shellescape('%').pdf'<CR>

nnoremap <silent><F5> :w <bar> :silent QuickRun <cr><C-w>l

map <C>. :cnext<CR>
map <C>/ :cprevious<CR>
nnoremap <C-a> :cclose<CR>

nnoremap <silent><C-r> :Rg<CR>
nnoremap <silent><C-g> :GFiles<CR>
nnoremap <silent><C-h> :History<CR>
nnoremap <silent><C-j> :GFiles?<CR>
nnoremap <silent><C-k> :Buffers<CR>
nnoremap <silent><C-l> :Lines<CR>
nnoremap <silent><C-s> :Snippets<CR>
" nnoremap <silent><C-m> :Marks<CR>
" nnoremap <silent><C-n> :Commits<CR>
nnoremap <silent><C-space> :Commands<CR>

nmap <silent><C-c> <Plug>(coc-cursors-position)
nmap <leader>x <Plug>(coc-cursors-operator)

nmap <silent><C-d> <Plug>(coc-cursors-word)*
xmap <silent><C-d> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)

nmap <expr><silent><C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

nnoremap <F8> :TagbarToggle<CR>
