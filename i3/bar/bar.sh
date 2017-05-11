#!/bin/bash
HIGHLIGHT="#D8DEE9"
clock() {
	TIME=$(date "+%H:%M")
    DATE=$(date "+%a %d/%m/%y")
	echo -n "%{F$HIGHLIGHT}$(printf '%b' "\uf017")%{F-} $TIME  %{F$HIGHLIGHT}$(printf '%b' "\uf073")%{F-} $DATE"
}
volume() {
	VOL=$(amixer get Master | grep % | sed -n 1p | awk -F '[' '{print $2}' | awk -F ']' '{print $1}')
	if [ $VOL = '0%' ]; then
		echo -n "%{F$HIGHLIGHT}$(printf '%b' "\uf026")%{F-} Mute"
	else
		echo -n "%{F$HIGHLIGHT}$(printf '%b' "\uf028")%{F-} $VOL"
	fi
}
wifi() {
    echo -e "%{F$HIGHLIGHT} \uf1eb %{F-}$(iw wlp1s0 link | grep 'SSID' | cut -c 8-)"
}
mail() {
	# grabs new email # from offlineimap
		echo -e "%{F$HIGHLIGHT} \uf0e0 %{F-}$(ls /home/ajibola/mail/Gmail/INBOX/new | wc -l)"
}
music() {
	SONG=$(mpc current)
	if [ -n $SONG ]; then
		echo -n ""
	else 
        echo -n " %{F$HIGHLIGHT}$(printf '%b' "\uf01d")%{F-} $SONG "
	fi
}
#Copied from /u/Dylan112
workspace() {
	workspacenext="A4:i3-msg workspace next_on_output:"
        workspaceprevious="A5:i3-msg workspace prev_on_output:"
        wslist=$(\
                wmctrl -d \
                | awk '/ / {print $2 $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20}' ORS=''\
                | sed -e 's/\s*  //g' \
                -e 's/\*[ 0-9A-Za-z]*[^ -~]*/  &  /g' \
                -e 's/\-[ 0-9A-Za-z]*[^ -~]*/%{F#525252}%{A:i3-msg workspace &:}  &  %{A}%{F#A0A0A0}/g' \
                -e 's/\*//g' \
                -e 's/ -/ /g' \
                )
        echo -n "%{$workspacenext}%{$workspaceprevious}$wslist%{A}%{A}"
}
windowtitle(){
	# Grabs focused window's title
	# The echo "" at the end displays when no windows are focused.
	TITLE=$(xdotool getactivewindow getwindowname 2>/dev/null | sed -n 1p || echo "")
	TITLECUT=$(xdotool getactivewindow getwindowname 2>/dev/null | sed -n 1p | sed 's/\///g;s/-//g;s/ /\\/g' | cut -c 1-6 || echo "")

	if [ "$TITLECUT" = "glenn@" ]; then
		echo "$(printf '%b' "\ue1d9") $(echo "$TITLE" | cut -c 15-50)"
	else
		echo "$TITLE" | cut -c 1-50
	fi
}
bat() {
    status=$(cat /sys/class/power_supply/BAT0/status)
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)

    if [ "$status" == "Charging" ]; then
        echo -e "%{F$HIGHLIGHT} \uf240 %{F-}$capacity%"
    elif (($capacity == 100)); then
        echo -e "%{F$HIGHLIGHT} \uf240 %{F-}$capacity%"
    elif (($capacity > 82)); then
        echo -e "%{F$HIGHLIGHT} \uf241 %{F-}$capacity%"
    elif (($capacity > 62)); then
        echo -e "%{F$HIGHLIGHT} \uf241 %{F-}$capacity%"
    elif (($capacity > 32)); then
        echo -e "%{F$HIGHLIGHT} \uf242 %{F-}$capacity%"
    elif (($capacity > 0)); then
        echo -e "%{F$HIGHLIGHT} \uf243 %{F-}$capacity%"
    else
        echo -e "%{F$HIGHLIGHT} \uf240 %{F-}$capacity%"
    fi
}
while true; do
    echo "%{B#2E3440} $(clock) $(volume) $(mail) $(bat) $(wifi) %{B-}%{c} $(workspace) %{r}%{B-} %{B#3B4252}$(music)%{B#2E3440} $(windowtitle) %{B-}"
#    echo "%{B#c0303048} $(clock) $(volume) $(mail) $(bat) $(wifi) %{B-}%{c} $(workspace) %{r}%{B-} %{B#3b3b4b}$(music)%{B#c0303048} $(windowtitle) %{B-}"
	#echo "%{B#c0303048} $(clock) $(volume) $(mail) $(bat) $(wifi) %{B-}%{c} $(workspace) %{r}%{B-} %{B#5d6383}$(music)%{B#c0303048} $(windowtitle) %{B-}"
	sleep 2;
done |
# -f '-xos4-terminus-medium-r-normal--12-120-72-72-c-60-iso10646-1'\
#old one was '-g 1280x20+45'
#lemonbar -p -d -B#c0262626 -F#A0A0A0 -g 1834x20+45+0\
# -f '-xos4-terminus-medium-r-normal--12-120-72-72-c-60-iso10646-1'\
# -f '-wuncon-siji-medium-r-normal--10-100-75-75-c-80-iso10646-1'\
# eDP-1\
# | zsh
 
 
lemonbar -p -d -B#2E3440 -F#A0A0A0 -g 1834x25+45+0\
 -f FiraMono:size=11\
 -f FontAwesome:size=13\
 eDP-1\
 | zsh
