source /opt/docker/bin/functions.sh

# EasyInstall
cd /tmp
wget https://github.com/pypa/setuptools/archive/v39.2.0.tar.gz
tar zxvf v39.2.0.tar.gz
cd setuptools-39.2.0/
python bootstrap.py
python setup.py install

# Clear EasyInstall
rm -rf /tmp/setuptools-39.2.0/
rm -f /tmp/v39.2.0.tar.gz

cd /

# Supervisor
easy_install supervisor
