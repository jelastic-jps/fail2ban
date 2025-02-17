[![Fail2Ban](images/fail2ban-logo.jpg)](../../../fail2ban)
## Jelastic Fail2Ban Add-on

This repository provides [Fail2Ban](http://www.fail2ban.org/) add-on for Jelastic Platform.

**Fail2Ban** is an intrusion prevention software framework that protects computer servers from brute-force attacks. Written in the Python programming language, it is able to run on POSIX systems that have an interface to a packet-control system or firewall installed locally, for example, iptables or TCP Wrapper.

**Type of nodes this add-on can be applied to**: 
- Application server (cp)
- Load Balancing (bl)
- Database server (db)

### What it can be used for?
With a help of our JPS addon, Fail2Ban is automatically installed on app server available in the environment to provide possibility to setup an intrusion prevention software framework that protects computer servers from brute-force attacks and update firewall rules to reject the IP addresses for a specified amount of time.<br/>
Fail2ban operates by monitoring log files (e.g. /var/log/auth.log, /var/log/apache/access.log, etc.) for selected entries and running scripts based on them. Most commonly this is used to block selected IP addresses that may belong to hosts that are trying to breach the system's security. It can ban any host IP address that makes too many login attempts or performs any other unwanted action within a time frame defined by the administrator. Fail2ban is typically set up to unban a blocked host within a certain period, so as to not "lock out" any genuine connections that may have been temporarily misconfigured. However, an unban time of several minutes is usually enough to stop a network connection being flooded by malicious connections, as well as reducing the likelihood of a successful dictionary attack.<br/>

Fail2ban can perform multiple actions whenever an abusive IP address is detected: update Netfilter/iptables or PF firewall rules, TCP Wrapper's hosts.deny table, to reject an abuser's IP address; email notifications; or any user-defined action that can be carried out by a Python script.<br/>

The standard configuration ships with filters for Apache, Lighttpd, sshd, vsftpd, qmail, Postfix and Courier Mail Server. Filters are defined by Python regexes, which may be conveniently customized by an administrator familiar with regular expressions. A combination of a filter and an action is known as a "jail" and is what causes a malicious host to be blocked from accessing specified network services. As well as the examples that are distributed with the software, a "jail" may be created for any network-facing process that creates a log file of access.<br/>

At the add-on menu the "Remove the IP from the Ban list" point can be selected to remove the banned IP from the jail list.

### Deployment

In order to get this solution instantly deployed, click the "Get It Hosted Now" button, specify your email address within the widget, choose one of the [Jelastic Public Cloud providers](https://jelastic.cloud) and press Install.

[![GET IT HOSTED](https://jelastic.com/getithosted/button.png)](https://jelastic.com/install-application/?manifest=https%3A%2F%2Fgithub.com%2Fjelastic-jps%2Ffail2ban%2Fraw%2Fmaster%2Fmanifest.jps)

To deploy this package to Jelastic Private Cloud, import [this JPS manifest](../../raw/master/manifest.jps) within your dashboard ([detailed instruction](https://docs.jelastic.com/environment-export-import#import)).

For more information on what Jelastic add-on is and how to apply it, follow the [Jelastic Add-ons](https://github.com/jelastic-jps/jpswiki/wiki/Jelastic-Addons) reference.
