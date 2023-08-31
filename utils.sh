#!/bin/bash


function extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf	$archive ;;
				*.tar.gz)    tar xvzf	$archive ;;
				*.bz2)       bunzip2	$archive ;;
				*.rar)       rar x	$archive ;;
				*.gz)        gunzip	$archive ;;
				*.tar)       tar xvf	$archive ;;
				*.tbz2)      tar xvjf	$archive ;;
				*.tgz)       tar xvzf	$archive ;;
				*.zip)       unzip	$archive ;;
				*.Z)         uncompress	$archive ;;
				*.7z)        7z x	$archive ;;
				*)           echo "Don't know how to extract '$archive'!!!!" ;;
			esac
		else
			echo "'$archive' is not a valid file!!!.."
		fi
	done
}

# Searches for text in all files in the current folder
function find_text () {
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}

# Copy file with a progress bar
function copy_progress () {
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
		| awk '{
			count += $NF
			if (count % 10 == 0) {
				percent = count / total_size * 100
				printf "%3d%% [", percent
				for (i=0;i<=percent;i++)
					printf "="
					printf ">"
					for (i=percent;i<100;i++)
						printf " "
						printf "]\r"
					}
				}
				END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

# Goes up a specified number of directories  (i.e. up 4)
function up () {
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
	do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

# Returns the last 2 fields of the working directory
function pwdtail () {
	pwd | awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

