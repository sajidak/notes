# Building Bootstrap 4.0 locally
`07-Oct-2017 1224:10:43 +0530`

**Contents:**
<!-- MDTOC maxdepth:6 firsth1:0 numbering:0 flatten:0 bullets:1 updateOnSave:1 -->

- [Notes:](#notes)
- [Pre-Requisites](#pre-requisites)
- [Setup/Update Environment](#setupupdate-environment)
- [Build](#build)
- [Local documentation, for](#local-documentation-for)
- [Install Ruby from Source](#install-ruby-from-source)
   - [Depends](#depends)
   - [Steps:](#steps)
   - [NOTE:](#note)
- [Verify](#verify)
- [Shell Script](#shell-script)
- [Notes:](#notes)
- [Strucrure for Command Output, Suggested](#strucrure-for-command-output-suggested)

<!-- /MDTOC -->

## Notes:


***
# Setup Build Tool chain
## Pre-Requisites
- `sudo apt-get install build-essential manpages-dev`
- `npm install -g grunt-cli`
	- `sudo ln -s /20-DEV/node/lib/node_modules/grunt-cli/bin/grunt /bin/grunt`
- Ruby
	- from Repo
		- `sudo apt-get install ruby-full`
		- v`1:2.3.3: all` source v`2.4.2` as on `Thu, 16-Nov-2017 13:54:16.851 +0530`
	- from source
		- see section **Install Ruby from Source**
	- using third-party tools
		- https://bitbucket.org/jonforums/uru
		- check later
- `sudo gem install bundler`

## Setup/Update Environment
**Important:** Set working folder before proceeding.
`pushd /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-beta`
- `npm install jquery popper.js`
	- to fix broken syntax, check again after next release
- `npm install`
	- from root /bootstrap directory
- `sudo bundle install`
	- Depends on `sudo apt-get install build-essential manpages-dev`
	- **Consider** Moving this section to Pre-Reqs
	- Try install with prefix to project directory
	- bundle install --path vendor/bundle

## Build

- Update Source files
	`cp -vf /media/sak/70_Current/Work/fsap_utils/bootstrap-custom/_custom-ramazan-firament.scss /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-beta.2/scss/_custom.scss`

| Task         | Description                                                                                                                      |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| npm run dist | npm run dist creates the /dist directory with compiled files. Uses Sass, Autoprefixer, and UglifyJS.                             |
| npm run docs | Builds and tests CSS, JavaScript, and other assets which are used when running the documentation locally via npm run docs-serve. |
| npm test     | Run npm test to run tests locally and compile the CSS and JavaScript into /dist. Uses Sass, Autoprefixer, and UglifyJS.          |


## Local documentation, for
- From the root `/bootstrap` directory, run `npm run docs-serve` in the command line.
- Open http://localhost:9001 in your browser, and voilà.



***
## Install Ruby from Source
- To compile using Microsoft Visual C++, read [win32/README.win32](https://github.com/ruby/ruby/blob/trunk/win32/README.win32)
### Depends
- `sudo apt-get install build-essential manpages-dev`
### Steps:
- Download and unpack a tarball
	- https://www.ruby-lang.org/en/downloads/
	- ~~https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.gz~~
	- https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.gz
	- ~~`a330e10d5cb5e53b3a0078326c5731888bb55e32c4abfeb27d9e7f8e5d000250 ruby-2.4.1.tar.gz`~~
	- 93b9e75e00b262bc4def6b26b7ae8717efc252c47154abb7392e54357e6c8c9c    ruby-2.4.2.tar.gz
	- see `man shasum`
- `cd <go to ruby source folder>`
	- `pushd /media/sak/70_Current/Work/bootstrap4/ruby-2.4.2`
- `./configure`
	- or `./configure 2>&1 | tee a-configure.log`
	- `./configure --prefix=/20-DEV/Ruby  2>&1 | tee a-configure.log`
- `make`
	- or `sudo make 2>&1 | tee b-make.log`
- `sudo make install`
	- or `sudo make install 2>&1 | tee c-make-install.log`
	- By default, this will install Ruby into `/usr/local`
		- To change, pass the `--prefix=DIR` option to the `./configure` script
		- sudo ln -s /20-DEV/Ruby/<gem-xyz> /bin/<ruby-xyz>`
		```sh
		RUBYBIN="/20-DEV/Ruby/bin"
		for f in $(ls -1 ${RUBYBIN});
		do
		    echo "ln -s /bin/${f}";
		    sudo ln -s ${RUBYBIN}/${f} /bin/${f};
		done
		```
		- repeat for all
- `popd` to return back to bootstrap directory

### BUILD Failure
in `make install` command
```
make[2]: Entering directory '/media/sak/70_Current/Work/bootstrap4/ruby-2.4.2/ext/syslog'
make[2]: Leaving directory '/media/sak/70_Current/Work/bootstrap4/ruby-2.4.2/ext/syslog'
*** Following extensions failed to configure:
../.././ext/dbm/extconf.rb:0: Failed to configure dbm. It will not be installed.
../.././ext/gdbm/extconf.rb:0: Failed to configure gdbm. It will not be installed.
../.././ext/openssl/extconf.rb:0: Failed to configure openssl. It will not be installed.
../.././ext/readline/extconf.rb:0: Failed to configure readline. It will not be installed.
../.././ext/zlib/extconf.rb:0: Failed to configure zlib. It will not be installed.
*** Fix the problems, then remove these directories and try again if you want.
```
### NOTE:
- check which programs need to be in global namespace for ruby to work as expected
- `sudo gem install bundler` is **failing**, need to debug

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
```sh
LOGROOT=/media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-beta/build-logs
BS4ROOT=/media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-beta/

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
