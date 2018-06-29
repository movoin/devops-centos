source /opt/docker/bin/functions.sh

# Supervisord

cd /tmp
wget --no-check-certificate https://bootstrap.pypa.io/ez_setup.py -O - | python
easy_install supervisor

rm -f /tmp/setuptools-*.zip

copyFileTo "/opt/docker/etc/supervisord.conf" "/etc/supervisord.conf"

rm -f /opt/docker/etc/supervisord.conf

