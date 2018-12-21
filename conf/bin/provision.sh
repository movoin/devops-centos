#!/usr/bin/env bash


###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/functions.sh"


###
 # Run "onbuild" provisioning
 ##
function runProvision() {
	if [ -d "$DOCKER_CONF_PATH/provision/onbuild.d" ];then
		execShellsOnce "$DOCKER_CONF_PATH/provision/onbuild.d"
	fi
}


###
 # Run "oninstall" provisioning
 ##
function runInstall() {
	if [ -d "$DOCKER_CONF_PATH/provision/install.d" ];then
		execShellsOnce "$DOCKER_CONF_PATH/provision/install.d"
	fi
}


###
 # Run "entrypoint" provisioning
 ##
function runProvisionEntrypoint() {
	if [ -d "$DOCKER_CONF_PATH/provision/entrypoint.d" ];then
		execShells "$DOCKER_CONF_PATH/provision/entrypoint.d"
	fi
}


###
 # Sync logrotate.d configs
 ##
function syncLogrotateConf() {
	copyFilesTo "$DOCKER_CONF_PATH/etc/logrotate.d" "/etc/logrotate.d"
	rm -rf "$DOCKER_CONF_PATH/etc/logrotate.d"
}


###
 # Sync syslog-ng configs
 ##
function syncSyslogNgConf() {
	copyFilesTo "$DOCKER_CONF_PATH/etc/syslog-ng" "/etc/syslog-ng"
	rm -rf "$DOCKER_CONF_PATH/etc/syslog-ng"
}


###
 # Run "entrypoint" scripts
 ##
function runEntrypoints() {
	###############
	# Try to find entrypoint
	###############
	ENTRYPOINT_SCRIPT="$DOCKER_CONF_PATH/bin/entrypoint.d/${TASK}.sh"

	if [ -f "$ENTRYPOINT_SCRIPT" ]; then
		source "$ENTRYPOINT_SCRIPT"
	fi

	###############
	# Run default
	###############
	if [ -f "$DOCKER_CONF_PATH/bin/entrypoint.d/default.sh" ]; then
		source "$DOCKER_CONF_PATH/bin/entrypoint.d/default.sh"
	fi

	exit
}
