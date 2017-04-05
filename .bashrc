#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

alias ls='ls --color=auto'
# alias emacs='emacsclient -a "" -c'
PS1='[\u@\h \W]\\$'
