#!/bin/bash

time=$(date +%s)

apt-get remove --purge mysql*;

apt-get autoremove -y --purge;

cd /tmp;

mkdir mysql_${time};

wget $1;

tar -xvf  $(ls -la | grep -E -i 'mysql.+\.tar' | grep -o -E '[^ ]+$');

dpkg -i $(ls -la | grep -E -i 'common.+\.deb' | grep -o -E '[^ ]+$');

apt-get -y -f install;

dpkg -i $(ls -la | grep -E -i 'plugins.+\.deb' | grep -o -E '[^ ]+$');

apt-get -y -f install;

dpkg -i $(ls -la | grep -E -i 'community.client.core_.+.deb' | grep -o -E '[^ ]+$');

apt-get -y -f install;

dpkg -i $(ls -la | grep -E -i 'community.client_.+.deb' | grep -o -E '[^ ]+$');

apt-get -y -f install;

dpkg -i $(ls -la | grep -E -i 'community.server.core.+.deb' | grep -o -E '[^ ]+$');

apt-get -y -f install;

dpkg -i $(ls -la | grep -E -i 'community.server.debug.+.deb' | grep -o -E '[^ ]+$');

apt-get -y -f install;

dpkg -i $(ls -la | grep -E -i 'mysql.client_.+.deb' | grep -o -E '[^ ]+$');

apt-get -y -f install;

dpkg -i $(ls -la | grep -E -i 'community.server_.+.deb' | grep -o -E '[^ ]+$');

apt-get -y -f install;

rm -rf /tmp/mysql_${time};
