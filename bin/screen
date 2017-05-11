#!/bin/bash

SCREEN_DIR=~/Dropbox/Screenshots/
SCREEN_PROMPT=1

window='root'

case $1 in
  root)
    window='root';;
  active)
    window=`xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)" | cut -d' ' -f5`;;
esac

#[ ! -z "$SCREEN_PROMPT" ] && \
#  name=`i3-input -P 'screen-name: ' | sed -n '/command = /s/command = //p'`

if [ -z "$name" ];then
  if [ $window == "root" ];then
    name='root'
  else
    name=`xprop -id $window | sed -n '/WM_CLASS/s/.* = "\([^\"]*\)".*/\1\n/p'`
    [ -z "$name" ] && name='window'
  fi
fi

filename="$name-`date +%Y-%m-%d_%H-%M-%S`.png"

import -border -window $window "$SCREEN_DIR/$filename"


ln -sf "$filename" $SCREEN_DIR/last

exit
