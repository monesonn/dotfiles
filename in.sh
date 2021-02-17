#!/bin/sh
# Post-Installation Scripts for Fedora (PISfF)
# by Stanley <git.io/monesonn>
# Description:  Autoinstalls usefull packages, dotfiles, etc; and autoconfigure it.welc
# License: GNU GPLv3

# Some variables to initialize colors for colorfull echo output
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color
dotfilesrepo="https://github.com/monesonn/dotfiles.git"

# progress bar function
progressbar() {
    local w=80 p=$1;  shift
    # create a string of spaces, then change them to dots
    printf -v dots "%*s" "$(( $p*$w/100 ))" ""; dots=${dots// /.};
    # print those dots on a fixed-width space plus the percentage etc. 
    printf "\r\e[K|%-*s| %3d %% %s" "$w" "$dots" "$p" "$*"; 
}
quit() { echo -e "\x1b[2J \x1b[0H ${purp}<3 \x1b[?25h \x1b[u \x1b[m"; }

#
#   THE POINT TO START
#
cat << 'EOF'

         .~~~~`\~~\
         ;       ~~ \                  
        |           ;         
    ,--------,______|---.     
   /          \-----`    \  Post-installation scripts for Fedora  
   `.__________`-_______-   Stanley <monesonn> github.com/monesonn

EOF

read -r -p "Hi, $USER, do you want to execute it? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
echo "Go forward! It will start soon"
 ;;
    [nN][oO]|[nN])
 exit 1
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac

for x in {1..100} ; do
    progressbar "$x"
    sleep .05   # do some work here
done ; echo ; clear

curl -s -L http://bit.ly/10hA8iC | bash
echo -e "${BLUE}fedora-init.sh is starting...${NC}\n" ; sleep 5s

#
#   ADDITIONAL REPOSITORIES 
#
echo -e "${BLUE}Enabling additional repositories${NC}" ; sleep 5s
sudo dnf install -y `# rpm-fusion` \
                 https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm `# free` \
                 https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm `# non-free`

#gh-cli
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo -y 
# PostgreSql
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/F-33-x86_64/pgdg-fedora-repo-latest.noarch.rpm
# Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# 
#   PACKAGES
# 

# Debloat default gnome installation
sudp dnf remove -y  totem `# Gnome Videos`\
                    gnome-photos `# Gnome Photos`\
                    cheese `# Selfie application, hmm` \
                    gnome-contacts `# It's cool, that we can have contacts in our computer, but it almost useless`\
                    eog `# Eye-of-Gnome is an image viewer, feh is better` \
                    rhythmbox `# Gnome music player, use Lollypop or lighweight cmus instead` \
                    brltty `# Braile display` \
                    yelp `# Gnome help browser`
                    # anaconda\* `# Anaconda installer`

sudo dnf group remove -y "Fonts" # Delete unnecessary fonts  

sudo dnf install -y tor `# anonymizing network, usefull with VPN` \
                    protonvpn-cli `# highly-recommended cli tool for ProtonVPN provider, change external ip from terminal for free...` \
                    translate-shell `# translate anything from terminal` \
                    figlet `# for text formatting` \
                    bat `# cat written in Rust with some cool features` \
                    fd-find `# more user-friendly find alternative written in Rust` \
                    httpie `# curl alternative` \
                    tilix `# VTE-terminal for Gnome` \
                    htop `# use system monitor from terminal` \
                    lsd `# alternative to ls` \
                    newsboat `# email` \
                    zathura `# VI-style .pdf reader, supports different plugins` \
                    zathura-pdf-poppler `# pdf-poppler for zathura` \
                    feh `# lightweight image viewer written in C` \
                    cava `# audio visualizer` \
                    toilet `# figlet-like` \
                    cowsay `# cow say "Ack"` \
                    fortune-mod `# daily fortunes` \
                    lolcat `# colorize terminal` \
                    sl `# oops, try again...` \
                    cmus `# terminal music player, based in ncurses library` \
                    ranger `# file manager in terminal, absolutely best` \
                    iftop `# displays bandwith usage` \
                    nethogs `# tool resembling top for network traffic` \
                    ripgrep `# grep written in Rust` \
                    exa `# alternative to ls, also for lsd, written in Rust, i prefer it most` \
                    procs `# replacement for ps` \
                    sxiv `# image viewer feh, but different..` \
                    trash-cli `# move files to trash bin, instead of permanently delete it` \
                    openssl `# crypto-thing` \
                    gh `# cli tool to work with Github` \
                    transmission `# torrent` \
                    transmission-cli `# torrent-cli` \
                    neofetch `# show os information` \
                    vim `# VI-like editor` \
                    neovim `# replacement for vim, best text editor, highly customizable by configuration file and plugins` \
                    wl-clipboard `# x-clip for Wayland, copy file content to buffer` \
                    gnome-tweaks `# additional settings for Gnome` \
                    papirus-icon-theme `# icon theme` \
                    materia-gtk-theme `# GTK-theme for Gnome` \
                    zsh `# Z-shell` \
                    util-linux-user `# utilities for switching zsh to default shell` \
                    mpv `# media player` \
                    seahorse `# manager for ssh and gpg keys` \
                    ffmpeg `# ffmpeg` \
                    youtube-dl `# usefull tool for downloading videos from different platforms` \
                    tmux `# Terminal multiplexer` \
                    sox \
                    dejavu-sans-mono-fonts \
                    wofi \
                    dejavu-serif-fonts  \
                    # move forward! ->
  
#
#   SOME THINGS
#
sleep 3s ; clear ; echo -e "${BLUE}Installing VIM-plug for vim and neovim${NC}" ; sleep 3s
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim # vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' # nvim

echo -e "\n${BLUE}Installing NVM and Deno${NC}" ; sleep 3s
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash # NVM
curl -fsSL https://deno.land/x/install/install.sh | sh # Deno

# echo -e "\n${BLUE}Youtube-dl${NC}" ; sleep 3s
# sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
# sudo chmod a+rx /usr/local/bin/youtube-dl

echo -e "\n${BLUE}cht.sh${NC}" ; sleep 3s
curl https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
chmod +x /usr/local/bin/cht.sh

#
#   SHELL
#
sleep 3s; clear; echo -e "${BLUE}Installing Z shell as default and configure it with OMZ${BLUE}" ; sleep 3s
chsh -s $(which zsh) && sleep 2s 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#
#   DOTFILES
#
echo -e "\n${BLUE}Downloading dotfiles and apply it to packages${NC}" ; sleep 3s
git clone https://github.com/monesonn/dotfiles.git $HOME/dotfiles/
sh $HOME/dotfiles/setup.sh

#
#   END
#
sleep 3s; cat << 'EOF'
 ______________
< All is done! >
 --------------
       \   ,__,
        \  (oo)____
           (__)    )\
              ||--|| *
EOF

read -n 1 -s -r -p ""
