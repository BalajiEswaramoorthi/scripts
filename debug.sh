#!/bin/bash

DEBUG=( "" "debug" "info" "warning" "error" )

debug=0

log_level=1

function execute () {
	if [ $debug -gt 0 ]; then
		echo ${DEBUG[$debug]} executing "$@"
	fi
	$@
}
