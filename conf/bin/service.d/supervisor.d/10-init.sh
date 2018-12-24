###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/functions.sh"

# Replace markers
replaceFile "<DOCKER_CONF_PATH>" "$DOCKER_CONF_PATH" "$DOCKER_CONF_PATH/etc/supervisor.d"
