# mySql Server
`28 Jan 2018`

**Also See:**

- https://dbmstools.com/database-er-diagram-tools/oracle
- https://dbmstools.com/data-modeling-tools/mysql

## Start error on live
- Run before starting
	- try `sudo chmod +r /var/lib/mysql/debian-5.7.flag`
	- try `sudo chmod +w /var/lib/mysql/debian-5.7.flag`
	- `sudo chmod +rw -R /var/lib/mysql/`
- For debugging, identify the specific permissions needed
	- `-rw-r--r-- 1 root  root         0 Mar  3 17:50 debian-5.7.flag`
	- Configs used:
		- `/etc/mysql/mysql.conf.d/mysqld.cnf`
		- log = `/var/log/mysql/error.log`
- For support
	- `sudo journalctl -u mysql -f`

## Worked - get default secure DB accessible
```sql
CREATE USER 'sak'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'sak'@'localhost';
GRANT GRANT OPTION ON * . * TO 'sak'@'localhost';
SHOW GRANTS for sak@localhost;
FLUSH PRIVILEGES;
SELECT User, Host, plugin, password_expired, password_last_changed, password_lifetime, account_locked  FROM mysql.user;
```

### Interesting Queries
```sql
SELECT * FROM INFORMATION_SCHEMA.SCHEMATA;
SELECT * FROM INFORMATION_SCHEMA.TABLES;
SELECT * FROM INFORMATION_SCHEMA.VIEWS;
SELECT * FROM INFORMATION_SCHEMA.COLUMNS;
SELECT * FROM INFORMATION_SCHEMA.TRIGGERS;
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE;
```

## Steps to prep database on live
```sql
-- Create database
CREATE DATABASE IF NOT EXISTS `sql-dev`;
USE `sql-dev`;
show databases;

-- Create Users
CREATE USER 'sql-dev-adm'@'%' IDENTIFIED BY 'admPWD180325';
CREATE USER 'sql-dev-usr'@'%' IDENTIFIED BY 'usrPWD180325';


-- Grant Privilages
GRANT USAGE ON *.* TO 'sql-dev-adm'@'%';
GRANT USAGE ON *.* TO 'sql-dev-usr'@'%';

GRANT ALL PRIVILEGES ON `sql-dev`.* TO 'sql-dev-adm'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES, EXECUTE, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EVENT, TRIGGER ON `sql-dev`.* TO 'sql-dev-usr'@'%';

FLUSH PRIVILEGES;

```

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
```sh {.numberLines}
sudo service mysql start
sudo service mysql stop
sudo service mysql status
```

## Notes:
- http://upstart.ubuntu.com/cookbook/
- To turn off autostart. with Upstart
	- `sudo echo "manual" | sudo tee -a /etc/init/mysql.override`
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

### Variable Assignment
https://dev.mysql.com/doc/refman/5.7/en/set-variable.html
```sql
-- GLOBAL
SET GLOBAL max_connections = 1000;
SET @@global.max_connections = 1000;
---SESSION
SET SESSION sql_mode = 'TRADITIONAL';
SET @@session.sql_mode = 'TRADITIONAL';
SET @@sql_mode = 'TRADITIONAL';
-- USER
SET @name = 43;
```

### Variable of Interest
| Name                   | Cmd-Line | Option File | System Var | Var Scope | Dynamic |
| ---------------------- | -------- | ----------- | ---------- | --------- | ------- |
| lower_case_file_system | -        | -           | Yes        | Global    | No      |

#### `--lower-case-table-names`
- https://dev.mysql.com/doc/refman/5.7/en/identifier-case-sensitivity.html
- Global Scope, Not Dynamic


| Value | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| ----- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 0     | Table and database names are stored on disk using the lettercase specified in the CREATE TABLE or CREATE DATABASE statement. Name comparisons are case sensitive. You should not set this variable to 0 if you are running MySQL on a system that has case-insensitive file names (such as Windows or OS X). If you force this variable to 0 with --lower-case-table-names=0 on a case-insensitive file system and access MyISAM tablenames using different lettercases, index corruption may result. |
| 1     | Table names are stored in lowercase on disk and name comparisons are not case-sensitive. MySQL converts all table names to lowercase on storage and lookup. This behavior also applies to database names and table aliases.                                                                                                                                                                                                                                                                           |
| 2     | Table and database names are stored on disk using the lettercase specified in the CREATE TABLE or CREATE DATABASE statement, but MySQL converts them to lowercase on lookup. Name comparisons are not case sensitive. This works only on file systems that are not case-sensitive! InnoDB table names are stored in lowercase, as for lower_case_table_names=1.                                                                                                                                       |

**Defaults:** NIX = 0, WIN = 1, OSX = 2

- If **`lower_case_table_names=1`**
	- Table names are stored in lowercase on disk
	- Name comparisons are not case-sensitive
	- MySQL converts all table names to lowercase on storage and lookup
	- Also applies to database names and table aliases

### `--bind-address=addr`
- If the address is `*`, the server accepts TCP/IP connections on all server host IPv6 and IPv4 interfaces if the server host supports IPv6, or accepts TCP/IP connections on all IPv4 addresses otherwise. Use this address to permit both IPv4 and IPv6 connections on all server interfaces. This value is the default.
- If the address is `0.0.0.0`, the server accepts TCP/IP connections on all server host IPv4 interfaces.
- If the address is `::`, the server accepts TCP/IP connections on all server host IPv4 and IPv6 interfaces.
- If the address is an IPv4-mapped address, the server accepts TCP/IP connections for that address, in either IPv4 or IPv6 format. For example, if the server is bound to `::ffff:127.0.0.1`, clients can connect using `--host=127.0.0.1` or `--host=::ffff:127.0.0.1`.
- If the address is a “regular” IPv4 or IPv6 address (such as `127.0.0.1` or `::1`), the server accepts TCP/IP connections only for that IPv4 or IPv6 address.



### Customize data Directory
> Obsolete - 'Change `data-dir`'

- edit `/etc/mysql/mysql.conf.d/mysqld.cnf`
- set value in line `datadir = /var/lib/mysql`

### ~~Listen on all Ports~~
> Obsolete - see `--bind-address=addr`

https://www.howtoforge.com/tutorial/ubuntu-perfect-server-with-apache-php-myqsl-pureftpd-bind-postfix-doveot-and-ispconfig/

Listen on all interfaces, not just localhost.

1. edit `/etc/mysql/mysql.conf.d/mysqld.cnf`
2. comment line `bind-address = 127.0.0.1`
3. add line `sql-mode="NO_ENGINE_SUBSTITUTION"`

---

## Command Line Ops
- https://coolestguidesontheplanet.com/import-export-mysql-database-command-line/
- https://www.digitalocean.com/community/tutorials/how-to-import-and-export-databases-and-reset-a-root-password-in-mysql

### Export
```sh {.numberLines}
mysqldump -u [username] -p [database-you-want-to-dump] > [path-to-place-data-dump]
mysqldump [database_name] > database_exportname.sql
mysqldump --all-databases > all_databases_export.sql
```

### Import
```sh {.numberLines}
# Database should exist before import can be done
mysql [database_name] < database_exportname.sql
mysql --one-database [database_name] < all_databases_export.sql
```

### Database
- https://dev.mysql.com/doc/refman/5.7/en/creating-database.html
```sql {.numberLines  startFrom="20"}
-- command to initiate mysql session
-- mysql -h host -u user -p
-- mysql -h host -u user -p [db_name]

CREATE DATABASE IF NOT EXISTS [db_name];
USE [db_name]

show databases;

CREATE SCHEMA `sql-dev` ;

create user [db_user];
grant all on [db_name].* to '[db_user]'@'localhost' identified by '[db_password]';

-- better and granular option
-- grant select, insert, delete, update on db_name.* to 'db_user'@'localhost' identified by 'db_password';

```

### Users and Privilages
- https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql
```sql {.numberLines}
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';

-- will grant root level privilages
GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';

-- specific privilages
GRANT type_of_permission ON database_name.table_name TO 'username'@'localhost';
GRANT type_of_permission ON database_name.* TO 'username'@'localhost';
REVOKE type_of_permission ON database_name.table_name FROM 'username'@'localhost';

-- List
SHOW GRANTS [username];

-- Save changes
FLUSH PRIVILEGES;

-- quit
quit
```

#### Privilages
- `ALL PRIVILEGES` - allows a MySQL user full access to a designated database (or if no database is selected, global access across the system)
- `CREATE` - allows them to create new tables or databases
- `DROP` - allows them to them to delete tables or databases
- `DELETE` - allows them to delete rows from tables
- `INSERT` - allows them to insert rows into tables
- `SELECT` - allows them to use the SELECT command to read through databases
- `UPDATE` - allow them to update table rows
- `GRANT OPTION` - allows them to grant or remove other users' privileges

#### Export and Import scripts
- View

	```sql
	select Host, user, password from user ;
	SHOW GRANTS FOR 'user'@'localhost';
	```
- **Try**: Script to export users, grants

	```sql
	echo "SELECT DISTINCT CONCAT (\"show grants for '\", user, \"'@'\", host, \"';\") AS query FROM mysql.user; " >   script.sql
	echo "*** You will be asked to enter the root password twice ******"
	mysql -u root -p  < script.sql > output.sql ;
	cat output.sql | grep show > output1.sql  ; rm output.sql -f ;
	mysql -u root -p  < output1.sql > output.sql ;
	clear
	echo "-----Exported Grants-----"
	cat  output.sql ; rm  output.sql   output1.sql -f
	echo "-------------------------"
	rm  script.sql -f
	```

- **Try**: Script to generate export script

	```sql
	mysql -B -N -uroot -p -e "SELECT CONCAT('\'', user,'\'@\'', host, '\'') FROM user WHERE user != 'debian-sys-maint' AND user != 'root' AND user != ''" mysql > mysql_all_users.txt
	```

### Batch Script
https://dev.mysql.com/doc/refman/5.7/en/mysql-batch-commands.html

- From Shell
	```sh {.numberLines}
	mysql -h host -u user -p < batch-file
	# or, for specific database
	mysql -h host -u user -p -D [database-name] < batch-file
	# or
	mysql < batch-file > mysql.out
	```
	- `mysql -t` for interactive output format in batch mode
	- `mysql -v` to echo to the output the statements that are executed

- from MySQL prompt
	```sql {.numberLines}
	source filename;
	-- or
	\. filename
	```
- Sometimes you may want your script to display progress information to the user.
	- For this you can insert statements like this:
	- `SELECT '<info_to_display>' AS ' ';`
	- The statement shown outputs `<info_to_display>` to the terminal.


### Change `data-dir`
- https://dev.mysql.com/doc/refman/5.7/en/mysql-install-db.html
-  **important:** make sure that the database directories and files are owned by the mysql login account so that the server has read and write access to them
```sh {.numberLines}
cd BASEDIR
## Options
bin/mysqld --initialize
bin/mysqld --initialize-insecure
bin/mysqld --initialize --user=mysql
         --basedir=/opt/mysql/mysql
         --datadir=/opt/mysql/mysql/data
bin/mysqld --defaults-file=/opt/mysql/mysql/etc/my.cnf
         --initialize --user=mysql


# connect when no password is set
mysql -u root --skip-password
ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';

# TEST INSTALLATION
bin/mysqladmin version
bin/mysqladmin variables
bin/mysqladmin -u root -p shutdown

## Verify the server can be started
bin/mysqld_safe --user=mysql &

mysqlshow # to see what databases exist

# for anonymous accounts
SET PASSWORD FOR ''@'localhost' = PASSWORD('new_password');
```

- /opt/mysql/mysql/etc/my.cnf
- `--defaults-file=/opt/mysql/mysql/etc/my.cnf`
	```txt {.numberLines}
	[mysqld]
	basedir=/opt/mysql/mysql
	datadir=/opt/mysql/mysql/data
	```

---

# Visual Query Designer
- https://sourceforge.net/projects/sqleo/
	- `SQLeoVQB.2017.09.rc1.zip`
- http://www.navicat.com/en/products/navicat_mysql/mysql_overview.html
- http://www.sequelpro.com/
- http://www.heidisql.com/
- https://www.devart.com/dbforge/mysql/querybuilder/
- https://www.sqlmaestro.com/products/mysql/codefactory/
- https://www.activedbsoft.com/overview-querytool.html
	- sqlquerytool.zip


---
