###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/functions.sh"

# Supervisord

cd /tmp
wget --no-check-certificate https://bootstrap.pypa.io/ez_setup.py -O - | python
easy_install supervisor

rm -f /tmp/setuptools-*.zip

copyFileTo "$DOCKER_CONF_PATH/etc/supervisord.conf" "/etc/supervisord.conf"

replaceFile "DOCKER_CONF_PATH" "$DOCKER_CONF_PATH" "/etc/supervisord.conf" "*.conf"
replaceFile "DOCKER_CONF_PATH" "$DOCKER_CONF_PATH" "$DOCKER_CONF_PATH/etc/supervisor.d" "*.conf"

rm -f "$DOCKER_CONF_PATH/etc/supervisord.conf"

# Clear files (reduce snapshot size)
/usr/local/bin/docker-clean
rm -f /anaconda-post.log
