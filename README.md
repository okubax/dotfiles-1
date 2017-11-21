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
* `hsetroot` --  A tool which allows you to compose wallpapers for X | [aur link](https://aur.archlinux.org/packages/hsetroot)
* `j4-dmenu-desktop` -- A much faster replacement for i3-dmenu-desktop
* `lemonbar` -- A featherweight, lemon-scented, bar based on xcb | [aur link](https://aur.archlinux.org/packages/lemonbar-git/)
* `mpc` -- Client for `mpd`, responsible for telling lemonbar about the currently playing media.
* `mpd` -- Flexible, powerful, server-side application for playing music with `ncmpcpp` as client
* `msmtp` -- A mini smtp client
* `mutt` -- Small but very powerful text-based mail client
* `offlineimap` -- Synchronizes emails between two repositories
* `pass` -- Stores, retrieves, generates, and synchronizes passwords securely
* `playerctl` -- mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others
* `ranger` -- A simple, vim-like file manager
* `redshift` -- Adjusts the color temperature of your screen according to your surroundings
* `vim` -- Vi Improved, a highly configurable, improved version of the vi text editor
* `weechat` -- Fast, light and extensible IRC client (curses UI)
* `wmctrl` -- A Tool to control your EWMH compliant window manager from command line (for i3 workspaces on `lemonbar`)
* `xdotool` -- Command-line X11 automation tool, to show current window title on `lemonbar`
### ~/.fonts
* `Mononoki` -- A font for programming and code review (console) | [aur link](https://aur.archlinux.org/packages/ttf-mononoki-git/)
* `Lemon Font` -- Lemon and Uushi fonts by phallus (lemonbar) | [aur link](https://aur.archlinux.org/packages/phallus-fonts-git)
* `Siji Font` -- Iconic bitmap font based on stlarch with additional glyphs (lemonbar) | [aur link](https://aur.archlinux.org/packages/siji-git)


## Housekeeping
1. First, install the dependencies listed in the section above.

2. `bin/` contains custom scripts. Add them to your `$PATH` and ensure that they are executable.

3. My default shell is zsh and I use the [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) framework to manage my zsh configuration.

4. You need to have [gnupg](https://www.archlinux.org/packages/core/x86_64/gnupg/) installed and configured properly for [pass](https://www.archlinux.org/packages/community/any/pass/) to work.

5. Xresources colors are generated using [pywal](https://github.com/dylanaraps/pywal)

6. Using [xero's hashwall script](https://github.com/xero/dotfiles/blob/master/bin/bin/hashwall) to generate and set wallpaper

### Installation
```
git clone https://github.com/okubax/dotfiles.git
cd dotfiles
./dots.sh

```

### Screenshot
![screenshot](/screenshot.png)

&nbsp;