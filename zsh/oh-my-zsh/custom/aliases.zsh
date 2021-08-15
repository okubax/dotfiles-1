alias cls=' echo -ne "\033c"'       # clear screen for real

## Pacman aliases ## {{{
#if necessary, replace 'pacman' with your favorite AUR helper and adapt the commands accordingly
alias pac="sudo pacman -S"		# default action	- install one or more packages
alias pacy="sudo pacman -Syy"		#			- sync all packages to latest versions
alias pacu="sudo pacman -Syu"		# '[u]pdate'		- upgrade all packages to their newest version
alias pacr="sudo pacman -Rns"		# '[r]emove'		- uninstall one or more packages
alias pacs="pacman -Ss"		# '[s]earch'		- search for a package using one or more keywords
alias paci="pacman -Si"		# '[i]nfo'		- show information about a package
alias paclo="pacman -Qdt"		# '[l]ist [o]rphans'	- list all packages which are orphaned
alias pacc="sudo pacman -Sc"		# '[c]lean cache'	- delete all not currently installed package files
alias paclf="pacman -Ql"		# '[l]ist [f]iles'	- list all files installed by a given package
alias pacof="pacman -Qo"        # 'find which package owns a file'
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rs \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')" # '[r]emove [o]rphans' - recursively remove ALL orphaned packages
#alias pacexpl="/usr/bin/pacman -D --asexp"	# 'mark as [expl]icit'	- mark one or more packages as explicitly installed
#alias pacimpl="/usr/bin/pacman -D --asdep"	# 'mark as [impl]icit'	- mark one or more packages as non explicitly installed
alias paclc="sudo pacman -U" # install local package
#auracle
alias aurs="auracle search"			# find aur packages
alias aurl="pacman -Qm"			# list installed aur packages
alias auru="auracle sync"			# find aur updates
alias aurd="auracle download"   # download packages
# }}}

##

## Systemd ## {{{
#systemlevel
start() { sudo systemctl start "$1"; }
stop() { sudo systemctl stop "$1"; }
restart() { sudo systemctl restart "$1"; }
status() { sudo systemctl status "$1"; }
enabled() { sudo systemctl enable "$1"; listd; }
disabled() { sudo systemctl disable "$1"; listd; }
Start() { sudo systemctl start "$1"; sudo systemctl status "$1"; }
Stop() { sudo systemctl stop "$1"; sudo systemctl status "$1"; }
Restart() { sudo systemctl restart "$1"; sudo systemctl status "$1"; }
#userlevel
ustart() { systemctl --user start "$1"; }
urestart() { systemctl --user restart "$1"; }
ustop() { systemctl --user stop "$1"; }
ustatus() { systemctl --user status "$1"; }
uenabled() { systemctl --user enable "$1"; }
udisabled() { systemctl --user disable "$1"; }
#network
alias rnetw="sudo systemctl restart wpa_supplicant@wlan0"
alias rnetn="sudo systemctl restart systemd-networkd"
alias rnetr="sudo systemctl restart systemd-resolved"
alias snetw="sudo systemctl status wpa_supplicant@wlan0"
alias snetn="sudo systemctl status systemd-networkd"
alias snetr="sudo systemctl status systemd-resolved"
alias vnetw="sudo vim /etc/wpa_supplicant/wpa_supplicant-wlan0.conf"
alias vnetnw="sudo vim /etc/systemd/network/25-wireless.network"
#btrfs
alias subvoll="sudo btrfs subvolume list /mnt"
#crate and backup snapshots
alias snaproot="sudo btrfs subvolume snapshot -r / /.snapshots/root-$(date +%Y%m%d)"
alias ssnaproot="sudo btrfs send /.snapshots/root-$(date +%Y%m%d) | sudo btrfs receive /run/media/ajibola/Snaps"
alias snaphome="sudo btrfs subvolume snapshot -r /home .snapshots/home-$(date +%Y%m%d)"
alias ssnaphome="sudo btrfs send .snapshots/home-$(date +%Y%m%d) | sudo btrfs receive /run/media/ajibola/Snaps"
#samba
alias startsamba="systemctl start smb"
alias stopsamba="systemctl stop smb"
# offlineimap status
alias emailstatus="systemctl --user status offlineimap"
#cups
alias startprint="systemctl start cups.service"
alias stopprint="systemctl stop org.cups.cupsd.service"
#Look for high priority errors in the systemd journal
alias errors="sudo journalctl -b -p4"
listd() {
  echo -e "${BLD}${RED} --> SYSTEM LEVEL <--${NRM}"
  find /etc/systemd/system -mindepth 1 -type d | sed '/getty.target/d' | xargs ls -gG --color
#  [[ -d "$HOME"/.config/systemd/user/default.target.wants ]] &&
    (echo -e "${BLD}${RED} --> USER LEVEL <--${NRM}" ; \
    find "$HOME"/.config/systemd/user -mindepth 1 -type d | xargs ls -gG --color)
}
#journalctl
getlog() { local file=~/logs/system/log-$(date +%Y%m%d-%H:%M).txt; sudo journalctl -b | grep --line-buffered -v "offimap"> "$file" && vim "$file"; }
alias watchlog="journalctl -f -b"
# }}}

##

## System ## {{{
#wifi scan
alias wifiscan="sudo wpa_cli -i wlan0 scan && sleep 3 && sudo wpa_cli -i wlan0 scan_results"
#battery
alias bat="upower --show-info /org/freedesktop/UPower/devices/battery_BAT0"
alias batr="upower --show-info /org/freedesktop/UPower/devices/battery_BAT0 | grep "time""
#disk usage
alias dfy="pydf"
alias du="ncdu"
#processes
alias ps="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
#net_monitor
alias whichport="sudo netstat -tulpn"
alias netmon="netstat -nputwc"
alias wifo="sudo iftop -i wlan0"
alias whichnet="sudo nettop --tcp-udp-split --limit-hosts-rows 20"
alias bandw="sudo bandwhich"
#find stuff
alias find="fd"
#xampp
alias starth="sudo /opt/lampp/lampp start"
alias stoph="sudo /opt/lampp/lampp stop"
#elevated
alias nanos="sudo nano"
alias vims="sudo vim"
alias cats="sudo cat"
#ccache
export USE_CCACHE=1
#dmesg via journalctl
alias dmesg="journalctl -ko short-monotonic --no-hostname"
# }}}

##

## Media ## {{{
#mplayer
alias play="mplayer -msgcolor -msgmodule"
alias playcd="mplayer cdda://"
#alias playcd="mplayer -cdrom-device /dev/sr0 cdda://"
#alias playdvd="mplayer dvd://"
alias playdvd="mplayer -mouse-movements dvdnav://"
alias playvcd="mplayer vcd://2"
alias takepic="mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 15 -vf screenshot"
#webcam video capture
#alias webcam="mencoder tv:// -tv driver=v4l2:width=800:height=600:device=/dev/video0:fps=30:outfmt=yuy2:forceaudio:alsa:adevice=hw.0,0 -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=1800 -ffourcc xvid -oac mp3lame -lameopts cbr=128 -o output.avi"
alias webcam="ffmpeg -f alsa -i default -f v4l2 -s 640x480 -i /dev/video0 -acodec flac -vcodec libx264 output.mkv"
#youtube-dl/mp4
alias ytd="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
alias ytdm="youtube-dl -x --audio-format mp3"
alias spotify="spotify --force-device-scale-factor=2"
# }}}

##

## Misc ## {{{
# python server
alias pyserv="python -m http.server 6677"
#gen_rand_password
alias genpass="cat /dev/urandom | tr -dc 'a-zA-Z0-9-_!@#$%^&*()_+{}|:<>?=' | fold -w 15 | grep -i '[!@#$%^&*()_+{}|:<>?=]' | head -n 1"
alias genpass6="cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 6 | head -n 1"

#quickies
alias vxres="vim ~/.Xresources"
alias valias="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias vi3="vim ~/.config/i3/config"
alias vbar="vim ~/bin/bar"
alias vmutt="vim ~/.mutt/muttrc"
alias vpaclog="vim /var/log/pacman.log"
alias makex="chmod +x"
alias gith="cd $HOME/git"
alias chatfn="cd $HOME/irc/lb/127.0.0.1 && exec vim"
alias chatsn="cd $HOME/irc/sn/127.0.0.1 && exec vim"

alias heyg="tuxi"

#fix permissions
fix() {
  [[ -d "$1" ]] &&
  find "$1" -type d -print0 | xargs -0 chmod 755 && find "$1" -type f -print0 | xargs -0 chmod 644 ||
    echo "$1 is not a directory."
}
#mpv|youtube-dl
function w {
    mpv $(youtube-dl -f best -g $1) # best usually fetches h264 encoded video which is H/W accelerated on older platforms
}
#todo
source ~/bin/todo_completion
export TODOTXT_DEFAULT_ACTION=ls
alias t='todo.sh -d ~/.todo/todo.cfg'
#complete -F _todo t

#pip_user_commands
alias pipl="pip list --format=columns"
alias pipi="pip install"
alias pipo="pip list --outdated"
alias pipup="pip install --upgrade"
alias pipun="pip-autoremove -y"
alias pips="pip search"
#npm
alias npml="npm -g list --depth=0"
alias npmi="npm -g install"
alias npmo="npm outdated -g"
alias npmup="npm update -g"
alias npmun="npm -g uninstall"
alias npms="npm search"
#xpropm
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'
#udisksctl
alias iomul="udisksctl unlock -b /dev/sda1"
alias iomm="udisksctl mount -b /dev/mapper/luks-d"
alias iomum="udisksctl unmount -b /dev/mapper/luks-d"
alias ioml="udisksctl lock -b /dev/sda1"
alias extm="udisksctl mount -b /dev/sda1"
alias extum="udisksctl unmount -b /dev/sda1"
alias sda1m="udisksctl mount -b /dev/sda1"
alias sda1um="udisksctl unmount -b /dev/sda1"
alias sda2m="udisksctl mount -b /dev/sda2"
alias sda2um="udisksctl unmount -b /dev/sda2"
alias sda3m="udisksctl mount -b /dev/sda3"
alias sda3um="udisksctl unmount -b /dev/sda3"
alias sdb1m="udisksctl mount -b /dev/sdb1"
alias sdb1um="udisksctl unmount -b /dev/sdb1"
alias sdb2m="udisksctl mount -b /dev/sdb2"
alias sdb2um="udisksctl unmount -b /dev/sdb2"
alias sdb3m="udisksctl mount -b /dev/sdb3"
alias sdb3um="udisksctl unmount -b /dev/sdb3"
alias sdcardm="udisksctl mount -b /dev/mmcblk0p1"
alias sdcardum="udisksctl unmount -b /dev/mmcblk0p1"
alias pcinfo="inxi -v6 -c2"
alias histg="history | grep"
alias myip="curl http://ipecho.net/plain; echo"
alias myipl="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

alias 75='7z a -r -t7z -m0=lzma2 -mx=9 -myx=9 -mqs=on -ms=on'

alias j="bundle exec jekyll"

calc() {
        echo "scale=3;$@" | bc -l
}

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.apk|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *.zpaq)      zpaq x ./"$n"      ;;
            *.arc)         arc e ./"$n"       ;;
            *.cso)       ciso 0 ./"$n" ./"$n.iso" && \
                              extract $n.iso && \rm -f $n ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}
# }}}

export PATH=${PATH}:$HOME/bin/:$HOME/development/android/sdk/tools/bin/:$HOME/.gem/ruby/3.0.0/bin/:$HOME/.gem/bin/:$HOME/.npm-global/bin/:$HOME/.firefox/
export PATH=${PATH}:$HOME/git/auracle/build/:$HOME/git/ii/:$HOME/git/st/:$HOME/git/nettop/:$HOME/git/2048.c/:$HOME/git/tuxi/
export PATH=${PATH}:$HOME/development/android/sdk/platform-tools/:$HOME/development/android/sdk/tools/:$HOME/machines/qemu-scripts/
export PATH=${PATH}:$HOME/IDE/idea/bin
export PATH=${PATH}:$HOME/venv/pelican/bin/:$HOME/venv/ytdl/bin/:$HOME/venv/borg/bin/:$HOME/venv/bpytop/bin/:$HOME/venv/vizex/bin/
export ANDROID_HOME=$HOME/development/android/sdk
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Djdk.gtk.version=3'
_SILENT_JAVA_OPTIONS="$_JAVA_OPTIONS"
unset _JAVA_OPTIONS
alias java='java -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

export GEM_HOME=$HOME/.gem
export QEMU_AUDIO_DRV=pa
export QT_QPA_PLATFORMTHEME="qt5ct"
export TERMCMD="st"
export R_HISTFILE=~/.Rhistory
export BROWSER=firefox
export EDITOR=vim
# }}}
