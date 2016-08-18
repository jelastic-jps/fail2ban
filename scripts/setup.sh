#!/bin/bash
useremail=$1

echo 'PATH='$(whereis fail2ban-client | awk -F ':' '{print $2}' | awk -F '/fail2ban-client' '{print $1}' | cut -c 2-)'' >> /.bashrc && echo 'export PATH' >> /.bashrc
curl -sSfL "https://github.com/jelastic-jps/fail2ban/raw/master/settings/jail.conf" -o /etc/fail2ban/jail.conf 2>&1"
curl -sSfL "https://github.com/jelastic-jps/fail2ban/raw/master/settings/paths-jelastic.conf" -o /etc/fail2ban/paths-jelastic.conf 2>&1
curl -sSfL "https://github.com/jelastic-jps/fail2ban/raw/master/settings/apache-myadmin.conf" -o /etc/fail2ban/filter.d/apache-myadmin.conf 2>&1
curl -sSfL "https://github.com/jelastic-jps/fail2ban/raw/master/settings/glassfish3-admin.conf" -o /etc/fail2ban/filter.d/glassfish3-admin.conf 2>&1
curl -sSfL "https://github.com/jelastic-jps/fail2ban/raw/master/settings/mongodb-iptables.conf" -o /etc/fail2ban/filter.d/mongodb-iptables.conf 2>&1
curl -sSfL "https://github.com/jelastic-jps/fail2ban/raw/master/settings/postgresql-iptables.conf" -o /etc/fail2ban/filter.d/postgresql-iptables.conf 2>&1
curl -sSfL "https://github.com/jelastic-jps/fail2ban/raw/master/settings/postgresql.conf" -o /etc/fail2ban/filter.d/postgresql.conf 2>&1

sed -i "s~destemail = root@localhost~destemail = $useremail~g" /etc/fail2ban/jail.conf

for logfile in $(grep 'logpath =' /etc/fail2ban/jail.tmp | grep -v '%' | awk -F '=' '{ print $2 }' | uniq); do ls $logfile > /dev/null 2>&1 || sed -i "s~"$(echo $logfile | sed 's~[\.*^$]~\\&~g')"~&\nenabled = false~g" /etc/fail2ban/jail.tmp; done;
