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

sh ~/.fehbg &
xrdb ~/.Xressources &
numlockx &
unclutter &
sxhkd &
(sleep 2s  && /usr/bin/setxkbmap -option "ctrl:swapcaps" &&  /usr/bin/xmodmap /home/$USER/.Xmodmap && xcape -t 10000 -e 'Control_R=Return') &  # switches CAPSLOCK and Ctrl and sets up xcape ->CtrlR/Enter

exec bspwm

