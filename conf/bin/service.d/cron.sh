#!/usr/bin/env bash

###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/functions.sh"

execShells "$DOCKER_CONF_PATH/bin/service.d/cron.d"

exec /usr/sbin/crond -n
