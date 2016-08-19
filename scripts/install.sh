#!/bin/bash

mkdir -p /etc/fail2ban
cd /tmp && rm -rf fail2ban
curl -sSfL "https://github.com/fail2ban/fail2ban/archive/master.zip" -o /tmp/master.zip 2>&1
cd /tmp && unzip -a master.zip -d fail2ban && cd fail2ban/$(ls fail2ban)
python setup.py install --record /etc/fail2ban/uninstall.txt
if [ ! -f /etc/init.d/fail2ban ] ; then cp ./files/redhat-initd /etc/init.d/fail2ban ; chmod u+x,g+x,o+x /etc/init.d/fail2ban ; fi
chmod -R 777 $(whereis fail2ban-client | awk -F ':' '{print $2}' | awk -F '/fail2ban-client' '{print $1}' | cut -c 2-)
echo 'PATH='"$(whereis fail2ban-client | awk -F ':' '{print $2}' | awk -F '/fail2ban-client' '{print $1}' | cut -c 2-)"':$PATH' >> /etc/profile && echo 'export PATH' >> /etc/profile
sed -i "s~/usr/bin/fail2ban-client~$(whereis fail2ban-client | awk -F ':' '{print $2}' | cut -c 2-)~g" /etc/rc.d/init.d/fail2ban
