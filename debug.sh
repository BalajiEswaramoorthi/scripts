#!/bin/bash

source /home/$(whoami)/scripts/enum.sh

enum __log_level { LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR }

log_string=( "DEBUG" "INFO" "WARNING" "ERROR" )

log_level=$LOG_ERROR

function execute () {
	echo EXECUTE "$@"
	$@
}

function print_error () {
	if [ $log_level -ge $LOG_ERROR ]; then
		echo ${log_string[$LOG_ERROR]} "$@"
	fi
}

function print_warning () {
	if [ $log_level -ge $LOG_WARNING ]; then
		echo ${log_string[$LOG_WARNING]} "$@"
	fi
}

function print_info () {
	if [ $log_level -ge $LOG_INFO ]; then
		echo ${log_string[$LOG_INFO]} "$@"
	fi
}

function print_debug () {
	if [ $log_level -ge $LOG_DEBUG ]; then
		echo ${log_string[$LOG_DEBUG]} "$@"
	fi
}
