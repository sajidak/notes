# Docker on Ubuntu

## Links
- https://www.howtoforge.com/tutorial/ubuntu-docker/
- https://tecadmin.net/install-docker-on-ubuntu/
- https://docs.docker.com/storage/volumes/#choose-the--v-or---mount-flag
- Read List (Mon, 2019 Jul 01)
	- https://docs.docker.com/install/
	- https://docs.docker.com/storage/storagedriver/overlayfs-driver/#configure-docker-with-the-overlay-or-overlay2-storage-driver
	- Quickstart: Compose and ASP.NET Core with SQL Server
		- https://docs.docker.com/compose/aspnet-mssql-compose/
	- Create C# apps using SQL Server on Ubuntu
		- https://www.microsoft.com/en-us/sql-server/developer-get-started/csharp/ubuntu

## Gen notes
- If you don’t have a Docker account, sign up for one at hub.docker.com.
	- Docker’s public registry is free and pre-configured

## cheat sheet
```bash
## List Docker CLI commands
docker
docker container --help

## Display Docker version and info
docker --version
docker version
docker info

## Execute Docker image
docker run hello-world

## List Docker images
docker image ls

## List Docker containers (running, all, all in quiet mode)
docker container ls
docker container ls --all
docker container ls -aq
```

## Install
```bash
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common;

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable";

sudo apt-get install docker-ce docker-ce-cli containerd.io;

sudo docker run hello-world;

sudo systemctl status docker;
sudo systemctl stop docker;
sudo systemctl start docker;
```

### Notes
- /etc/docker/daemon.json
```json
{
  "storage-driver": "overlay2"
}
```
