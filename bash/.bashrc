export SSH_AUTH_SOCK="$l(s /run/user/$(id -u $USERNAME)/keyring*/ssh|head -1)" 
export SSH_AGENT_PID="$(pgrep gnome-keyring)"
SSH_ENV="$HOME/.ssh/environment"
# ~/.bashrc: executed by bash(1) for non-login shells.

# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000000
HISTFILESIZE=2000000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias jfu='journalctl -fu '
alias jeu='journalctl -eu '
alias vboxmanage='VBoxManage'

function start_agent {
     echo "Initialising new SSH agent..."
     (umask 066; /usr/bin/ssh-agent > "${SSH_ENV}")
     . "${SSH_ENV}" > /dev/null
     # Add Keys
     ssh-add ~/.ssh/id_rsa
     #
}
# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  } else
    start_agent;
fi

source /usr/share/nvm/init-nvm.sh

pyalsi --logo Below
systemctl --failed | grep ●

running-services

checkpacman() {
  sudo pacman -Sy > /dev/null
  OLD_PACKAGES=`pacman -Qu | grep -v ignored | wc -l`
  if [ "$OLD_PACKAGES" -ne "0" ]; then echo "$OLD_PACKAGES packages out of date"; fi
}

checkpacman

checkBinariesUsingOldLibs() {
  BINARIES=`lsof +c 0 | grep -w DEL | awk '1 { print $1 ": " $NF }' | sort -u`
  if [ `"$BINARIES"` | wc -l` -ne "0"
}
