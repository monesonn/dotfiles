"    _      _ __        _
"   (_)__  (_) /_ _  __(_)_ _
"  / / _ \/ / __/| |/ / /  ' \
" /_/_//_/_/\__(_)___/_/_/_/_/

" About:  Configuration files for nvim
" Author: Stanislav <git.io/monesonn>
" Link:   http://git.io/.mn

" Sections:
"   -> General
"   -> Plugins
"   -> Plugins settings
"   -> User interface
"   -> Shortcuts
"   -> Functions

let configs = [
\  "general",
\  "plugins",
\  "plugins-settings",
\  "ui",
\  "shortcuts",
\  "functions",
\]

for file in configs
  let x = expand("~/.config/nvim/rc/".file.".vim")
  if filereadable(x)
    execute 'source' x
  endif
endfor
