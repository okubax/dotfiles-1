# Dotfiles

dotfiles for my i3 + lemonbar setup on ArchLinux

I use this configuration for my laptop which runs **[i3-gaps window manager](https://github.com/Airblader/i3)** (a fork of i3) on
**[Arch Linux](https://www.archlinux.org/)**.
Ideas mostly <del>stolen</del> copied from others and modified to fit my use, I have acknowledged some but if I'm using parts or all of your config, **THANKS!**.

## Dependencies

*Note: I hope I've covered all dependencies here, but something might be missing*

This setup is intended for **[i3-gaps](https://github.com/Airblader/i3)** by Airblader. I haven't tested it with regular i3-- you'll probably have to make a few changes if you want to use that. Only tested on ArchLinux-- I can't make any guarantees about its compatibility with other distros.

* `conky` -- Lightweight system monitor for X (for dropbox and todo-cli dislays)
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
* `ranger` -- A simple, vim-like file manager
* `Siji Icon Font` -- Iconic bitmap font, used in `lemonbar` | [aur link](https://aur.archlinux.org/packages/siji-git/)
* `terminus-font` -- Monospace bitmap font (for lemonbar)
* `tewi-font` -- Bitmap font (for X11 and console)  | [link](https://github.com/lucy/tewi-font)
* `vim` -- Vi Improved, a highly configurable, improved version of the vi text editor
* `xdotool` -- Command-line X11 automation tool, to show current window title on `lemonbar`
* <del>`xsetroot` -- to set the wallpaper</del>
* `weechat` -- Fast, light and extensible IRC client
* `wmctrl` -- 	A Tool to control your EWMH compliant window manager from command line (for i3 workspaces on `lemonbar`)



## General

1. First, install the dependencies listed in the section above.

2. `bin/` contains custom scripts. Add them to your `$PATH` and ensure that they are executable. 

3. My default shell is zsh and I use the [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) framework to manage my zsh configuration.

4. You need to have [gnupg](https://www.archlinux.org/packages/core/x86_64/gnupg/) installed and configured properly for [pass](https://www.archlinux.org/packages/community/any/pass/) to work.

5. In the lemonbar [config](/i3/bar/bar.sh), the battery section uses `BAT1`, change to `BAT0` for your config if your laptop only has one battery.

6. Terminal [colorschemes](/Xresources.d/colors), [bitmap](/Xresources.d/tile.xbm) used for the wallpaper, and the [script](/Xresources.d/random-color-picker) that is used to load a random color & wallpaper at each wm-start is the work of [dkeg](https://github.com/dkeg/crayolo).



### Installation

```
git clone https://github.com/okubax/dotfiles.git
cd dotfiles
./dots.sh

```


### Wallpaper

<del>Wallpaper is set by the [random-color-picker](/Xresources.d/random-color-picker) script in the [Xresources.d](/Xresources.d) folder, if you don't want this, remove the script (you will have to manually set a color scheme for your terminal manually as this scipt handles that. Or rather, comment out the relevant(setwall) part of the script.</del>

[Wallpaper](http://nanomortis.deviantart.com/art/Deep-Field-509565352) by [NanoMortis](http://nanomortis.deviantart.com/) on [DeviantArt](http://www.deviantart.com)



### Screenshots

[color palette in use](/Xresources.d/colors/provrb)
![Screenshot](/screenshot.png)

[color palette in use](/Xresources.d/colors/harbing)
![Screenshot2](/screenshot2.png)

&nbsp;

&nbsp;

&nbsp;



*README inspiration from [CopperBadger](https://github.com/CopperBadger/dotfiles)*
