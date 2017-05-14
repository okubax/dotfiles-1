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
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rs \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')" # '[r]emove [o]rphans' - recursively remove ALL orphaned packages
#alias pacexpl="/usr/bin/pacman -D --asexp"	# 'mark as [expl]icit'	- mark one or more packages as explicitly installed
#alias pacimpl="/usr/bin/pacman -D --asdep"	# 'mark as [impl]icit'	- mark one or more packages as non explicitly installed
alias paclc="sudo pacman -U" # install local package
#cower
alias cows="cower -s"			# find aur packages
alias cowl="pacman -Qm"			# list installed aur packages
alias cowu="cower -u"			# find aur updates
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
ustop() { systemctl --user stop "$1"; }
ustatus() { systemctl --user status "$1"; }
uenabled() { systemctl --user enable "$1"; }
udisabled() { systemctl --user disable "$1"; }
#samba
alias startsamba="systemctl start smbd"
alias stopsamba="systemctl stop smbd"
# offlineimap status
alias emailstatus="systemctl --user status offlineimap"
#cups
alias startprint="systemctl start org.cups.cupsd.service"
alias stopprint="systemctl stop org.cups.cupsd.service"
#Look for high priority errors in the systemd journal
alias errors="sudo journalctl -p 3 -xb"
listd() {
  echo -e "${BLD}${RED} --> SYSTEM LEVEL <--${NRM}"
  find /etc/systemd/system -mindepth 1 -type d | sed '/getty.target/d' | xargs ls -gG --color
  [[ -d "$HOME"/.config/systemd/user/default.target.wants ]] &&
    (echo -e "${BLD}${RED} --> USER LEVEL <--${NRM}" ; \
    find "$HOME"/.config/systemd/user -mindepth 1 -type d | xargs ls -gG --color)
}
#journalctl
getlog() { local file=~/logs/system/log-$(date +%Y%m%d-%H:%M).txt; sudo journalctl -b | grep --line-buffered -v "offimap"> "$file" && vim "$file"; }
# }}}

##

## System ## {{{
#battery
alias bat="upower --show-info /org/freedesktop/UPower/devices/battery_BAT0"
alias batr="upower --show-info /org/freedesktop/UPower/devices/battery_BAT0 | grep "time""
#disk usage
alias df="pydf"
alias du="ncdu"
#processes
alias ps="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
#net_monitor
alias whichport="sudo netstat -tulpn"
alias netmon="netstat -nputwc"
alias wifo="sudo iftop -i wlp1s0"
alias wistat="slurm -i wlp1s0"
#xampp
alias starth="sudo /opt/lampp/lampp start"
alias stoph="sudo /opt/lampp/lampp stop"
#elevated
alias nanos="sudo nano"
alias vims="sudo vim"
alias vcat="sudo cat"
#ccache
export USE_CCACHE=1
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
#bbc radio
#bbcradio() { local s PS3="Select a station: ";select s in 1 1x 2 3 4 4x 5l 5lsp 6 "Asian Network an" "Nations & Local lcl";do break;done;s=($s);play -playlist "http://www.bbc.co.uk/radio/listen/live/r"${s[@]: -1}".asx";}
#alias bbclondon="play -playlist http://www.bbc.co.uk/radio/listen/live/bbclondon.asx"
#alias bbcworld="play -playlist http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls"
alias bbcr1x='get_iplayer --stream --type=liveradio 80100 --modes=hafmed --player="mplayer -cache 128 -"'
alias bbc5lx='get_iplayer --stream --type=liveradio 80101 --modes=hafmed --player="mplayer -cache 128 -"'
alias bbclon='get_iplayer --stream --type=liveradio 80123 --modes=hafmed --player="mplayer -cache 128 -"'
alias bbcr1='get_iplayer --stream --type=liveradio 80131 --modes=hafmed --player="mplayer -cache 128 -"'
alias bbcr4='get_iplayer --stream --type=liveradio 80135 --modes=hafmed --player="mplayer -cache 128 -"'
alias bbc5l='get_iplayer --stream --type=liveradio 80137 --modes=hafmed --player="mplayer -cache 128 -"'
alias bbcworld='get_iplayer --stream --type=liveradio 80158 --modes=hafmed --player="mplayer -cache 128 -"'
#youtube-dl/mp4
alias ytd="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
# }}}

##

## Misc ## {{{
#gen_rand_password
alias genpass="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 10 | tr -d '\n'; echo"
#quickies
alias valias="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias vi3="vim ~/.config/i3/config"
alias vbar="vim ~/.config/i3/bar/bar.sh"
alias vmutt="vim ~/.mutt/muttrc"
#fix permissions
fix() {
  [[ -d "$1" ]] &&
  find "$1" -type d -print0 | xargs -0 chmod 755 && find "$1" -type f -print0 | xargs -0 chmod 644 ||
    echo "$1 is not a directory."
}
#todo
source ~/bin/todo_completion
export TODOTXT_DEFAULT_ACTION=ls
alias t='todo.sh -d ~/.todo/todo.cfg'
#complete -F _todo t
#neofetch
alias neofetch2="neofetch \
--config on \
--backend w3m \
"
#pip_user_commands
alias pipl="pip list --user"
alias pipi="pip install --user"
alias pipo="pip list --user --outdated"
alias pipu="pip install --user --upgrade"
#xprop
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'
#anamnesis
alias clip="anamnesis -l 10"
alias clipb="anamnesis -b"
#xclip
alias clipboard='xclip -o'
#pcinfo
alias pcinfo="inxi -v6 -c5"
#google_calender_(gcalcli)
alias calm="gcalcli calm"
alias calw="gcalcli calw"
alias cald="gcalcli agenda"
alias calquick="gcalcli quick --calendar ''"
alias caladd="gcalcli add --calendar ''"
alias histg="history | grep"
alias myip="curl http://ipecho.net/plain; echo"
alias myipl="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}
# }}}

##

# httpd & mysqld
#alias starth="sudo systemctl start httpd"
#alias startm="sudo systemctl start mysqld"
#alias stoph="sudo systemctl stop httpd"
#alias stath="sudo systemctl status httpd"
#alias stopm="sudo systemctl stop mysqld"

##

## Export ## {{{
export PATH=${PATH}:$HOME/bin:$HOME/.local/bin/
export PATH=${PATH}:$HOME/development/android/sdk/platform-tools/
export PATH=${PATH}:$HOME/development/android/sdk/tools/
export ANDROID_HOME=$HOME/development/android/sdk
export PATH=${PATH}:$HOME/vm/qemu-scripts/
export QEMU_AUDIO_DRV=pa
#export PATH=$PATH:$HOME/.config/composer/vendor/bin
# }}}
