#             __
#    ___ ___ / /  ________
#  _/_ /(_-</ _ \/ __/ __/
# (_)__/___/_//_/_/  \__/

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export HISTSIZE=1000
export EDITOR="nvim"
export DOTFILES_DIR="$HOME/.dotfiles"
export VISUAL="$EDITOR"
ZSH_THEME="powerlevel10k/powerlevel10k"

# autoload -U compinit && compinit

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	z
	zsh-syntax-highlighting
	zsh-autosuggestions
	dnf
	emoji
	sudo
	extract
    ripgrep
    fd
    systemd
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
# export EDITOR='vim'
#else
#  export EDITOR='nvim'
#fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


#
# ALIASES
#

# Reload .zshrc
alias refresh="exec zsh"

# Youtube-dl
alias yt="youtube-dl"
alias ytu="youtube-dl -U"
alias ytv-best="youtube-dl -f bestvideo+bestaudio"
alias ytv-uploader="youtube-dl --output '$HOME/Videos/%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"
alias ytv-playlist="youtube-dl --output '$HOME/Videos/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"

# Merging audio/video files
alias merge-a="ffmpeg -f concat -safe 0 -i <(for f in ./*.mp3; do echo \"file '$PWD/$f'\"; done) -c copy output.mp3"
alias soxa="sox *.mp3" 
alias soxit='sox *.mp3 "$(pwd | sed "s#.*/##").mp3"'
alias sox!='for File in *.mp3; { [ -f "$File" ] || continue; ffmpeg -i "$File" -ar 48000 -vsync 2 "${File%.mp3}_tmp.mp3" && \rm -v "$File" | sed "s/removed /[encoded]: /" && \mv "${File%.mp3}_tmp.mp3" "${File%.mp3}.mp3"; } 2>/dev/null && echo "[sox] started\!" && sox *.mp3 "$(pwd | sed "s#.*/##").mp3"'


# Flags


# Alias to modified commands
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"
alias du='du -sh'
alias mkdir="mkdir -p"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTRNDIR=`cat $HOME/.rangerdir`; cd "$LASTRNDIR"'
alias lf='lf -last-dir-path=$HOME/.lfdir; LASTLFDIR=`cat $HOME/.lfdir`; cd "$LASTLFDIR"'

# Alias chmod commands
alias ax='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Shortcuts
alias c="clear"
alias t="touch"
alias e="exit"
alias q="exit"
alias n="nvim"
alias v="vim"
alias h="help"

alias sn="sudo nvim"
alias sv="sudo vim"
alias da='date "+%Y-%m-%d %A %T %Z"'
alias tl="tail -f"
alias rn="ranger"
alias mk="mkdir"
alias rf="rm -rf"
alias ff="find . -type f -name"
alias nf="neofetch"

alias fdir="find . -type d -name"
alias hgrep="history | grep"
alias edit="$EDITOR"
alias hist="history"

alias lol="lolcat"
alias upd="sudo dnf update -y"
alias fupd="flatpak update -y"
alias pkgs="ls /usr/bin/ | wc -l"
alias upda="sudo dnf update -y && flatpak update -y"

alias mpvc="mpv --geometry=50%x50%"
alias mpvsw="mpv --geometry=20%x20% --border=no --ontop=yes"

alias pcnt="sudo protonvpn connect --fastest"
alias pdcnt="sudo protonvpn disconnect"

alias translate="trans -brief -t uk"
alias gtt="trans -brief -t ru"
alias toeng="trans -brief :en"
alias dict="trans :uk"

alias wcp="wl-copy"
alias wps="wl-paste"

alias fdl="fd -l"
alias fda="fd -a"

alias netrst="sudo systemctl restart NetworkManager.service"

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias scommit='git commit -S -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'
alias tag='git tag'
alias newtag='git tag -a'
alias config="git --git-dir=$DOTFILES_DIR --work-tree=$HOME"

# Configuration
alias rnrc="$EDITOR $HOME/.config/ranger/rc.conf"
alias lfrc="$EDITOR $HOME/.config/lf/lfrc"
alias bashrc="$EDITOR $HOME/.bashrc"
alias zshrc="$EDITOR $HOME/.zshrc"
alias vimrc="$EDITOR $HOME/.vimrc"
alias nvimrc="$EDITOR $HOME/.config/nvim/init.vim"
alias ohmyzsh="$EDITOR $HOME/.oh-my-zsh"
alias nfrc="$EDITOR $HOME/.config/neofetch/config.conf"
alias p10krc="$EDITOR $HOME/.p10k.zsh"
alias swayrc="$EDITOR $HOME/.config/sway/config"
alias swaydrc="$EDITOR $HOME/.config/sway/decoration"
alias alacrittyrc="$EDITOR $HOME/.config/alacritty/alacritty.yml"
alias waybarrc="$EDITOR $HOME/.config/waybar/config"
alias waybarcssrc="$EDITOR $HOME/.config/waybar/style.css"
alias cmusrc="$EDITOR $HOME/.config/cmus/rc"

# Navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../..'
alias .5='cd ../../../..'
alias .6='cd ../../../../..'
alias .f='cd "$DOTFILES_DIR"'
alias bd='cd "$OLDPWD"'

# Changing "ls" to "lsd" or "exa"
alias ls='exa' # icons only in 0.9 version 
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias l.='ls -a | egrep "^\."'

# Changing "cat" to "bat"
alias cat='bat'

# Changing "find" to "fd"
# alias find='fd'

# Get top process eating MEM
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# Get top process eating CPU
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# Get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Show current network connections
# alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"
alias ipleak="curl https://ipv4.ipleak.net/json/"
alias myip="http https://ipv4.ipleak.net/json/ | grep -E '.ip.:|.country_name.:'"

# Switch between shells
alias tobash="chsh -s $(which bash) && echo 'Now log out.'"
alias tozsh="chsh -s $(which zsh)  && echo 'Now log out.'"

# Usefull aliases
# alias go_update="curl --silent https://storage.googleapis.com/golang/$(curl --silent https://golang.org/doc/devel/release.html | grep -Eo 'go[0-9]+(\.[0-9]+)+' | sort -V | uniq | tail -1).$(uname -s | tr '[:upper:]' '[:lower:]')-$(case "$(uname -m)" in i*) echo '386' ;; x*) echo 'amd64' ;; *) echo 'armv61'; esac).tar.gz  | sudo tar -vxz --strip-components 1 -C $(dirname $(dirname $(which go)))"
alias omzu="omz update"
alias hide_cursor="echo -ne '\e[?25l'"
alias reappear_cursor="echo -ne '\e[?25h'"
alias p10ku="git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull"
alias scripts="ls ~/.local/bin"
alias clck="echo -e `(date +"%a, %B %d %l:%M%p"| sed 's/  / /g')`"
alias mem="echo -e `(free -h | awk '/^Mem:/ {print $3 "/" $2}')`"
alias upt="echo `(uptime --pretty | sed -e 's/up //g' -e 's/ days/d/g' -e 's/ day/d/g' -e 's/ hours/h/g' -e 's/ hour/h/g' -e 's/ minutes/m/g' -e 's/, / /g')`"
alias blife="upower -i /org/freedesktop/UPower/devices/battery_BAT1"
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias help="cht.sh"

# Function

function beamerpdf() {
    file=$(readlink -f "$1")
    base="${file%.*}"
    pandoc $file -t beamer --pdf-engine=xelatex -o $base.pdf 2>/dev/null
}

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Adding RUST to the PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Adding GO
export GOPATH=$HOME/.go
export GOBIN="$GOPATH/bin"
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Fixing VTE (Tilix)
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi

# Setting NVM 
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#  Setting DENO
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# PATH to local scripts
export PATH="${PATH}:${HOME}/.local/bin/"

echo "\033[1;34m$(fortune -s)\033[m\n"

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

