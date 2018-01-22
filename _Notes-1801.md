
## Bootstrap 4.0.0 on live machine
```sh
sudo mkdir -v -p /10-Base
sudo chown -v 999:999 /10-Base
mkdir -v -p /10-Base/ruby-gems

sudo apt-get install build-essential manpages-dev ruby-full zlib1g-dev openjdk-8-jre

# wget https://nodejs.org/dist/v8.9.4/node-v8.9.4-linux-x64.tar.xz
## Manually extract and rename

sudo ln -vsT /10-Base/node/bin/node /bin/node
sudo ln -vsT /10-Base/node/bin/npm /bin/npm

npm install -g grunt-cli
sudo ln -s /10-Base/node/lib/node_modules/grunt-cli/bin/grunt /bin/grunt

sudo gem install bundler

pushd /media/ubuntu-mate/70_Current/Work/bootstrap4/bootstrap-4.0.0
npm install jquery popper.js
npm install

# sudo bundle install
bundle install --path /10-Base/ruby-gems/bundle

npm run dist
npm run docs
npm run docs-serve

http://localhost:9001


# /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0
```
