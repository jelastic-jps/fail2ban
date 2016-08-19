#!/bin/bash

/etc/init.d/fail2ban stop
cat /etc/fail2ban/uninstall.txt | xargs rm -rf
rm -rf /var/lib/fail2ban/fail2ban.sqlite3
