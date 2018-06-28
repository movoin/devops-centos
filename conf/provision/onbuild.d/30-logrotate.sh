source /opt/docker/bin/functions.sh

# Register logrotate configurations

syncLogrotateConf

# Misc

chmod 0664 /var/log/wtmp
