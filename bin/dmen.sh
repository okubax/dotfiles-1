#!/bin/sh

# Import the colors
	. "${HOME}/.Xresources.d/colors/nord/nord.sh"

j4-dmenu-desktop --term urxvt --display-binar --dmenu "dmenu -b  -sb '$color8' -sf '$color0' -nb '$color0' -nf '$color4' -fn 'cascadia code-7'"
