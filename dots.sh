#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# bin
ln -s ${BASEDIR}/bin $HOME/bin

# dunst
ln -s ${BASEDIR}/dunstrc $HOME/.config/dunstrc

# fontconfig
ln -s ${BASEDIR}/fontconfig $HOME/.config/fontconfig

# git
ln -s ${BASEDIR}/gitconfig $HOME/.gitconfig

# gnupg
ln -s ${BASEDIR}/gnupg $HOME/.gnupg

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
ln -s ${BASEDIR}/msmtp-gmail.gpg $HOME/.msmtp-gmail.gpg
ln -s ${BASEDIR}/msmtp-gmail2.gpg $HOME/.msmtp-gmail2.gpg
ln -s ${BASEDIR}/msmtp-gmail3.gpg $HOME/.msmtp-gmail3.gpg
ln -s ${BASEDIR}/msmtp-okubax.gpg $HOME/.msmtp-okubax.gpg
ln -s ${BASEDIR}/msmtp-outlook.gpg $HOME/.msmtp-outlook.gpg
ln -s ${BASEDIR}/msmtp-yahoo.gpg $HOME/.msmtp-yahoo.gpg
ln -s ${BASEDIR}/msmtp-yahoo2.gpg $HOME/.msmtp-yahoo2.gpg

# multitail
ln -s ${BASEDIR}/multitailrc $HOME/.multitailrc

# mutt
ln -s ${BASEDIR}/mutt $HOME/.mutt

# ncmpcpp
ln -s ${BASEDIR}/ncmpcpp $HOME/.ncmpcpp

# offlineimap
ln -s ${BASEDIR}/offlineimap.py $HOME/.offlineimap.py
ln -s ${BASEDIR}/offlineimaprc $HOME/.offlineimaprc

# pass
ln -s ${BASEDIR}/pass $HOME/.password-store

# picom
ln -s ${BASEDIR}/picom $HOME/.config/picom

# ranger
ln -s ${BASEDIR}/ranger $HOME/.config/ranger

# redshift
ln -s ${BASEDIR}/redshift.conf $HOME/.config/redshift.conf

# ssh
ln -s ${BASEDIR}/ssh $HOME/.ssh

# startpage
ln -s ${BASEDIR}/startpage $HOME/.startpage

# todo
ln -s ${BASEDIR}/todo $HOME/.todo

# urlview
ln -s ${BASEDIR}/urlview $HOME/.urlview

# vim
ln -s ${BASEDIR}/vim $HOME/.vim
ln -s ${BASEDIR}/vimrc $HOME/.vimrc

# X
ln -s ${BASEDIR}/Xresources.d/xinitrc $HOME/.xinitrc
ln -s ${BASEDIR}/Xresources.d/Xresources $HOME/.Xresources
ln -s ${BASEDIR}/Xresources.d $HOME/.Xresources.d

# zsh
ln -s ${BASEDIR}/zsh/oh-my-zsh $HOME/.oh-my-zsh
ln -s ${BASEDIR}/zsh/zprofile $HOME/.zprofile
ln -s ${BASEDIR}/zsh/zshrc $HOME/.zshrc
