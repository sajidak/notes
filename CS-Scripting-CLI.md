# C-Sharp Scripts

## Links
- https://github.com/filipw/dotnet-script
- https://github.com/oleg-shilo/cs-script
- http://scriptcs.net/
- https://github.com/scriptcs/scriptcs

## Installation
- https://github.com/filipw/dotnet-script/releases
- https://raw.githubusercontent.com/filipw/dotnet-script/master/install/install.sh
```sh
curl -L https://github.com/filipw/dotnet-script/releases/download/$version/dotnet-script.$version.zip > /tmp/dotnet-script/dotnet-script.zip
unzip -o /tmp/dotnet-script/dotnet-script.zip -d /usr/local/lib
chmod +x /usr/local/lib/dotnet-script/dotnet-script.sh
cd /usr/local/bin
ln -sfn /usr/local/lib/dotnet-script/dotnet-script.sh dotnet-script
```
- or `dotnet tool install -g dotnet-script`
	- Needs '~/.dotnet/tools' in PATH
	- or Needs link in '/usr/local/bin'
