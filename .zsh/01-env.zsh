#             __
#    ___ ___ / /  ________
#  _/_ /(_-</ _ \/ __/ __/
# (_)__/___/_//_/_/  \__/
# 01.environment

export ZSH="$HOME/.oh-my-zsh"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export HISTSIZE=1000
export EDITOR="nvim"
export VISUAL="$EDITOR"
export DOTFILES_DIR="$HOME/.dotfiles"
export LANG=en_US.UTF-8

#export EDITOR="emacsclient -t -a ''"
#export VISUAL="emacsclient -c -a emacs"
#bindkey -v

# => "bat","vim","nvim" as manpager
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
export MANPAGER="nvim -c 'set ft=man' -"

# Adding RUST to the PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Adding GO
# export GOPATH=$HOME/.go
# export GOBIN="$GOPATH/bin"
# export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Setting NVM 
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#  Setting DENO
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# PATH to local scripts
export PATH="${PATH}:${HOME}/.local/bin/"

# DoomEmacs
export PATH="$HOME/.emacs.d/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/monesonn/.anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/monesonn/.anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/monesonn/.anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/monesonn/.anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Fixing VTE (Tilix)
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi

# Wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_WEBRENDER=1
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export _JAVA_AWT_WM_NONREPARENTING=1
export GDK_BACKEND="wayland,x11"
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=wayland
export SDL_VIDEODRIVER=wayland
