#!/usr/bin/env bash

###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/provision.sh"

runInit "supervisor.d"

exec supervisord -c /etc/supervisord.conf --logfile /dev/null --pidfile /dev/null --user root
