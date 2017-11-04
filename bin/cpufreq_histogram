#!/bin/bash

# script to log the CPU frequency over a period of time and 
# plot a nice historgram of the frequency distribution

writeout() {
	histogram.py -p < "$file"
	echo
	echo "note the log file is $file"
	exit 0
}

collect() {
	DTS=$(date +"%Y%m%d-%H%M%S")
	[[ -d $XDG_RUNTIME_DIR ]] && 
	file=$XDG_RUNTIME_DIR/"stats-$DTS" || file=/tmp/"stats-$DTS"

	echo "Collecting data for $runs seconds..."
	TIME=( $(seq 1 1 "$runs") )

	for i in "${TIME[@]}"; do
		sleep 1
		bc <<< "scale=1; $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)/1000" >> "$file"
	done
}

# allow ctrl+c to stop and retain data
trap writeout SIGHUP SIGINT SIGTERM

# check deps
command -v histogram.py >/dev/null 2>&1 || {
echo " I require histogram.py but it's not installed."
echo " Upstream URL: https://github.com/bitly/data_hacks"
echo " AUR link for Arch Linux: https://aur.archlinux.org/packages/data_hacks"
echo "Aborting!" >&2; exit 1; }

command -v bc >/dev/null 2>&1 || {
echo " I require bc but it's not installed. Aborting!" >&2; exit 1; }

if [[ -z "$1" ]]; then
	echo "Usage: $0 [token]"
	echo "Token can be either:"
	echo "   1) An integer representing the number of seconds to watch the CPU frequency"
	echo "   2) The path to log file from a previous run."
	exit 1
elif [[ -f "$1" ]]; then
	# just process an existing file
	file="$1"
	writeout
	exit 0
else
	# make sure we can collect data
	[[ -f /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq ]] || {
	echo " Cannot tell what the CPU current CPU frequency is. Aborting!" >&2; exit 1; }
	
	# make sure $1 is an integer
	[[ "$1" =~ ^-?[0-9]+$ ]] || {
	echo " Supply an integer and try again." >&2; exit 1; }

	runs="$1"
	collect
	writeout
fi
