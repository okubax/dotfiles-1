#!/bin/sh

# Import the colors
. "${HOME}/.cache/wal/colors.sh"

j4-dmenu-desktop --term urxvt --display-binar --dmenu "dmenu -b  -sb '$color1' -sf '$color15' -nb '$color0' -nf '$color15' -fn 'inconsolata-8'"
