###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/function.sh"

# Replace markers
replaceFile "<DOCKER_CONF_PATH>" "$WEB_DOCKER_CONF_PATH" "$DOCKER_CONF_PATH/etc/supervisor.d"