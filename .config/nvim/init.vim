"    _      _ __        _
"   (_)__  (_) /_ _  __(_)_ _
"  / / _ \/ / __/| |/ / /  ' \
" /_/_//_/_/\__(_)___/_/_/_/_/

" About:  Configuration files for nvim
" Author: Stanislav <git.io/monesonn>
" Link:   http://git.io/.mn

" Options: 'vim' or 'lua'
let language="vim"

if language == "vim"
    let configs = [
    \  "general",
    \  "plugins",
    \  "plugins-settings",
    \  "ui",
    \  "shortcuts",
    \  "functions",
    \]

    for file in configs
        let x = expand("~/.config/nvim/vimscript/".file.".vim")
        if filereadable(x)
            execute 'source' x
        endif
    endfor
elseif language == "lua"
    :luafile ~/.config/nvim/lua/init.lua
else 
    echom "Nothing to source. Check your init.vim file."
endif
