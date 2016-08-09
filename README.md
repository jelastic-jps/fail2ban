[![Fail2Ban](images/fail2ban-logo.jpg)](../../../fail2ban)
## Jelastic Fail2Ban Add-on

This repository provides [Fail2Ban](http://www.fail2ban.org/) add-on for Jelastic Platform.

**Fail2Ban** is an intrusion prevention software framework that protects computer servers from brute-force attacks. Written in the Python programming language, it is able to run on POSIX systems that have an interface to a packet-control system or firewall installed locally, for example, iptables or TCP Wrapper.

**Type of nodes this add-on can be applied to**: 
- Application server (cp)
- Load Balancing (bl)
- Database server (db)

### What it can be used for?
With a help of our JPS addon, Fail2Ban is automatically installed on app server available in the environment to provide possibility to setup an intrusion prevention software framework that protects computer servers from brute-force attacks and update firewall rules to reject the IP addresses for a specified amount of time.

At the add-on menu the "Remove the IP from the Ban list" point can be selected to remove the banned IP from the jail list.

### Deployment

In order to get this solution instantly deployed, click the "Get It Hosted Now" button, specify your email address within the widget, choose one of the [Jelastic Public Cloud providers](https://jelastic.cloud) and press Install.

[![GET IT HOSTED](https://raw.githubusercontent.com/jelastic-jps/jpswiki/master/images/getithosted.png)](https://jelastic.com/install-application/?manifest=https%3A%2F%2Fgithub.com%2Fjelastic-jps%2Ffail2ban%2Fraw%2Fmaster%2Fmanifest.jps)

To deploy this package to Jelastic Private Cloud, import [this JPS manifest](../../raw/master/manifest.jps) within your dashboard ([detailed instruction](https://docs.jelastic.com/environment-export-import#import)).

For more information on what Jelastic add-on is and how to apply it, follow the [Jelastic Add-ons](https://github.com/jelastic-jps/jpswiki/wiki/Jelastic-Addons) reference.