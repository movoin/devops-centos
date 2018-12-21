#!/usr/bin/env bash
# EntryPoint : Supervisor

#############################################
## Supervisord (start daemons)
#############################################

rootCheck "supervisord"

## Start services
exec "$DOCKER_CONF_PATH/bin/service.d/supervisor.sh"
