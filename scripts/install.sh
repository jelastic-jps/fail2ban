#!/bin/bash

mkdir -p /etc/fail2ban
cd /tmp && rm -rf fail2ban
curl -sSfL "https://github.com/fail2ban/fail2ban/archive/master.zip" -o /tmp/master.zip 2>&1
cd /tmp && unzip -a master.zip -d fail2ban && cd fail2ban/$(ls fail2ban)
python setup.py install --record /etc/fail2ban/uninstall.txt
if [ ! -f /etc/init.d/fail2ban ] ; then cp ./files/redhat-initd /etc/init.d/fail2ban ; sed -i 's/prog=fail2ban-server/prog=fail2ban-server;mkdir -p \/var\/run\/fail2ban/g' /etc/init.d/fail2ban ; chmod u+x,g+x,o+x /etc/init.d/fail2ban ; chkconfig --add --level 345 fail2ban; chkconfig  fail2ban on ; fi
USR_BIN=$(whereis fail2ban-client | awk -F ':' '{print $2}' | awk -F '/fail2ban-client' '{print $1}' | cut -c 2-)
chmod -R 777 ${USR_BIN}/fail2ban-client
echo 'PATH='"${USR_BIN}"':$PATH' >> /etc/profile && echo 'export PATH' >> /etc/profile
sed -i "s~/usr/bin/fail2ban-client~$(whereis fail2ban-client | awk -F ':' '{print $2}' | cut -c 2-)~g" /etc/rc.d/init.d/fail2ban
