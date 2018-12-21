#!/usr/bin/env bash

###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/functions.sh"

execShells "$DOCKER_CONF_PATH/bin/service.d/supervisor.d"

exec supervisord -c /etc/supervisord.conf --logfile /dev/null --pidfile /dev/null --user root
