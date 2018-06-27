source /opt/docker/bin/functions.sh

# Supervisord
copyFileTo "/opt/docker/etc/supervisord.conf" "/etc/supervisord.conf"

rm -f /opt/docker/etc/supervisord.conf

