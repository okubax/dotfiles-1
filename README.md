# Dotfiles

dotfiles for my i3 + lemonbar setup on ArchLinux

I use this configuration for my laptop which runs **[i3 window manager](https://i3wm.org)** on
**[Arch Linux](https://www.archlinux.org/)**.
Ideas mostly <del>stolen</del> copied from others and modified to fit my use, I have acknowledged some but if I'm using parts or all of your config, **THANKS!**.

## Dependencies
*Note: I hope I've covered all dependencies here, but something might be missing*

This setup is intended for regular [i3](https://i3wm.org), I haven't tested it with **[i3-gaps](https://github.com/Airblader/i3)** by Airblader so you'll probably have to make a few changes if you want to use that. Only tested on ArchLinux-- I can't make any guarantees about its compatibility with other distros.

* `pamixer` -- Pulseaudio command-line mixer like amixer
* `clipmenu` -- Clipboard management using dmenu
* `conky` -- Lightweight system monitor for X (for dropbox and todo-cli displays)
* `dropbox-cli` -- Command line interface for dropbox
* `hsetroot` --  A tool which allows you to compose wallpapers for X | [aur link](https://aur.archlinux.org/packages/hsetroot)
* `ii` -- A minimalist FIFO and filesystem-based IRC client, from [suckless](https://tools.suckless.org/ii/)
* `j4-dmenu-desktop` -- A much faster replacement for i3-dmenu-desktop
* `lemonbar` -- A featherweight, lemon-scented, bar based on xcb | [aur link](https://aur.archlinux.org/packages/lemonbar-git/)
* `mpc` -- Client for `mpd`, responsible for telling lemonbar about the currently playing media.
* `mpd` -- Flexible, powerful, server-side application for playing music with `ncmpcpp` as client
* `msmtp` -- A mini smtp client
* `mutt` -- Small but very powerful text-based mail client
* `offlineimap` -- Synchronizes emails between two repositories
* `pass` -- Stores, retrieves, generates, and synchronizes passwords securely
* `playerctl` -- mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others
* `st terminal` -- a simple terminal implementation for X, from [suckless](https://st.suckless.org/) with added [patches](https://github.com/okubax/st)
* `ranger` -- A simple, vim-like file manager
* `redshift` -- Adjusts the color temperature of your screen according to your surroundings
* `vim` -- Vi Improved, a highly configurable, improved version of the vi text editor
* `wmctrl` -- A Tool to control your EWMH compliant window manager from command line (for i3 workspaces on `lemonbar`)
* `xdotool` -- Command-line X11 automation tool, to show current window title on `lemonbar`
### ~/.fonts
* `Cascadia Code` -- A monospaced font by Microsoft that includes programming ligatures
* `Font Awesome` -- Iconic font designed for Bootstrap


## Housekeeping
1. First, install the dependencies listed in the section above.

2. `bin/` contains custom scripts. Add them to your `$PATH` and ensure that they are executable.

3. My default shell is zsh and I use the [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) framework to manage my zsh configuration.

4. You need to have [gnupg](https://www.archlinux.org/packages/core/x86_64/gnupg/) installed and configured properly for [pass](https://www.archlinux.org/packages/community/any/pass/) to work.

5. Using [Nord](https://github.com/arcticicestudio/nord) for Xresources and terminal colors

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
