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
 # Copy files to
 #
 # $1 -> from
 # $2 -> to
 #
 ##
function copyFilesTo() {
	for FILE_C in "$1"/*; do
		# Backup old file
		if [ -f "$2/$(basename $FILE_C)" ];then
			if [ -f "$2/$(basename $FILE_C).sav" ];then
				rm -f "$2/$(basename $FILE_C).sav"
			fi

			mv "$2/$(basename $FILE_C)"{,.sav}
		fi

		/bin/cp -fr "$FILE_C" "$2/$(basename $FILE_C)"
		# Log
		echo "      -> Copy file : '$FILE_C' into '$2/$(basename $FILE_C)'"
	done
}


###
 # Copy file to
 #
 # $1 -> from
 # $2 -> to
 #
 ##
function copyFileTo() {
	# Backup old file
	if [ -f "$2" ];then
		if [ -f "$2.sav" ];then
			rm -f "$2.sav"
		fi

		mv "$2"{,.sav}
	fi

	/bin/cp -fr "$1" "$2"
	# Log
	echo "      -> Copy file : '$1' into '$2'"
}


###
 # Include script directory text inside a file
 #
 # $1 -> path
 #
 ##
function includeScriptDir() {
	for FILE_S in "$1"/*.sh; do
		# Log
		echo "-> Exec script : '$FILE_S'"
		# run custom scripts, only once
		. "$FILE_S"
	done
}


###
 # Install script directory text inside a file
 #
 # $1 -> path
 #
 ##
function installScriptDir() {
	for FILE_I in "$1"/*.sh; do
		# Log
		echo "  * Install script : '$FILE_I'"
		# run custom scripts, only once
		. "$FILE_I"
		rm -f -- "$FILE_I"
	done
}


###
 # Run "onbuild" provisioning
 ##
function runProvision() {
	for FILE in /opt/docker/provision/onbuild.d/*.sh; do
		# Log
		echo "  * Exec build : '$FILE'"
		# run custom scripts, only once
		. "$FILE"
		rm -f -- "$FILE"
	done
}


###
 # Sync logrotate.d configs
 ##
function syncLogrotateConf() {
	copyFilesTo "/opt/docker/etc/logrotate.d" "/etc/logrotate.d"
	rm -rf /opt/docker/etc/logrotate.d
}


###
 # Sync syslog-ng configs
 ##
function syncSyslogNgConf() {
	copyFilesTo "/opt/docker/etc/syslog-ng" "/etc/syslog-ng"
	rm -rf /opt/docker/etc/syslog-ng
}


###
 # Run "entrypoint" provisioning
 ##
function runProvisionEntrypoint() {
	includeScriptDir "/opt/docker/provision/entrypoint.d"
}


###
 # Run "entrypoint" scripts
 ##
function runEntrypoints() {
	###############
	# Try to find entrypoint
	###############

	ENTRYPOINT_SCRIPT="/opt/docker/bin/entrypoint.d/${TASK}.sh"

	if [ -f "$ENTRYPOINT_SCRIPT" ]; then
		. "$ENTRYPOINT_SCRIPT"
	fi

	###############
	# Run default
	###############
	if [ -f "/opt/docker/bin/entrypoint.d/default.sh" ]; then
		. /opt/docker/bin/entrypoint.d/default.sh
	fi

	exit
}
