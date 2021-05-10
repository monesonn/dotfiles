"          _
"    _  __(_)_ _  ________
"  _| |/ / /  ' \/ __/ __/
" (_)___/_/_/_/_/_/  \__/

" About:  Configuration files for vim (vi improved)
" Author: Stanislav <git.io/monesonn>
" Link:   http://git.io/.mn

let configs = [
\  "general",
\  "plugins",
\  "plugins-settings",
\  "ui",
\  "shortcuts",
\  "functions",
\]

for file in configs
  let x = expand("~/.vim/rc/".file.".vim")
  if filereadable(x)
    execute 'source' x
  endif
endfor
