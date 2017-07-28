#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xset s 120 &
xset b off &
unclutter &
dunst &
xss-lock -- i3lock -i $HOME/.Xresources.d/lock.png &
dropbox &
anamnesis --start &
mpd &
mpdscribble &
xrandr --dpi 120 &
redshift &
#compton --config /dev/null &

udiskie &

xrdb -merge "${HOME}/.Xresources"
wal -i "$(< "${HOME}/.cache/wal/wal")" -o wal-set


exec i3
#exec i3 -V -d all >> ~/logs/i3/i3log-$(date +'%F-%k-%M-%S') 2>&1
#exec i3 -V >> ~/logs/i3/i3log-$(date +'%F-%k-%M-%S') 2>&1