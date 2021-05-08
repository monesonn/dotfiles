" █ █▄ █ █ ▀█▀   █ █ █ █▄ ▄█
" █ █ ▀█ █  █  ▄ ▀▄▀ █ █ ▀ █

" Author: Stanislav <git.io/monesonn>

" Sections:
"	-> General
"	-> User interface
"   -> Files and backups
"   -> Text, tab and indent related
"   -> Visual mode related
"	-> Shortcuts
"	-> Functions
"   -> Plugins configuration

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
