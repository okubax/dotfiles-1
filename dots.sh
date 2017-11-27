#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# bin
ln -s ${BASEDIR}/bin $HOME/bin

# compton
ln -s ${BASEDIR}/compton.conf $HOME/.config/compton.conf

# dunst
ln -s ${BASEDIR}/dunstrc $HOME/.config/dunstrc

# feh
ln -s ${BASEDIR}/fehbg $HOME/.fehbg

# fontconfig
ln -s ${BASEDIR}/fontconfig $HOME/.config/fontconfig

# goobook
ln -s ${BASEDIR}/goobookrc $HOME/.goobookrc

# i3
ln -s ${BASEDIR}/i3 $HOME/.config/i3

# mpd
ln -s ${BASEDIR}/mpd $HOME/.mpd

# mpdscribble
ln -s ${BASEDIR}/mpdscribble $HOME/.mpdscribble

# mplayer
ln -s ${BASEDIR}/mplayer $HOME/.mplayer

# msmtp
ln -s ${BASEDIR}/msmtprc $HOME/.msmtprc

# mutt
ln -s ${BASEDIR}/mutt $HOME/.mutt

# ncmpcpp
ln -s ${BASEDIR}/ncmpcpp $HOME/.ncmpcpp

# offlineimap
ln -s ${BASEDIR}/offlineimap.py $HOME/.offlineimap.py
ln -s ${BASEDIR}/offlineimaprc $HOME/.offlineimaprc

# pass
ln -s ${BASEDIR}/pass $HOME/.password-store

# ranger
ln -s ${BASEDIR}/ranger $HOME/.config/ranger

# redshift
ln -s ${BASEDIR}/redshift.conf $HOME/.config/redshift.conf

# startpage
ln -s ${BASEDIR}/startpage $HOME/.startpage

# todo
ln -s ${BASEDIR}/todo $HOME/.todo

# urlview
ln -s ${BASEDIR}/urlview $HOME/.urlview

# vim
ln -s ${BASEDIR}/vimrc $HOME/.vimrc
ln -s ${BASEDIR}/vim/ $HOME/.vim

# wallpapers
ln -s ${BASEDIR}/Xresources.d/wallpapers $HOME/.wallpapers

# weechat
ln -s ${BASEDIR}/weechat $HOME/.weechat

# X
ln -s ${BASEDIR}/Xresources.d/xinitrc $HOME/.xinitrc
ln -s ${BASEDIR}/Xresources.d/Xresources $HOME/.Xresources
ln -s ${BASEDIR}/Xresources.d $HOME/.Xresources.d

# zsh
ln -s ${BASEDIR}/zsh/oh-my-zsh $HOME/.oh-my-zsh
ln -s ${BASEDIR}/zsh/zprofile $HOME/.zprofile
ln -s ${BASEDIR}/zsh/zshrc $HOME/.zshrc

