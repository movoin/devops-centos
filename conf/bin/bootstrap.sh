#!/usr/bin/env bash

set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o nounset   ## set -u : exit the script if you try to use an uninitialised variable
set -o errexit   ## set -e : exit the script if any statement returns a non-true return value

source /opt/docker/bin/functions.sh

rootCheck "$0"

# Save the buildtime
date +%s > /opt/docker/.BUILDTIME


#############################
## COMMAND
#############################

runProvision
