#!/usr/bin/env bash

shopt -s nullglob

###
 # Check if current user is root
 #
 ##
function rootCheck() {
	# Root check
	if [ "$(/usr/bin/whoami)" != "root" ]; then
		echo "[ERROR] $* must be run as root"
		exit 1
	fi
}


###
 # $1 -> path
 #
 ##
function createDir() {
	if [ ! -d "$1" ];then
		/bin/mkdir -p $1
	fi
}


###
 # $1 -> from
 # $2 -> to
 #
 ##
function copyFileTo() {
	# Log
	echo " ---> Copy file : '$1' into '$2'"
	/bin/cp -fr "$1" "$2"
}


###
 # $1 -> from
 # $2 -> to
 #
 ##
function copyFilesTo() {
	if [ ! -d "$1" ];then
		/bin/mkdir -p $1
	fi

	for FILE_C in "$1"/*; do
		# Log
		echo " ---> Copy file : '$1' into '$2'"
		/bin/cp -fr "$1" "$2"
	done
}


###
 # $1 -> file
 #
 ##
function execShell() {
	# Log
	echo " ---> Exec script : '$1'"
	# run custom scripts
	source "$1"
}


###
 # $1 -> path
 #
 ##
function execShells() {
	for FILE_S in "$1"/*.sh; do
		# Log
		echo " ---> Exec script : '$1'"
		# run custom scripts
		source "$1"
	done
}


###
 # $1 -> file
 #
 ##
function execShellOnce() {
	# Log
	echo " ---> Exec script : '$1'"
	# run custom scripts
	source "$1"

	rm -f -- "$1"
}


###
 # $1 -> path
 #
 ##
function execShellsOnce() {
	for FILE_I in "$1"/*.sh; do
		# Log
		echo " ---> Exec script : '$FILE_I'"
		# run custom scripts
		source "$FILE_I"

		rm -f -- "$FILE_I"
	done
}


###
 # $1 -> search
 # $2 -> replace
 # $3 -> path
 # $4 -> file (default: *.*)
 #
 ##
function replaceFile() {
	if [ "$4"x == "x" ];then
		find "${3}" -iname '*.conf' -print0 | xargs -0 -r /usr/local/bin/docker-replace --quiet "${1}" "${2}"
	else
		find "${3}" -iname "$4" -print0 | xargs -0 -r /usr/local/bin/docker-replace --quiet "${1}" "${2}"
	fi
}
