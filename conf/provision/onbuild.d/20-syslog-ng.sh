source /opt/docker/bin/functions.sh

# Configure syslog-ng

echo "SYSLOGNG_OPTS=--no-caps" >> /etc/default/syslog-ng

# Enable syslog-ng config

syncSyslogNgConf

# Ensure /var/lib/syslog-ng exists

if [ ! -d /var/lib/syslog-ng ];then
	mkdir /var/lib/syslog-ng
fi
