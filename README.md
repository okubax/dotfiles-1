# Dotfiles

dotfiles for my i3 + lemonbar setup on ArchLinux

I use this configuration for my laptop which runs **[i3-gaps window manager](https://github.com/Airblader/i3)** (a fork of i3) on
**[Arch Linux](https://www.archlinux.org/)**.
Ideas mostly <del>stolen</del> copied from others and modified to fit my use, I have acknowledged some but if I'm using parts or all of your config, **THANKS!**.

## Dependencies

*Note: I hope I've covered all dependencies here, but something might be missing*

This setup is intended for **[i3-gaps](https://github.com/Airblader/i3)** by Airblader. I haven't tested it with regular i3-- you'll probably have to make a few changes if you want to use that. Only tested on ArchLinux-- I can't make any guarantees about its compatibility with other distros.

* `conky` -- Lightweight system monitor for X (for dropbox and todo-cli displays)
* `dropbox-cli` -- Command line interface for dropbox
* `feh` -- to set the wallpaper
* `iw` -- nl80211 based CLI configuration utility for wireless devices, to get wifi's SSID
* `lemonbar` -- A featherweight, lemon-scented, bar based on xcb
* `mpc` -- Client for `mpd`, responsible for telling lemonbar about the currently playing media.
* `mpd` -- Flexible, powerful, server-side application for playing music with `ncmpcpp` as client
* `mutt` -- Small but very powerful text-based mail client
* `msmtp` -- A mini smtp client
* `offlineimap` -- Synchronizes emails between two repositories
* `pass` -- Stores, retrieves, generates, and synchronizes passwords securely
* `playerctl` -- mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others  
* `ranger` -- A simple, vim-like file manager
* `Font Awesome` -- Iconic font designed for Bootstrap, used in `lemonbar` | [aur link](https://aur.archlinux.org/packages/ttf-font-awesome)
* `fira-mono` -- Mozilla's monospace typeface (for lemonbar, X11, and console)
* `vim` -- Vi Improved, a highly configurable, improved version of the vi text editor
* `xdotool` -- Command-line X11 automation tool, to show current window title on `lemonbar`
* `weechat` -- Fast, light and extensible IRC client
* `wmctrl` -- 	A Tool to control your EWMH compliant window manager from command line (for i3 workspaces on `lemonbar`)



## General

1. First, install the dependencies listed in the section above.

2. `bin/` contains custom scripts. Add them to your `$PATH` and ensure that they are executable. 

3. My default shell is zsh and I use the [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) framework to manage my zsh configuration.

4. You need to have [gnupg](https://www.archlinux.org/packages/core/x86_64/gnupg/) installed and configured properly for [pass](https://www.archlinux.org/packages/community/any/pass/) to work.

5. [Colorscheme](/Xresources.d/colors/nord) is from [articiestudio](https://github.com/arcticicestudio/nord).


### Installation

```
git clone https://github.com/okubax/dotfiles.git
cd dotfiles
./dots.sh

```


### Screenshot

clean desktop with dmenu
![screen1](/screenshot.png)

busy (ncmpcpp,vim,weechat)
![screen2](/screenshot2.png)

Lockscreen (i3lock)
![lockscreen](/screenshot3.png)


[Wallpaper](/nord.png)  
[Lockscreen Image](/lock.png)


&nbsp;
