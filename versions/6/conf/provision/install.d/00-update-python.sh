source /opt/docker/bin/functions.sh

# Python
/usr/local/bin/docker-install gcc gcc-c++ autoconf automake zlib-devel bzip2-devel openssl-devel xz

# Install
cd /tmp
wget https://www.python.org/ftp/python/2.7.15/Python-2.7.15.tar.xz
tar -xvf Python-2.7.15.tar.xz
cd Python-2.7.15/
./configure --prefix=/usr/local
make && make altinstall

# Move old version
mv /usr/bin/python /usr/bin/python2.6.6

# Link new version
ln -s /usr/local/bin/python2.7 /usr/bin/python

# Update YUM
copyFileTo "/opt/docker/etc/yum" "/usr/bin/yum"
rm -f /opt/docker/etc/yum
chmod +x /usr/bin/yum

# Clear Python
rm -rf /tmp/Python-2.7.15/
rm -f /tmp/Python-2.7.15.tar.xz

cd /

# Clear Depends
yum -y erase zlib-devel bzip2-devel openssl-devel
yum clean all
