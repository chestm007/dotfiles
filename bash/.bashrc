#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '
BROWSER=/usr/bin/google-chrome-stable
EDITOR=vim
source ~/.liquidprompt/liquidprompt
exec zsh
export ICADMIN_ROOT_DIR='/home/max/git/icadmin/icadmin'
