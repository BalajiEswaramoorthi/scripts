#!/bin/bash

print_info () {
	clear
	printf "\n"
	printf "   %s\n" "USER: $(echo $USER)"
	printf "   %s\n" "DATE: $(date)"
	printf "   %s\n" "UPTIME: $(uptime -p)"
	printf "   %s\n" "HOSTNAME: $(hostname -f)"
	printf "   %s\n" "CPU: $(lscpu | grep "Model name:" | sed -r 's/Model name:\s{1,}//g')"
	printf "   %s\n" "KERNEL: $(uname -rms)"
	printf "   %s\n" "PACKAGES: $(dpkg --get-selections | wc -l)"
	printf "   %s\n" "RESOLUTION: $(tput cols)x$(tput lines)"
	printf "   %s\n" "MEMORY: $(free -m -h | awk '/Mem/{print $3"/"$2}')"
	printf "\n"
}

most_used_cmd () {
	history | awk '{cmd[$2]++} END {for(elem in cmd) {print cmd[elem] " " elem}}' | sort -n -r | head -$1
}
