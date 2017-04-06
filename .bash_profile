#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx
fi


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.4/bin:$PATH"
