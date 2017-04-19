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
#alias pacexpl="/usr/bin/pacman -D --asexp"	# 'mark as [expl]icit'	- mark one or more packages as explicitly installed
#alias pacimpl="/usr/bin/pacman -D --asdep"	# 'mark as [impl]icit'	- mark one or more packages as non explicitly installed

## Cower
alias cows="cower -s"			# find aur packages
alias cowl="pacman -Qm"			# list installed aur packages
alias cowu="cower -u"			# find aur updates

## AMD GPU Info
#alias gputemp="aticonfig --odgt"
#alias gpuclock="aticonfig --od-getclocks"

## BATTERY INFO
alias bat="upower --show-info /org/freedesktop/UPower/devices/battery_BAT0"
alias batr="upower --show-info /org/freedesktop/UPower/devices/battery_BAT0 | grep "time""

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rs \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"
# }}}

# Nano(sudo)
alias nanos="sudo nano"

# Vim(sudo)
alias vims="sudo vim"

# Mplayer
alias play="mplayer -msgcolor -msgmodule"
alias playcd="mplayer cdda://"
#alias playcd="mplayer -cdrom-device /dev/sr0 cdda://"
#alias playdvd="mplayer dvd://"
alias playdvd="mplayer -mouse-movements dvdnav://"
alias playvcd="mplayer vcd://2"
alias takepic="mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 15 -vf screenshot"

# Webcam video capture
#alias webcam="mencoder tv:// -tv driver=v4l2:width=800:height=600:device=/dev/video0:fps=30:outfmt=yuy2:forceaudio:alsa:adevice=hw.0,0 -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=1800 -ffourcc xvid -oac mp3lame -lameopts cbr=128 -o output.avi"
alias webcam="ffmpeg -f alsa -i default -f v4l2 -s 640x480 -i /dev/video0 -acodec flac -vcodec libx264 output.mkv"

# BBC Radio
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

# xprop
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'

# anamnesis
alias clip="anamnesis -l 10"
alias clipb="anamnesis -b"

#xclip
alias clipboard='xclip -o'

# powerline
#if [ -f /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh ]; then
#    source /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
#fi

# disk space
alias diskfree="df -ht ext4"

# disk usage
alias dusage="ncdu"

# pcinfo
alias pcinfo="inxi -v6 -c5"

# monitor network connections
alias whichport="sudo netstat -tulpn"
alias netmon="netstat -nputwc"
alias nets='sudo netstat -nlptu'
alias nets2='sudo lsof -i'
alias wifo="sudo iftop -i wlp1s0"
alias wifo2="slurm -i wlp1s0"
alias nets3="sudo nethogs"

# Look for high priority errors in the systemd journal
alias errors="sudo journalctl -p 3 -xb"

# systemd commands
alias start="sudo systemctl start"
alias stop="sudo systemctl stop"
alias status="systemctl status"

# google calender (gcalcli)
alias calm="gcalcli calm"
alias calw="gcalcli calw"
alias cald="gcalcli agenda"
alias calquick="gcalcli quick --calendar 'ajibola okubanjo'"
alias caladd="gcalcli add --calendar 'ajibola okubanjo'"

# httpd & mysqld
#alias starth="sudo systemctl start httpd"
#alias startm="sudo systemctl start mysqld"
#alias stoph="sudo systemctl stop httpd"
#alias stath="sudo systemctl status httpd"
#alias stopm="sudo systemctl stop mysqld"

# xampp
alias starth="sudo /opt/lampp/lampp start"
alias stoph="sudo /opt/lampp/lampp stop"

# Disk activity
alias diskact="sudo iotop -Po"

# ccache
export USE_CCACHE=1

# todo
source ~/bin/todo_completion
export TODOTXT_DEFAULT_ACTION=ls
alias t='todo.sh -d ~/.todo/todo.cfg'
#complete -F _todo t

# generate random password
alias genpass="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 10 | tr -d '\n'; echo"

#cups
alias startprint="systemctl start org.cups.cupsd.service"
alias stopprint="systemctl stop org.cups.cupsd.service"

#neofetch
alias neofetch2="neofetch \
--config on \
--backend w3m \
"

#samba
alias startsamba="systemctl start smbd"
alias stopsamba="systemctl stop smbd"

# offlineimap status
alias emailstatus="systemctl --user status offlineimap"

#elevated cat
alias vcat="sudo cat"

#youtube-dl/mp4
alias ytd="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"

# pip commands
alias pipl="pip list --user"
alias pipi="pip install --user"
alias pipo="pip list --user --outdated"
alias pipu="pip install --user --upgrade"

#quickies
alias valias="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias vi3="vim ~/.config/i3/config"
alias vbar="vim ~/.config/i3/bar/bar.sh"
alias vmutt="vim ~/.mutt/muttrc"

# Saves journal logs to file
getlog() { local file=~/logs/system/log-$(date +%Y%m%d-%H:%M).txt; sudo journalctl -b | grep --line-buffered -v "offimap"> "$file" && vim "$file"; }

#export commands
export PATH=${PATH}:$HOME/bin:$HOME/.local/bin/
export PATH=${PATH}:$HOME/Android/Sdk/tools/
export PATH=${PATH}:$HOME/Android/Sdk/platform-tools/
export PATH=${PATH}:$HOME/vm/qemu-scripts/
export QEMU_AUDIO_DRV=pa
#export PATH=$PATH:$HOME/.config/composer/vendor/bin
