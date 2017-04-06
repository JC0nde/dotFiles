#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="___________________    | \w @ \h (\u) \n| => "
export PS2="| => "

export HISTCONTROL=ignoreboth:erasedups

alias ls='ls --color=auto'
# alias emacs='emacsclient -a "" -c'
