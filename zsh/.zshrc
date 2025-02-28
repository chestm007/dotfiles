HISTFILE=~/.histfile
HISTSIZE=100000000000
SAVEHIST=100000000000
USERNAME="max"
LOGIN=${USER}
# custom scripts path
PATH="/home/max/.local/bin:$PATH"
# ruby path
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
SSH_ENV="$HOME/.ssh/environment"
setopt inc_append_history
setopt share_history
zstyle :compinstall filename '/home/max/.zshrc'
zstyle ':completion*' menu select
setopt COMPLETE_ALIASES
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
autoload -Uz promptinit
bindkey -e

EDITOR=nvim

eval `gnome-keyring-daemon --start`

# Exports
export SSH_AUTH_SOCK="$(ls /run/user/$(id -u $USERNAME)/keyring*/ssh|head -1)"
export SSH_AGENT_PID="$(pgrep gnome-keyring)"
export KEYTIMEOUT=1


# Key Bindings
#bindkey ';5D' emacs-backward-word
#bindkey ';5C' emacs-forward-word
#bindkey '^[[A' up-line-or-search                                                
#bindkey '^[[B' down-line-or-search
#bindkey "^[[H" beginning-of-line
#bindkey "^[[F" end-of-line
#bindkey "\e[3~" delete-char

function start_agent {
    echo "Initialising new SSH agent..."
    (umask 066; /usr/bin/ssh-agent > "${SSH_ENV}")
    . "${SSH_ENV}" > /dev/null
    # Add Keys
    #
    .ssh/add_id_rsa > /dev/null
    .ssh/add_keys > /dev/null
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
alias extern="xrandr --output eDP1 --off --output DP2 --auto"
alias intern="xrandr --output eDP1 --auto --output DP2 --off"
alias vim=/bin/nvim

# Functions
#
function raf(){
    systemctl restart $1;
    journalctl -fu $1;
}

. /usr/lib/python3.13/site-packages/powerline/bindings/zsh/powerline.zsh
# System Info
#
#pyalsi --logo Below -l -d Arch
systemctl --failed | grep ● --color

alias build_screeps="rm -r /home/max/.config/Screeps/scripts/192_168_1_2___21025/default; mkdir /home/max/.config/Screeps/scripts/192_168_1_2___21025/default; cp ~/git/screeps-starter-python/dist/main.js /home/max/.config/Screeps/scripts/192_168_1_2___21025/default/main.js; chmod a+x /home/max/.config/Screeps/scripts/192_168_1_2___21025/default/main.js"

source ~/.profile
