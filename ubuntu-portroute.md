https://askubuntu.com/questions/427600/persist-port-routing-from-80-to-8080?noredirect=1&lq=1

set routing redirect from port 80 to 8080 via the following command:
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to 8080

Add these two lines in /etc/network/interfaces:
pre-up iptables-restore < /etc/iptables.rules
post-down iptables-save > /etc/iptables.rules


$ sudo sh -c "iptables-save > /etc/iptables.rules"
Then I created a file `/etc/network/if-pre-up.d/restore:
#!/bin/sh
iptables-restore < /etc/iptables.rules
... and flagged it executable
$ sudo chmod 755 /etc/network/if-pre-up.d/restore



============
sudo iptables -A PREROUTING -t nat -p tcp --dport 80 -j REDIRECT --to-ports 8080
does not work for self ip

use the OUTPUT chain as the packets meant for the loopback interface do not pass via the PREROUTING chain. The following command should work:
sudo iptables -t nat -A OUTPUT -o lo -p tcp --dport 80 -j REDIRECT --to-port 8080

===============

Instead of the iptables, You could try:
sudo ssh -gL 80:127.0.0.1:8080 localhost


-------------------------
sudo iptables -vL INPUT -n

