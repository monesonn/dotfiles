#             __
#    ___ ___ / /  ________
#  _/_ /(_-</ _ \/ __/ __/
# (_)__/___/_//_/_/  \__/
# 02.plugins

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    z
    zsh-syntax-highlighting
    zsh-autosuggestions
    dnf
    emoji
    sudo
    #doas
    extract
    ripgrep
    fd
    systemd
    zsh-nvm
    emacs
    zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh