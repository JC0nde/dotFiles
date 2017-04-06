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

# Swap caps lock and ctrl left
setxkbmap -option "ctrl:swapcaps"

# Set Menu button to super R with xmodmap and make ENTER button be a Ctrl Right if pressed with another key with x-cape
xmodmap "$HOME/.Xmodmap"
xcape -e 'Control_R=Return'

# X colors and fonts
xrdb -merge "$HOME/.Xresources"

# Wallpaper
sh "$HOME/.fehbg" &

# No touching keypad while typing
syndaemon -i 0.5 -t -K -R -d

# Numlock on
numlockx &

# hide cursor after some time
unclutter &

# Compton
compton --config "$HOME/.config/compton.conf" -b &

# Load keybindings for bspwm
sxhkd  &

# Execute wm
exec bspwm



