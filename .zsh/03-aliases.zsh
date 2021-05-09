#             __
#    ___ ___ / /  ________
#  _/_ /(_-</ _ \/ __/ __/
# (_)__/___/_//_/_/  \__/
# 03. aliases

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

# Find and listen something
alias listen='mpv --no-video "$(fd ".*.mp3$|.*.flac$|.*.aac$|.*.opus$" | fzf)"'

# Flags

# Alias to modified commands
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"
alias du='du -sh'
alias mkdir="mkdir -p"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTRNDIR=`cat $HOME/.rangerdir`; cd "$LASTRNDIR"'
alias lf='lf -last-dir-path=$HOME/.lfdir; LASTLFDIR=`cat $HOME/.lfdir`; cd "$LASTLFDIR"'
alias cat='bat'
#alias find='fd'
alias em="\emacs -nw"
#alias emacs="emacsclient -c -a 'emacs'"

# DOOM EMACS
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"

# Alias chmod commands
alias ax='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Shortcuts
alias c="clear"
alias clr="clear"
alias t="touch"
alias e="exit"
alias q="exit"
alias n="nvim"
alias v="vim"
alias h="help"

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

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# Configuration
alias cfg='$EDITOR `fd ".*.conf$|.*.vim$|.*.lua$|.*.rc$|.*rc$|.*json$" --type file -H $HOME/.config -E "plugged" -E "coc" -E "schemes" | fzf`'
alias hcfg='$EDITOR `fd "^\." -H --type file --maxdepth 1 | fzf`'
alias zshrc="$EDITOR $HOME/.zshrc"

# Navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../..'
alias .5='cd ../../../..'
alias .6='cd ../../../../..'
alias .f='cd "$DOTFILES_DIR"'
alias bd='cd "$OLDPWD"'
alias ohmz='cd "$ZSH"'
alias j='cd `fd --type directory | fzf`'
alias jj='cd `fd "" -H --type directory $HOME | fzf`'
alias zz='z `z | fzf`'

# Changing "ls" to "lsd" or "exa"
alias ls='exa' # icons only in 0.9 version 
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias l.='ls -a | egrep "^\."'

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

function beamerpdf() {
    file=$(readlink -f "$1")
    base="${file%.*}"
    pandoc $file -t beamer --pdf-engine=xelatex -o $base.pdf 2>/dev/null
}

geo () {
    [ ${#} -eq 0 ] && http --body ipv4.ipleak.net/json/ || http --body ipv4.ipleak.net/json/`dig +short $1`
}

go_update () {
    release=$(curl --silent https://golang.org/doc/devel/release.html | grep -Eo 'go[0-9]+(\.[0-9]+)+' | sort -V | uniq | tail -1)
    os=$(uname -s | tr '[:upper:]' '[:lower:]')
    arch=$(case "$(uname -m)" in i*) echo '386' ;; x*) echo 'amd64' ;; *) echo 'armv61'; esac)

    curl --silent https://storage.googleapis.com/golang/$release.$os-$arch.tar.gz | sudo tar -vxz --strip-components 1 -C /usr/local/go
    exec zsh
    echo "updated to $(go version)"
}