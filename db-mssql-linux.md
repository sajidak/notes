# SQL Server on Linux
> Mon, 2019 Jul 01
> https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-2017

SA = f5EE47@c9e34d8b@4fcd8943

## Notes:
- If you want to use a separate backing filesystem from the one used by /var/lib/,
	- format the filesystem and mount it into /var/lib/docker.
	- Make sure add this mount to /etc/fstab to make it permanent.
- Links
	- https://github.com/microsoft/mssql-docker/blob/master/linux/mssql-tools/Dockerfile
	- https://hub.docker.com/_/microsoft-mssql-server
	- https://hub.docker.com/_/microsoft-mssql-tools
	- https://blogs.msdn.microsoft.com/sql_server_team/installing-sql-server-2017-for-linux-on-ubuntu-18-04-lts/


## Install on Linux, Local
> https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-2017

### Install SQL Server
```sh
# Import the public repository GPG keys:
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Register the Microsoft SQL Server Ubuntu repository:
# sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list)"
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/ubuntu/18.04/prod)"
## deb [arch=amd64] https://packages.microsoft.com/ubuntu/18.04/prod xenial main

# install SQL Server:
sudo apt-get update
sudo apt-get install -y mssql-server

# run mssql-conf setup - set the SA password, choose edition [Evaluation | Developer | Express].
sudo /opt/mssql/bin/mssql-conf setup

# verify service is running:
systemctl status mssql-server --no-pager

systemctl restart mssql-server.service
systemctl start mssql-server.service
systemctl stop mssql-server.service
```

### Install the SQL Server command-line tools
```bash
# Import the public repository GPG keys.
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Register the Microsoft Ubuntu repository.
# curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
## deb [arch=amd64] https://packages.microsoft.com/ubuntu/18.04/prod bionic main

# Update the sources list and run the installation command with the unixODBC developer package.
sudo apt-get update
sudo apt-get install mssql-tools unixodbc-dev

# Add /opt/mssql-tools/bin/ to your PATH
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc
```

### Commands as-is
```bash
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list)"
sudo apt-get update

sudo apt-get install -y mssql-server

sudo /opt/mssql/bin/mssql-conf setup
systemctl status mssql-server --no-pager

```

### Commands Optimized
```bash
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
# fix repos before running this.
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/ubuntu/18.04/prod bionic main"
sudo apt-get update

sudo apt-get install -y mssql-server

sudo /opt/mssql/bin/mssql-conf setup
systemctl status mssql-server --no-pager

```

### Connect Locally
```bash
sqlcmd -S localhost -U SA -P '<YourPassword>'
## omit the password on the command line to be prompted to enter it.


```


## Install on Linux, with Docker
> https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-2017&pivots=cs1-bash
> Assumes Docker Engine 1.8+ is installed

```bash
# Pull the SQL Server 2017 Linux container image from Microsoft Container Registry.
sudo docker pull mcr.microsoft.com/mssql/server:2017-latest

# To run the container image with Docker
sudo docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=<YourStrong!Passw0rd>' \
   -p 1433:1433 --name sql1 \
   -d mcr.microsoft.com/mssql/server:2017-latest

# To view your Docker containers, use the docker ps command.
sudo docker ps -a
## Setting -h and --name to the same value is a good way to easily identify the target container.

# Change the SA password
sudo docker exec -it sql1 /opt/mssql-tools/bin/sqlcmd \
   -S localhost -U SA -P '<YourStrong!Passw0rd>' \
   -Q 'ALTER LOGIN SA WITH PASSWORD="<YourNewStrong!Passw0rd>"'

# Connect to SQL Server, inside the container
sudo docker exec -it sql1 "bash"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P '<YourNewStrong!Passw0rd>'

# Connect from outside the container
sqlcmd -S <ip_address>,1433 -U SA -P '<YourNewStrong!Passw0rd>'
## Assumes sqlcmd tool is installed
## When finished, type QUIT.

```
