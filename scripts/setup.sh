#!/bin/bash
useremail=$1
baseUrl=$2

curl -sSfL "${baseUrl}/settings/jail.conf" -o /etc/fail2ban/jail.conf 2>&1
curl -sSfL "${baseUrl}/settings/paths-jelastic.conf" -o /etc/fail2ban/paths-jelastic.conf 2>&1
curl -sSfL "${baseUrl}/settings/apache-myadmin.conf" -o /etc/fail2ban/filter.d/apache-myadmin.conf 2>&1
curl -sSfL "${baseUrl}/settings/glassfish3-admin.conf" -o /etc/fail2ban/filter.d/glassfish3-admin.conf 2>&1
curl -sSfL "${baseUrl}/settings/mongodb-iptables.conf" -o /etc/fail2ban/filter.d/mongodb-iptables.conf 2>&1
curl -sSfL "${baseUrl}/settings/postgresql-iptables.conf" -o /etc/fail2ban/filter.d/postgresql-iptables.conf 2>&1
curl -sSfL "${baseUrl}/settings/postgresql.conf" -o /etc/fail2ban/filter.d/postgresql.conf 2>&1
sed -i "s~destemail = root@localhost~destemail = $useremail~g" /etc/fail2ban/jail.conf

for logfile in $(grep 'logpath =' /etc/fail2ban/jail.conf | grep -v '%' | awk -F '=' '{ print $2 }' | sort -u); do ls $logfile > /dev/null 2>&1 || sed -i "s~$(echo $logfile | sed 's~[\.*^$]~\\&~g')~&\nenabled = false~g" /etc/fail2ban/jail.conf; done;
systemctl daemon-reload
/etc/init.d/fail2ban start
