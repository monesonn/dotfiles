" ▄▀▀ █▄█ ▄▀▄ █▀▄ ▀█▀ ▄▀▀ █ █ ▀█▀ ▄▀▀
" ▄██ █ █ ▀▄▀ █▀▄  █  ▀▄▄ ▀▄█  █  ▄██

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

nnoremap <silent><C-z> :NERDTreeToggle %<CR>
nnoremap <silent><C-f> :NERDTreeFind<CR>
" mmap <C-f> :Files<CR>
map <C-u> :red<CR>
map <Leader>. :Ranger<CR>
nnoremap <silent><C-g> :Goyo \| set linebreak<CR>
" map <C>, :set hlsearch!<CR>

" Make adjusing split sizes a bit more friendly
noremap <silent> <Leader>Left :vertical resize +3<CR>
noremap <silent> <Leader>Right :vertical resize -3<CR>
noremap <silent> <Leader>Up :resize +3<CR>
noremap <silent> <Leader>Down :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Navigating through split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

" Faster in-line navigation
noremap W 5w
noremap B 5b

" Run code from Neovim

" you can use it instead of quickrun
"autocmd filetype python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR>
"autocmd filetype c nnoremap <F5> :w <bar> exec '!cc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
"autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
"autocmd filetype go nnoremap <F5> :w <bar> exec '!go run '.shellescape('%')<CR>
"autocmd filetype rust nnoremap <F5> :w <bar> exec '!rustc '.shellescape('%').' && ./.shellescape('%:r')<CR> 
"autocmd filetype markdown nnoremap <F5> :w <bar> exec '!pandoc .shellescape('%') -t beamer --pdf-engine=xelatex -o '.shellescape('%').pdf' && mupdf '.shellescape('%').pdf'<CR>

nnoremap <silent> <F5> :silent QuickRun <CR>
