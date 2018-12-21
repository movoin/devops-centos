# Fix rights of /tmp (can be a volume)
chmod 1777 /tmp

chmod -R +x $DOCKER_CONF_PATH/bin/*.sh
