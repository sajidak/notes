# Building Bootstrap 4.0 locally
`07-Oct-2017 1224:10:43 +0530`

> for version v4.3.0, updated on 2019 Feb 13
***

## Notes:
- Bootstrap is dependent on jQuery and Popper
	- https://jquery.com/
	- https://popper.js.org/

***
## v 4.3.0
### Pre-Requisites
- [ ] `sudo apt-get install build-essential manpages-dev zlib1g-dev`
	- To verify installation
		```
		dpkg --list | grep -i build-essential
		dpkg --list | grep -i manpages-dev
		dpkg --list | grep -i zlib1g-dev
		dpkg --list | grep -i ruby-full

		build-essential   12.4ubuntu1             amd64  Informational list of build-essential packages
		manpages-dev      4.15-1                  all    Manual pages about using GNU/Linux for development
		zlib1g-dev:amd64  1:1.2.11.dfsg-0ubuntu2  amd64  compression library - development
		ruby-full         1:2.5.1                 all    Ruby full installation (default version)
		```

- [ ] nodejs
	- `node -v` = v11.9.0

- [ ] `npm install -g grunt-cli`
	- `sudo ln -s /20-DEV/node/lib/node_modules/grunt-cli/bin/grunt /bin/grunt`
	- `grunt -v` = grunt-cli: The grunt command line interface (v1.3.2)

- [ ] Ruby
	- `sudo apt-get install ruby-full`
	- `ruby -v` = ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]
	- `v2.5.1p57` source `v2.5.1` as on `Sun, 15-Jul-2018 15:16:07.649 +0530`

- [ ] Bundler
	- `sudo gem install bundler`
	- `bundler -v` = Bundler version 1.16.3


### Setup/Update Environment

- `pushd /media/sak/70_Current/Work/bootstrap4/bootstrap-4.3.0`
	- **Important:** Set working folder before proceeding.

- [ ] `npm install`
	- to install local dependencies listed in package.json
	- Run this on installed OS
	- "Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info."
	- "Update available 5.6.0 → 6.2.0, Run `npm i -g npm` to update"

- [ ] `bundle install`
	- Ruby dependencies, such as Jekyll and plugins
	- Run this on installed OS
	- Bundle complete! 4 Gemfile dependencies, 31 gems now installed.
	- Use `bundle info [gemname]` to see where a bundled gem is installed.

### Build
> Each time the source file is updated.

- Update Source files
`cp -vf /media/sak/70_Current/Work/fsap_utils/bootstrap-custom/_custom-ramazan-firament.scss scss/_custom.scss`

- `pushd /media/sak/70_Current/Work/bootstrap4/bootstrap-4.3.0`
	- **Important:** Set working folder before proceeding.

- `npm run dist`

### NPM scripts and Tasks

| Task         | Description                                                                                                                      |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| npm run dist | npm run dist creates the /dist directory with compiled files. Uses Sass, Autoprefixer, and UglifyJS.                             |
| npm run docs | Builds and tests CSS, JavaScript, and other assets which are used when running the documentation locally via npm run docs-serve. |
| npm test     | Run npm test to run tests locally and compile the CSS and JavaScript into /dist. Uses Sass, Autoprefixer, and UglifyJS.          |

- Run `npm run` to see all the npm scripts.

### Local documentation, for
- From the root `/bootstrap` directory, run `npm run docs-serve` in the command line.
- Open http://localhost:9001 in your browser, and voilà.

### TODO
- Add consolidated commands to verify versions of all dependencies.

## Verify
- Commands
```sh
gcc --version
npm list -g grunt-cli
gem list bundler
```
- Output
```
gcc (Ubuntu 6.2.0-5ubuntu12) 6.2.0 20161005
Copyright (C) 2016 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

/20-DEV/node/lib
`-- grunt-cli@1.2.0

*** LOCAL GEMS ***

bundler (1.16.0.pre.3, 1.15.4)
```

## Shell Script
**Commands executed, to make a shell script**
> out of date, needs to be updated
```sh
LOGROOT=/media/sak/70_Current/Work/bootstrap4/bootstrap-4.3.0/build-logs
BS4ROOT=/media/sak/70_Current/Work/bootstrap4/bootstrap-4.3.0/

pushd ${BS4ROOT}
mkdir -p ${LOGROOT}
sudo apt-get install build-essential manpages-dev liblzma-dev zlib1g-dev ruby-full 2>&1 | tee ${LOGROOT}/10-Repos.log;
# or sudo dpkg -1 ../downloads/packages/
npm install -g grunt-cli 2>&1 | tee ${LOGROOT}/20-a-npm-cli.log;
sudo gem install bundler 2>&1 | tee ${LOGROOT}/30-ruby-bundler.log;
npm install              2>&1 | tee ${LOGROOT}/40-npm-install-b.log;
bundle install           2>&1 | tee ${LOGROOT}/50-bundler-install.log;
npm run dist             2>&1 | tee ${LOGROOT}/60-build-dist.log;
npm run docs-serve       2>&1 | tee ${LOGROOT}/80-server-docs.log;

# Verification
gcc --version            2>&1 | tee -a ${LOGROOT}/00-verify.log;
npm list -g grunt-cli    2>&1 | tee -a ${LOGROOT}/00-verify.log;
gem list                 2>&1 | tee -a ${LOGROOT}/00-verify.log;
bundle info bundler      2>&1 | tee -a ${LOGROOT}/00-verify.log;
# Use `bundle info [gemname]` to see where a bundled gem is installed.
```


## Notes:

## Strucrure for Command Output, Suggested
see output log files in `${LOGROOT}`

```
# Command Outputs:
## Prerequisites
### sudo apt-get install build-essential manpages-dev liblzma-dev zlib1g-dev 2>&1 | tee ${LOGROOT}/10-Repos.log;
	`sudo dpkg -i ../downloads/packages/*.deb`

## Ruby
### Ruby, from repo
#### sudo apt-get install ruby-full

### Ruby, from Source
##### `./configure --prefix=/20-DEV/Ruby`
##### `make`
##### sudo make install 2>&1 | tee make-install.log

## Environment setup
### npm install -g grunt-cli
### sudo gem install bundler
### npm install
### bundle install

## Verification
### gcc --version
### npm list -g grunt-cli
### gem list
### bundle info bundler

## Build
### npm run dist
### npm run docs-serve
```

***
