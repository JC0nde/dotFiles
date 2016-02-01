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

if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

sh ~/.fehbg &
xrdb ~/.Xressources &
numlockx &
unclutter &
sxhkd &

exec bspwm
