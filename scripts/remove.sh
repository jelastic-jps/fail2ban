#!/bin/bash

/etc/init.d/fail2ban stop
less /etc/fail2ban/uninstall.txt | sed "s~fail2ban.*~fail2ban~g" | xargs rm -rf
rm -rf /var/lib/fail2ban/fail2ban.sqlite3
