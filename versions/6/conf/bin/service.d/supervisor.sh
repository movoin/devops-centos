#!/usr/bin/env bash

source /opt/docker/bin/functions.sh

includeScriptDir "/opt/docker/bin/service.d/supervisor.d"

exec supervisord -c /etc/supervisord.conf --logfile /dev/null --pidfile /dev/null --user root
