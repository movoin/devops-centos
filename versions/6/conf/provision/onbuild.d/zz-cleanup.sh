# Clean balabala
#
find /opt/docker/ -type f | grep .DS_Store | awk '{system("rm -f "$1)}'
