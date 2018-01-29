# mySql Server
`28 Jan 2018`

## Commands for SystemD
| Command                           | Result                                           |
|:--------------------------------- |:------------------------------------------------ |
| `sudo systemctl start mysql`      | Start Server                                     |
| `sudo systemctl stop mysql`       | Stop Server                                      |
| `sudo systemctl status mysql`     | Show current status of the server                |
| `sudo systemctl restart mysql`    | Restart Server                                   |
| `sudo journalctl -u mysql`        | Show last few lines of Server log                |
| `sudo journalctl -u mysql -f`     | Like tail, continues till (Q)uit                 |
| `sudo systemctl disable mysql`    | Turn off auto-start on stsyem boot               |
| `sudo systemctl is-enabled mysql` | Show current setting for autostart               |
| `sudo systemctl status`           | Show status Formatted all services on the system |

- `poweroff` - Shutdown the machine
- see also other commands for SystemD

**Alternate Commands for Upstart**
```sh
sudo service mysql start
sudo service mysql stop
sudo service mysql status
```

## Notes:
- http://upstart.ubuntu.com/cookbook/
- To turn off autostart. with Upstart
	- `sudo echo "manual" >> /etc/init/mysql.override`
	- OR
	- Comment line in /etc/init/mysql.conf
	- `start on runlevel [2345]`
- Tool to manage services on linux
	- `sudo apt-get install sysv-rc-conf`
- Identify init system
	- `sudo stat /proc/1/exe`
	- `ps -p 1 -o`

---

## MySQL
### System Variables
https://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html
- see the values that a server will use based on its compiled-in defaults and any option files that it reads
	- `mysqld --verbose --help`
- see the values that a server will use based on its compiled-in defaults, ignoring the settings in any option files
	- `mysqld --no-defaults --verbose --help	`

https://dev.mysql.com/doc/refman/5.7/en/server-options.html
- SQL Query / Prompt
	- SHOW VARIABLES
	- SHOW SESSION VARIABLES
	- SHOW GLOBAL VARIABLES


### Customize data Directory
- edit `/etc/mysql/mysql.conf.d/mysqld.cnf`
- set value in line `datadir = /var/lib/mysql`

### Listen on all Ports
Listen on all interfaces, not just localhost.
https://www.howtoforge.com/tutorial/ubuntu-perfect-server-with-apache-php-myqsl-pureftpd-bind-postfix-doveot-and-ispconfig/
1. edit `/etc/mysql/mysql.conf.d/mysqld.cnf`
2. comment line `bind-address = 127.0.0.1`
3. add line `sql-mode="NO_ENGINE_SUBSTITUTION"`

---
