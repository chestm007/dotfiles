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

autoload -Uz compinit
compinit

eval `gnome-keyring-daemon --start`

# Exports
#
export SSH_AUTH_SOCK="$(ls /run/user/$(id -u $USERNAME)/keyring*/ssh|head -1)"
export SSH_AGENT_PID="$(pgrep gnome-keyring)"
export APP_REPO_DIR='/home/max/git/app'
export ICADMIN_ROOT_DIR='/home/max/git/icadmin/icadmin'

source /usr/share/zsh/site-contrib/powerline.zsh

# Key Bindings
#
bindkey -e
bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word
bindkey '^[[A' up-line-or-search                                                
bindkey '^[[B' down-line-or-search
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "\e[3~" delete-char

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

# Functions
#
function raf(){
    systemctl restart $1;
    journalctl -fu $1;
}

# System Info
#
pyalsi --logo Below -l
systemctl --failed | grep ● --color
