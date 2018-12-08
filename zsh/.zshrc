HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
USERNAME="max"
LOGIN=${USER}
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
SSH_ENV="$HOME/.ssh/environment"
setopt inc_append_history
setopt share_history
zstyle :compinstall filename '/home/alex/.zshrc'
zstyle ':completion*' menu select
setopt COMPLETE_ALIASES
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
autoload -Uz promptinit

EDITOR=vim

eval `gnome-keyring-daemon --start`

# Exports
#
export SSH_AUTH_SOCK="$(ls /run/user/$(id -u $USERNAME)/keyring*/ssh|head -1)"
export SSH_AGENT_PID="$(pgrep gnome-keyring)"
export APP_REPO_DIR='/home/max/git/app'
export ICADMIN_ROOT_DIR='/home/max/git/icadmin/icadmin'


# Key Bindings
#
# Use vim in zsh OMG VIM!!! YAYAYAYAYAYAYAAAAAAa
#bindkey -v

bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word
bindkey '^[[A' up-line-or-search                                                
bindkey '^[[B' down-line-or-search
bindkey "\e[3~" delete-char

# 
# VIM-ZSH (see what i did there :O
#
#export KEYTIMEOUT=1
#
# Start SSH Agent if not running

#   Broken, needs work
###################
# ssh-add -l &>/dev/null
# if [ "$?" == 2 ]; then
#   test -r ~/.ssh-agent && \
#     eval "$(<~/.ssh-agent)" >/dev/null
# 
#   ssh-add -l &>/dev/null
#   if [ "$?" == 2 ]; then
#     (umask 066; ssh-agent > ~/.ssh-agent)
#     eval "$(<~/.ssh-agent)" >/dev/null
#     ssh-add
#   fi
# fi

function start_agent {
    echo "Initialising new SSH agent..."
    (umask 066; /usr/bin/ssh-agent > "${SSH_ENV}")
    . "${SSH_ENV}" > /dev/null
    # Add Keys
    #
    .ssh/add_id_rsa > /dev/null
    .ssh/add_jb_rsa > /dev/null
    .ssh/add_keys > /dev/null
    .ssh/add_instaclustr.sh >> /dev/null
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi


# Aliases
#
alias jfu='journalctl -fu '
alias jeu='journalctl -eu '
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ll -a'
alias python=/usr/bin/python2
alias python3=/usr/bin/python3
alias pip=/usr/bin/pip2
alias pip3=/usr/bin/pip3

# Functions
#
function raf(){
    systemctl restart $1;
    journalctl -fu $1;
}

powerline-daemon -q                                                    
. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

# System Info
#
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules
. ~/git/icadmin/autocomplete.sh
pyalsi --logo Below -l
source /usr/share/nvm/init-nvm.sh
systemctl --failed | grep ● --color

running-services

checkpacman() {
  sudo pacman -Sy > /dev/null
  OLD_PACKAGES=`pacman -Qu | grep -v ignored | wc -l`
  if [ "$OLD_PACKAGES" -ne "0" ]; then echo "$OLD_PACKAGES packages out of date"; fi
}

checkpacman

checkBinariesUsingOldLibs() {
  BINARIES=`lsof +c 0 | grep -w DEL | awk '1 { print $1 ": " $NF }' | sort -u`
  if [ `echo "$BINARIES" | wc -l` -ne "0" ]; then echo "running out of date binaries \n $BINARIES";fi
}

checkBinariesUsingOldLibs
