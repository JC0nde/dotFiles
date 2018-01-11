#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias emacs='emacsclient -a "" -c'
alias ls='ls --color=auto'

neofetch

#PS1='[\u@\h \W]\$ '

export HISTCONTROL=ignoreboth:erasedups

my_t="[\e[1;33m\t\e[01;37m]"
my_u="[\[\e[1;34m\u\e[01;37m\]]"
my_h="[\[\e[00;37m\]${HOSTNAME%%.*}\[\e[01;37m\]]"
my_w="$\[\e[01;31m\]\w\[\e[01;37m\]"
my_n="$\[\e[01;31m\]\n\[\e[01;37m\]"
export PS1="\[\e[01;37m\]┌─${my_t}──${my_u}──${my_h}:${my_w}${my_n}└──\[\e[01;37m\]>>\[\e[0m\]"
