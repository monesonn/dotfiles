#             __
#    ___ ___ / /  ________
#  _/_ /(_-</ _ \/ __/ __/
# (_)__/___/_//_/_/  \__/

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# load config files
for config (~/.zsh/*.zsh) source $config

# put fortunes at startup
echo "\033[1;34m$(fortune -s)\033[m\n"
