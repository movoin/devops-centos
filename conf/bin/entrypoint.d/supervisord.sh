#!/usr/bin/env bash
# EntryPoint : Supervisor

#############################################
## Supervisord (start daemons)
#############################################

rootCheck "supervisord"

## Start services
exec /opt/docker/bin/service.d/supervisor.sh
