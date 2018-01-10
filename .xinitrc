#!/bin/sh
#
# ~/.xinitrc
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

# Swap caps lock and ctrl left
setxkbmap -option "ctrl:swapcaps"

# Set Menu button to super R with xmodmap and make ENTER button be a Ctrl Right if pressed with another key with x-cape
xmodmap "$HOME/.Xmodmap"
xcape -e 'Control_R=Return'
xcape -e 'Control_L=Escape'

# X colors and fonts
xrdb "$HOME/.Xresources"

# Wallpaper
sh "$HOME/.fehbg" &

# Numlock on
numlockx &

# notification daemon
dunst &

# compositors are blot
compton -c --shadow-exclude-reg x28+0-0 &

# hide cursor after some time
unclutter &

# Execute wm
exec bspwm
