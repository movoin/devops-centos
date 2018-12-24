#!/usr/bin/env bash

###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/provision.sh"

runInit "cron.d"

exec /usr/sbin/crond -n