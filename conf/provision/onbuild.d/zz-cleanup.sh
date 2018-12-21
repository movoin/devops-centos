# Clean balabala
#
find "$DOCKER_CONF_PATH/" -type f | grep .DS_Store | awk '{system("rm -f "$1)}'

rm -rf /var/cache/yum
rm -f /anaconda-post.log
rm -rf /tmp/*
