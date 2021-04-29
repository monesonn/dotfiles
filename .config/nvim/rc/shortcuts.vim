" ▄▀▀ █▄█ ▄▀▄ █▀▄ ▀█▀ ▄▀▀ █ █ ▀█▀ ▄▀▀
" ▄██ █ █ ▀▄▀ █▀▄  █  ▀▄▄ ▀▄█  █  ▄██

" u - undo, ctrl & u - redo
map <C-u> :red<CR>

" Faster in-line navigation
noremap W 5w
noremap B 5b

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
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map tt :tabnext<cr> 

" Jump to nvim config file
noremap <silent> <leader>rc :e $HOME/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>d :GitGutterToggle<cr>

" Use <Leader>Esc to leave terminal mode
tnoremap <leader><Esc> <C-\><C-n>
tnoremap <leader>jj <C-\><C-n>

"nnoremap <silent><C-z> :NERDTreeToggle %<CR>
nnoremap <silent><C-z> :FZFExplore<CR>
nnoremap <silent><C-f> :Files<CR>

map <Leader>. :Ranger<CR>
" nnoremap <silent><C-g> :Goyo \| set linebreak<CR>

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

nnoremap <silent> <F5> :silent QuickRun <CR>

map <C>. :cnext<CR>
map <C>/ :cprevious<CR>
nnoremap <C-a> :cclose<CR>

nnoremap <silent><C-r> :Rg<CR>
nnoremap <silent><C-g> :GFiles<CR>
nnoremap <silent><C-h> :History<CR>
nnoremap <silent><C-j> :GFiles?<CR>
nnoremap <silent><C-k> :Buffers<CR>
nnoremap <silent><C-l> :Lines<CR>
nnoremap <silent><C-n> :Snippets<CR>
nnoremap <silent><C-m> :Marks<CR>
nnoremap <silent><C-c> :Commits<CR>
