#             __
#    ___ ___ / /  ________
#  _/_ /(_-</ _ \/ __/ __/
# (_)__/___/_//_/_/  \__/
# 03. aliases

# Edit dotfiles via bare repository.
# Env variable $DOTFILES_DIR can be changed in env.zsh file.
# Usage: . [git command]
# NOTE: In theory, it doesn't override '.', but idk, mb in some cases it may.
alias .="git --git-dir=$DOTFILES_DIR --work-tree=$HOME"

# Reload .zshrc
alias \
    refresh="exec zsh" \
    reload="exec zsh"

# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# Youtube-dl
alias \
    yt="youtube-dl" \
    ytu="youtube-dl -U" \
    ytv-best="youtube-dl -f bestvideo+bestaudio" \
    ytv-uploader="youtube-dl --output '$HOME/Videos/%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'" \
    ytv-playlist="youtube-dl --output '$HOME/Videos/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"

# Audio/Video processing (sox & ffpmeg)
# Merging audio files into one and else..
alias \
    merge-a="ffmpeg -f concat -safe 0 -i <(for f in ./*.mp3; do echo \"file '$PWD/$f'\"; done) -c copy output.mp3" \
    soxa="sox *.mp3" \
    soxit='sox *.mp3 "$(pwd | sed "s#.*/##").mp3"' \
    sox!='for File in *.mp3; { [ -f "$File" ] || continue; ffmpeg -i "$File" -ar 48000 -vsync 2 "${File%.mp3}_tmp.mp3" && \rm -v "$File" | sed "s/removed /[encoded]: /" && \mv "${File%.mp3}_tmp.mp3" "${File%.mp3}.mp3"; } 2>/dev/null && echo "[sox] started\!" && sox *.mp3 "$(pwd | sed "s#.*/##").mp3"'

# Find and listen something
alias listen='mpv --no-video "$(fd ".*.mp3$|.*.flac$|.*.aac$|.*.opus$" | fzf)"'

# Flags
# empty

# Aliases to existed commands.
# NOTE: Use \ before command, like \command to call original command.
alias \
    cp="cp -iv" \
    rm="rm -iv" \
    mv="mv -iv" \
    du='du -sh' \
    mkdir="mkdir -p" \
    ranger='ranger --choosedir=$HOME/.rangerdir; LASTRNDIR=`cat $HOME/.rangerdir`; cd "$LASTRNDIR"' \
    lf='lf -last-dir-path=$HOME/.lfdir; LASTLFDIR=`cat $HOME/.lfdir`; cd "$LASTLFDIR"' \
    cat='bat' \
    find='fd' \
    docker='podman' \
    sudo='doas' \
    sudoedit='doas $EDITOR' \
    ed='ed -p :' \
    ls='exa' # icons only in 0.9 version

    #emacs="emacsclient -c -a 'emacs'"


# DOOM EMACS
alias \
    doomsync="~/.emacs.d/bin/doom sync" \
    doomdoctor="~/.emacs.d/bin/doom doctor" \
    doomupgrade="~/.emacs.d/bin/doom upgrade" \
    doompurge="~/.emacs.d/bin/doom purge" \

# Alias chmod commands
alias \
    ax='chmod a+x' \
    000='chmod -R 000' \
    644='chmod -R 644' \
    666='chmod -R 666' \
    755='chmod -R 755' \
    777='chmod -R 777'

# Shortcuts (lazy to group it, so I organize it by letter length)

# 1-letter
alias \
    c="clear" \
    clr="clear" \
    t="touch" \
    e="exit" \
    q="exit" \
    n="nvim" \
    v="vim" \
    h="help" \

# 2-letter
alias \
    da='date "+%Y-%m-%d %A %T %Z"' \
    tl="tail -f" \
    rn="ranger" \
    mk="mkdir" \
    ff="find . -type f -name" \
    nf="neofetch" \
    em="\emacs -nw" \
    # rf="rm -rf" \

# 3-letter
alias \
    lol="lolcat" \
    gtt="trans -brief -t ru" \
    wcp="wl-copy" \
    wps="wl-paste" \
    fdl="fd -l" \
    fda="fd -a" \
    upd="sudo dnf update -y"

# 4-letter
alias \
    fdir="find . -type d -name" \
    edit="$EDITOR" \
    hist="history" \
    fupd="flatpak update -y" \
    pkgs="ls /usr/bin/ | wc -l" \
    upda="sudo dnf update -y && flatpak update -y" \
    mpvc="mpv --geometry=50%x50%" \
    pcnt="sudo protonvpn connect --fastest" \
    dict="trans :uk"

# 5-letter or more
alias \
    hgrep="history | grep" \
    mpvsw="mpv --geometry=20%x20% --border=no --ontop=yes" \
    pdcnt="sudo protonvpn disconnect" \
    toeng="trans -brief :en" \
    netrst="sudo systemctl restart NetworkManager.service" \
    translate="trans -brief -t uk"

# git aliases
alias \
    addup='git add -u' \
    addall='git add .' \
    branch='git branch' \
    checkout='git checkout' \
    clone='git clone' \
    commit='git commit -m' \
    scommit='git commit -S -m' \
    fetch='git fetch' \
    pull='git pull origin' \
    push='git push origin' \
    status='git status' \
    tag='git tag' \
    newtag='git tag -a' \
    config="git --git-dir=$DOTFILES_DIR --work-tree=$HOME"

# gpg encryption

# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# Configuration
alias \
    cfg='$EDITOR `fd ".*.conf$|.*.vim$|.*.lua$|.*.rc$|.*rc$|.*json$" --type file -H $HOME/.config -E "plugged" -E "coc" -E "schemes" | fzf`' \
    hcfg='$EDITOR `fd "^\." -H --type file --maxdepth 1 | fzf`' \
    zshrc="$EDITOR $HOME/.zshrc"

# Navigation
alias \
    ..='cd ..'  \
    ...='cd ../..' \
    .3='cd ../../..' \
    .4='cd ../../..' \
    .5='cd ../../../..' \
    .6='cd ../../../../..' \
    .f='cd "$DOTFILES_DIR"' \
    bd='cd "$OLDPWD"' \
    ohmz='cd "$ZSH"' \
    j='cd `fd --type directory | fzf`' \
    jj='cd `fd "" -H --type directory $HOME | fzf`' \
    zz='z `z | fzf`'

# Changing "ls" to "lsd" or "exa"
alias \
    l='ls -l' \
    la='ls -a' \
    lla='ls -la' \
    lt='ls --tree' \
    l.='ls -a | egrep "^\."'

# Get top process eating {MEM,CPU}
alias \
    psmem='ps auxf | sort -nr -k 4' \
    psmem10='ps auxf | sort -nr -k 4 | head -10' \
    pscpu='ps auxf | sort -nr -k 3' \
    pscpu10='ps auxf | sort -nr -k 3 | head -10'

# Get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Show current network connections
alias \
    ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'" \
    ipleak="curl https://ipv4.ipleak.net/json/" \
    myip="http https://ipv4.ipleak.net/json/ | grep -E '.ip.:|.country_name.:'" \

# Switch between shells
alias tobash="chsh -s $(which bash) && echo 'Now log out.'"
alias tozsh="chsh -s $(which zsh)  && echo 'Now log out.'"

# Usefull aliases
alias \
    omzu="omz update" \
    hide_cursor="echo -ne '\e[?25l'" \
    reappear_cursor="echo -ne '\e[?25h'" \
    p10ku="git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull" \
    scripts="ls ~/.local/bin" \
    clck="echo -e `(date +"%a, %B %d %l:%M%p"| sed 's/  / /g')`" \
    mem="echo -e `(free -h | awk '/^Mem:/ {print $3 "/" $2}')`" \
    upt="echo `(uptime --pretty | sed -e 's/up //g' -e 's/ days/d/g' -e 's/ day/d/g' -e 's/ hours/h/g' -e 's/ hour/h/g' -e 's/ minutes/m/g' -e 's/, / /g')`" \
    blife="upower -i /org/freedesktop/UPower/devices/battery_BAT1" \
    rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash' \
    help="cht.sh" \
    bluez_a2dp="pactl set-card-profile `grep bluez <(pactl list short) | tail -n 1 | awk '{print $2}'` a2dp-sink-aac"


# [ADDITIONAL] Functions

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
    echo "updated to $(go version)"
    exec zsh
}

bak () {
    while [ "$#" -gt 0 ]; do
        if [ "${1##*.}" = "bak" ]; then
            mv "$1" "${1%.bak}"
            shift
        else
            mv $1 $1.bak
            shift
        fi
    done
}

nn ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            \. "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
