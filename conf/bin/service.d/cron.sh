#!/usr/bin/env bash

source /opt/docker/bin/functions.sh

includeScriptDir "/opt/docker/bin/service.d/cron.d"

exec /usr/sbin/crond -n
