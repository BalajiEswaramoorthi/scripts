#!/bin/bash

# This funcion allow to declare enum "types"
enum ()
{
	# skip index ???
	shift
	AA=${@##*\{} # get string strip after {
	AA=${AA%\}*} # get string strip before }
	AA=${AA//,/} # delete commaa
	((DEBUG)) && echo $AA
	local I=0
	for A in $AA ; do
		eval "$A=$I"
		((I++))
	done
}
