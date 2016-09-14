#!/bin/bash

# jhallard September 2015
# https://github.com/jhallard

if [ "$#" -gt 1 ]; then
    if [ "$1" -eq "--name" ]; then
        WP_FILE=$2
        if [ -a $WP_FILE ]; then
            echo $WALLPAPERS/$WP_FILE > .config/wallpaper    
        fi
    else
        NUM=$1
        echo $WALLPAPERS/$(ls -l $WALLPAPERS | awk '{print $9}' | head -n$NUM | tail -n1) > $HOME/.config/wallpaper
    fi
else 
    NUM=$RANDOM
    let "NUM %= $(ls -l $WALLPAPERS/ | grep -v ^l | wc -l)"
    echo $WALLPAPERS/$(ls -l $WALLPAPERS | awk '{print $9}' | head -n$NUM | tail -n1) > $HOME/.config/wallpaper
fi

feh --bg-fill $(cat $HOME/.config/wallpaper)
