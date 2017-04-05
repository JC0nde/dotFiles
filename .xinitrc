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
compton --config "~/.config/compton.conf" -b &
# [ ! -s ~/.config/mpd/pid ] && mpd /home/jonathan/.comfig/mpd/mpd.conf &
xrdb ~/.Xresources &
syndaemon -i 0.5 -t -K -R -d
numlockx &
unclutter &
sxhkd &
(sleep 2s  && /usr/bin/setxkbmap -option "ctrl:swapcaps" &&  /usr/bin/xmodmap /home/$USER/.Xmodmap && xcape -t 10000 -e 'Control_R=Return') &  # switches CAPSLOCK and Ctrl and sets up xcape ->CtrlR/Enter

exec bspwm


