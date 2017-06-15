# Building Bootstrap 4.0 locally
`Sat, 13-May-2017 21:05:57 +0530`

[TOC]

## Notes:
- npm WARN deprecated minimatch@2.0.10: Please update to minimatch 3.0.2 or higher to avoid a RegExp DoS issue
- npm WARN deprecated minimatch@0.3.0: Please update to minimatch 3.0.2 or higher to avoid a RegExp DoS issue

***
# Setup Pre-Requisites
- `sudo apt-get install build-essential manpages-dev`
- `npm install -g grunt-cli`
	- `sudo ln -s /20-DEV/node/lib/node_modules/grunt-cli/bin/grunt /bin/grunt`
- Ruby
	- from Repo
		- `sudo apt-get install ruby-full`
		- v`1:2.3.0+4: all` source v`2.4.1` as on `Sat, 13-May-2017 20:05:03 +0530`
	- from source
		- see section **Install Ruby from Source**
	- using third-party tools
		- https://bitbucket.org/jonforums/uru
		- check later
- `sudo gem install bundler`

## sudo apt-get install build-essential manpages-dev
```
Reading package lists... Done
Building dependency tree
Reading state information... Done
manpages-dev is already the newest version (4.07-1).
manpages-dev set to manually installed.
The following additional packages will be installed:
  g++ g++-6 libc-dev-bin libc6-dev libstdc++-6-dev linux-libc-dev
Suggested packages:
  g++-multilib g++-6-multilib gcc-6-doc libstdc++6-6-dbg glibc-doc libstdc++-6-doc
The following NEW packages will be installed:
  build-essential g++ g++-6 libc-dev-bin libc6-dev libstdc++-6-dev linux-libc-dev
0 upgraded, 7 newly installed, 0 to remove and 16 not upgraded.
Need to get 12.0 MB of archives.
After this operation, 61.6 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://in.archive.ubuntu.com/ubuntu yakkety-updates/main amd64 libc-dev-bin amd64 2.24-3ubuntu2 [68.5 kB]
Get:2 http://in.archive.ubuntu.com/ubuntu yakkety-updates/main amd64 linux-libc-dev amd64 4.8.0-51.54 [860 kB]
Get:3 http://in.archive.ubuntu.com/ubuntu yakkety-updates/main amd64 libc6-dev amd64 2.24-3ubuntu2 [2,274 kB]
Get:4 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 libstdc++-6-dev amd64 6.2.0-5ubuntu12 [1,416 kB]
Get:5 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 g++-6 amd64 6.2.0-5ubuntu12 [7,380 kB]
Get:6 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 g++ amd64 4:6.1.1-1ubuntu2 [1,478 B]
Get:7 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 build-essential amd64 12.1ubuntu2 [4,758 B]
Fetched 12.0 MB in 6s (1,934 kB/s)
Selecting previously unselected package libc-dev-bin.
(Reading database ... 219620 files and directories currently installed.)
Preparing to unpack .../0-libc-dev-bin_2.24-3ubuntu2_amd64.deb ...
Unpacking libc-dev-bin (2.24-3ubuntu2) ...
Selecting previously unselected package linux-libc-dev:amd64.
Preparing to unpack .../1-linux-libc-dev_4.8.0-51.54_amd64.deb ...
Unpacking linux-libc-dev:amd64 (4.8.0-51.54) ...
Selecting previously unselected package libc6-dev:amd64.
Preparing to unpack .../2-libc6-dev_2.24-3ubuntu2_amd64.deb ...
Unpacking libc6-dev:amd64 (2.24-3ubuntu2) ...
Selecting previously unselected package libstdc++-6-dev:amd64.
Preparing to unpack .../3-libstdc++-6-dev_6.2.0-5ubuntu12_amd64.deb ...
Unpacking libstdc++-6-dev:amd64 (6.2.0-5ubuntu12) ...
Selecting previously unselected package g++-6.
Preparing to unpack .../4-g++-6_6.2.0-5ubuntu12_amd64.deb ...
Unpacking g++-6 (6.2.0-5ubuntu12) ...
Selecting previously unselected package g++.
Preparing to unpack .../5-g++_4%3a6.1.1-1ubuntu2_amd64.deb ...
Unpacking g++ (4:6.1.1-1ubuntu2) ...
Selecting previously unselected package build-essential.
Preparing to unpack .../6-build-essential_12.1ubuntu2_amd64.deb ...
Unpacking build-essential (12.1ubuntu2) ...
Setting up linux-libc-dev:amd64 (4.8.0-51.54) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up libc-dev-bin (2.24-3ubuntu2) ...
Setting up libc6-dev:amd64 (2.24-3ubuntu2) ...
Setting up libstdc++-6-dev:amd64 (6.2.0-5ubuntu12) ...
Setting up g++-6 (6.2.0-5ubuntu12) ...
Setting up g++ (4:6.1.1-1ubuntu2) ...
update-alternatives: using /usr/bin/g++ to provide /usr/bin/c++ (c++) in auto mode
Setting up build-essential (12.1ubuntu2) ...
```
### Verify
- `whereis gcc`
gcc: /usr/bin/gcc /usr/lib/gcc /usr/share/man/man1/gcc.1.gz
- `which gcc`
/usr/bin/gcc
- `gcc --version`
```
gcc (Ubuntu 6.2.0-5ubuntu12) 6.2.0 20161005
Copyright (C) 2016 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

## npm install -g grunt-cli
```
/20-DEV/node/bin/grunt -> /20-DEV/node/lib/node_modules/grunt-cli/bin/grunt
/20-DEV/node/lib
`-- grunt-cli@1.2.0
  +-- findup-sync@0.3.0
  | `-- glob@5.0.15
  |   +-- inflight@1.0.6
  |   | `-- wrappy@1.0.2
  |   +-- inherits@2.0.3
  |   +-- minimatch@3.0.4
  |   | `-- brace-expansion@1.1.7
  |   |   +-- balanced-match@0.4.2
  |   |   `-- concat-map@0.0.1
  |   +-- once@1.4.0
  |   `-- path-is-absolute@1.0.1
  +-- grunt-known-options@1.1.0
  +-- nopt@3.0.6
  | `-- abbrev@1.1.0
  `-- resolve@1.1.7
```

### `sudo ln -s /20-DEV/node/lib/node_modules/grunt-cli/bin/grunt /bin/grunt`

## sudo apt-get install ruby-full
```
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  fonts-lato javascript-common libgmp-dev libgmpxx4ldbl libjs-jquery libruby2.3 libtcltk-ruby rake ri ruby ruby-dev ruby-did-you-mean ruby-minitest ruby-net-telnet ruby-power-assert
  ruby-test-unit ruby2.3 ruby2.3-dev ruby2.3-doc ruby2.3-tcltk rubygems-integration
Suggested packages:
  apache2 | lighttpd | httpd gmp-doc libgmp10-doc libmpfr-dev bundler
The following NEW packages will be installed:
  fonts-lato javascript-common libgmp-dev libgmpxx4ldbl libjs-jquery libruby2.3 libtcltk-ruby rake ri ruby ruby-dev ruby-did-you-mean ruby-full ruby-minitest ruby-net-telnet
  ruby-power-assert ruby-test-unit ruby2.3 ruby2.3-dev ruby2.3-doc ruby2.3-tcltk rubygems-integration
0 upgraded, 22 newly installed, 0 to remove and 16 not upgraded.
Need to get 11.0 MB of archives.
After this operation, 63.8 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 fonts-lato all 2.0-1 [2,693 kB]
Get:2 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 javascript-common all 11 [6,066 B]
Get:3 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 libgmpxx4ldbl amd64 2:6.1.1+dfsg-1 [8,930 B]
Get:4 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 libgmp-dev amd64 2:6.1.1+dfsg-1 [317 kB]
Get:5 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 libjs-jquery all 1.12.4-1 [165 kB]
Get:6 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 rubygems-integration all 1.10 [4,966 B]
Get:7 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 ruby2.3 amd64 2.3.1-5build2 [40.9 kB]
Get:8 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 ruby amd64 1:2.3.0+4 [5,502 B]
Get:9 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 rake all 10.5.0-2 [48.2 kB]
Get:10 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 ruby-did-you-mean all 1.0.0-2 [8,390 B]
Get:11 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 ruby-minitest all 5.9.0-1 [37.0 kB]
Get:12 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 ruby-net-telnet all 0.1.1-2 [12.6 kB]
Get:13 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 ruby-power-assert all 0.3.0-1 [7,952 B]
Get:14 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 ruby-test-unit all 3.1.7-2 [60.3 kB]
Get:15 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 libruby2.3 amd64 2.3.1-5build2 [2,952 kB]
Get:16 http://in.archive.ubuntu.com/ubuntu yakkety/universe amd64 ruby2.3-tcltk amd64 2.3.1-5build2 [275 kB]
Get:17 http://in.archive.ubuntu.com/ubuntu yakkety/universe amd64 libtcltk-ruby all 1:2.3.0+4 [4,098 B]
Get:18 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 ruby2.3-doc all 2.3.1-5build2 [3,326 kB]
Get:19 http://in.archive.ubuntu.com/ubuntu yakkety/universe amd64 ri all 1:2.3.0+4 [4,236 B]
Get:20 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 ruby2.3-dev amd64 2.3.1-5build2 [1,032 kB]
Get:21 http://in.archive.ubuntu.com/ubuntu yakkety/main amd64 ruby-dev amd64 1:2.3.0+4 [4,366 B]
Get:22 http://in.archive.ubuntu.com/ubuntu yakkety/universe amd64 ruby-full all 1:2.3.0+4 [2,564 B]
Fetched 11.0 MB in 5s (2,063 kB/s)
Selecting previously unselected package fonts-lato.
(Reading database ... 202617 files and directories currently installed.)
Preparing to unpack .../00-fonts-lato_2.0-1_all.deb ...
Unpacking fonts-lato (2.0-1) ...
Selecting previously unselected package javascript-common.
Preparing to unpack .../01-javascript-common_11_all.deb ...
Unpacking javascript-common (11) ...
Selecting previously unselected package libgmpxx4ldbl:amd64.
Preparing to unpack .../02-libgmpxx4ldbl_2%3a6.1.1+dfsg-1_amd64.deb ...
Unpacking libgmpxx4ldbl:amd64 (2:6.1.1+dfsg-1) ...
Selecting previously unselected package libgmp-dev:amd64.
Preparing to unpack .../03-libgmp-dev_2%3a6.1.1+dfsg-1_amd64.deb ...
Unpacking libgmp-dev:amd64 (2:6.1.1+dfsg-1) ...
Selecting previously unselected package libjs-jquery.
Preparing to unpack .../04-libjs-jquery_1.12.4-1_all.deb ...
Unpacking libjs-jquery (1.12.4-1) ...
Selecting previously unselected package rubygems-integration.
Preparing to unpack .../05-rubygems-integration_1.10_all.deb ...
Unpacking rubygems-integration (1.10) ...
Selecting previously unselected package ruby2.3.
Preparing to unpack .../06-ruby2.3_2.3.1-5build2_amd64.deb ...
Unpacking ruby2.3 (2.3.1-5build2) ...
Selecting previously unselected package ruby.
Preparing to unpack .../07-ruby_1%3a2.3.0+4_amd64.deb ...
Unpacking ruby (1:2.3.0+4) ...
Selecting previously unselected package rake.
Preparing to unpack .../08-rake_10.5.0-2_all.deb ...
Unpacking rake (10.5.0-2) ...
Selecting previously unselected package ruby-did-you-mean.
Preparing to unpack .../09-ruby-did-you-mean_1.0.0-2_all.deb ...
Unpacking ruby-did-you-mean (1.0.0-2) ...
Selecting previously unselected package ruby-minitest.
Preparing to unpack .../10-ruby-minitest_5.9.0-1_all.deb ...
Unpacking ruby-minitest (5.9.0-1) ...
Selecting previously unselected package ruby-net-telnet.
Preparing to unpack .../11-ruby-net-telnet_0.1.1-2_all.deb ...
Unpacking ruby-net-telnet (0.1.1-2) ...
Selecting previously unselected package ruby-power-assert.
Preparing to unpack .../12-ruby-power-assert_0.3.0-1_all.deb ...
Unpacking ruby-power-assert (0.3.0-1) ...
Selecting previously unselected package ruby-test-unit.
Preparing to unpack .../13-ruby-test-unit_3.1.7-2_all.deb ...
Unpacking ruby-test-unit (3.1.7-2) ...
Selecting previously unselected package libruby2.3:amd64.
Preparing to unpack .../14-libruby2.3_2.3.1-5build2_amd64.deb ...
Unpacking libruby2.3:amd64 (2.3.1-5build2) ...
Selecting previously unselected package ruby2.3-tcltk.
Preparing to unpack .../15-ruby2.3-tcltk_2.3.1-5build2_amd64.deb ...
Unpacking ruby2.3-tcltk (2.3.1-5build2) ...
Selecting previously unselected package libtcltk-ruby.
Preparing to unpack .../16-libtcltk-ruby_1%3a2.3.0+4_all.deb ...
Unpacking libtcltk-ruby (1:2.3.0+4) ...
Selecting previously unselected package ruby2.3-doc.
Preparing to unpack .../17-ruby2.3-doc_2.3.1-5build2_all.deb ...
Unpacking ruby2.3-doc (2.3.1-5build2) ...
Selecting previously unselected package ri.
Preparing to unpack .../18-ri_1%3a2.3.0+4_all.deb ...
Unpacking ri (1:2.3.0+4) ...
Selecting previously unselected package ruby2.3-dev:amd64.
Preparing to unpack .../19-ruby2.3-dev_2.3.1-5build2_amd64.deb ...
Unpacking ruby2.3-dev:amd64 (2.3.1-5build2) ...
Selecting previously unselected package ruby-dev:amd64.
Preparing to unpack .../20-ruby-dev_1%3a2.3.0+4_amd64.deb ...
Unpacking ruby-dev:amd64 (1:2.3.0+4) ...
Selecting previously unselected package ruby-full.
Preparing to unpack .../21-ruby-full_1%3a2.3.0+4_all.deb ...
Unpacking ruby-full (1:2.3.0+4) ...
Setting up ruby2.3-doc (2.3.1-5build2) ...
Setting up libjs-jquery (1.12.4-1) ...
Setting up fonts-lato (2.0-1) ...
Setting up ruby-did-you-mean (1.0.0-2) ...
Processing triggers for libc-bin (2.24-3ubuntu2) ...
Setting up ruby-net-telnet (0.1.1-2) ...
Setting up rubygems-integration (1.10) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up javascript-common (11) ...
Setting up libgmpxx4ldbl:amd64 (2:6.1.1+dfsg-1) ...
Setting up ruby-minitest (5.9.0-1) ...
Processing triggers for fontconfig (2.11.94-0ubuntu2) ...
Setting up ruby-power-assert (0.3.0-1) ...
Setting up libgmp-dev:amd64 (2:6.1.1+dfsg-1) ...
Setting up ruby-test-unit (3.1.7-2) ...
Setting up rake (10.5.0-2) ...
Setting up libruby2.3:amd64 (2.3.1-5build2) ...
Setting up ruby2.3-tcltk (2.3.1-5build2) ...
Setting up ruby2.3 (2.3.1-5build2) ...
Setting up ruby2.3-dev:amd64 (2.3.1-5build2) ...
Setting up ruby-dev:amd64 (1:2.3.0+4) ...
Setting up libtcltk-ruby (1:2.3.0+4) ...
Setting up ruby (1:2.3.0+4) ...
Setting up ri (1:2.3.0+4) ...
Setting up ruby-full (1:2.3.0+4) ...
Processing triggers for libc-bin (2.24-3ubuntu2) ...
```
## sudo gem install bundler
```
Fetching: bundler-1.14.6.gem (100%)
Successfully installed bundler-1.14.6
Parsing documentation for bundler-1.14.6
Installing ri documentation for bundler-1.14.6
Done installing documentation for bundler after 4 seconds
1 gem installed
```


***
# Setup Environment
**Important:** Set working folder before proceeding.
`pushd /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6`
- `npm install`
	- from root /bootstrap directory
- `sudo bundle install`
	- depends on `sudo apt-get install build-essential manpages-dev`
	- **Consider** Moving this section to Pre-Reqs

## npm install
```
npm WARN deprecated minimatch@2.0.10: Please update to minimatch 3.0.2 or higher to avoid a RegExp DoS issue
npm WARN deprecated minimatch@0.3.0: Please update to minimatch 3.0.2 or higher to avoid a RegExp DoS issue
npm WARN prefer global coffee-script@1.10.0 should be installed with -g
npm WARN prefer global jshint@2.8.0 should be installed with -g
npm WARN prefer global node-gyp@3.6.1 should be installed with -g

> iltorb@1.2.1 install /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/node_modules/iltorb
> node-pre-gyp install --fallback-to-build

[iltorb] Success: "/media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/node_modules/iltorb/build/bindings/encode.node" is installed via remote

> phantomjs-prebuilt@2.1.14 install /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/node_modules/phantomjs-prebuilt
> node install.js

PhantomJS not found on PATH
Downloading https://github.com/Medium/phantomjs/releases/download/v2.1.1/phantomjs-2.1.1-linux-x86_64.tar.bz2
Saving to /tmp/phantomjs/phantomjs-2.1.1-linux-x86_64.tar.bz2
Receiving...
  [======================================--] 96%
Received 22866K total.
Extracting tar contents (via spawned process)
Removing /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/node_modules/phantomjs-prebuilt/lib/phantom
Copying extracted folder /tmp/phantomjs/phantomjs-2.1.1-linux-x86_64.tar.bz2-extract-1494665663538/phantomjs-2.1.1-linux-x86_64 -> /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/node_modules/phantomjs-prebuilt/lib/phantom
Writing location.js file
Done. Phantomjs binary available at /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/node_modules/phantomjs-prebuilt/lib/phantom/bin/phantomjs

> node-sass@4.5.2 install /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/node_modules/node-sass
> node scripts/install.js

Downloading binary from https://github.com/sass/node-sass/releases/download/v4.5.2/linux-x64-51_binding.node
Download complete .] - :
Binary saved to /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/node_modules/node-sass/vendor/linux-x64-51/binding.node
Caching binary to /home/sak/.npm/node-sass/4.5.2/linux-x64-51_binding.node

> node-sass@4.5.2 postinstall /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/node_modules/node-sass
> node scripts/build.js

Binary found at /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/node_modules/node-sass/vendor/linux-x64-51/binding.node
Testing binary
Binary is fine
bootstrap@4.0.0-alpha.6 /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6
+-- autoprefixer@6.7.7
| +-- browserslist@1.7.7
| | `-- electron-to-chromium@1.3.10
| +-- caniuse-db@1.0.30000667
| +-- normalize-range@0.1.2
| +-- num2fraction@1.2.2
| +-- postcss@5.2.17
| | +-- js-base64@2.1.9
| | `-- supports-color@3.2.3
| |   `-- has-flag@1.0.0
| `-- postcss-value-parser@3.3.0
+-- babel-eslint@7.2.3
| +-- babel-code-frame@6.22.0
| | `-- js-tokens@3.0.1
| +-- babel-traverse@6.24.1
| | +-- babel-messages@6.23.0
| | +-- babel-runtime@6.23.0
| | | +-- core-js@2.4.1
| | | `-- regenerator-runtime@0.10.5
| | `-- invariant@2.2.2
| |   `-- loose-envify@1.3.1
| +-- babel-types@6.24.1
| | `-- to-fast-properties@1.0.3
| `-- babylon@6.17.1
+-- babel-plugin-transform-es2015-modules-strip@0.1.1
+-- babel-preset-es2015@6.24.1
| +-- babel-plugin-check-es2015-constants@6.22.0
| +-- babel-plugin-transform-es2015-arrow-functions@6.22.0
| +-- babel-plugin-transform-es2015-block-scoped-functions@6.22.0
| +-- babel-plugin-transform-es2015-block-scoping@6.24.1
| | `-- babel-template@6.24.1
| +-- babel-plugin-transform-es2015-classes@6.24.1
| | +-- babel-helper-define-map@6.24.1
| | +-- babel-helper-function-name@6.24.1
| | +-- babel-helper-optimise-call-expression@6.24.1
| | `-- babel-helper-replace-supers@6.24.1
| +-- babel-plugin-transform-es2015-computed-properties@6.24.1
| +-- babel-plugin-transform-es2015-destructuring@6.23.0
| +-- babel-plugin-transform-es2015-duplicate-keys@6.24.1
| +-- babel-plugin-transform-es2015-for-of@6.23.0
| +-- babel-plugin-transform-es2015-function-name@6.24.1
| +-- babel-plugin-transform-es2015-literals@6.22.0
| +-- babel-plugin-transform-es2015-modules-amd@6.24.1
| +-- babel-plugin-transform-es2015-modules-commonjs@6.24.1
| | `-- babel-plugin-transform-strict-mode@6.24.1
| +-- babel-plugin-transform-es2015-modules-systemjs@6.24.1
| | `-- babel-helper-hoist-variables@6.24.1
| +-- babel-plugin-transform-es2015-modules-umd@6.24.1
| +-- babel-plugin-transform-es2015-object-super@6.24.1
| +-- babel-plugin-transform-es2015-parameters@6.24.1
| | +-- babel-helper-call-delegate@6.24.1
| | `-- babel-helper-get-function-arity@6.24.1
| +-- babel-plugin-transform-es2015-shorthand-properties@6.24.1
| +-- babel-plugin-transform-es2015-spread@6.22.0
| +-- babel-plugin-transform-es2015-sticky-regex@6.24.1
| | `-- babel-helper-regex@6.24.1
| +-- babel-plugin-transform-es2015-template-literals@6.22.0
| +-- babel-plugin-transform-es2015-typeof-symbol@6.23.0
| +-- babel-plugin-transform-es2015-unicode-regex@6.24.1
| | `-- regexpu-core@2.0.0
| |   +-- regenerate@1.3.2
| |   +-- regjsgen@0.2.0
| |   `-- regjsparser@0.1.5
| |     `-- jsesc@0.5.0
| `-- babel-plugin-transform-regenerator@6.24.1
|   `-- regenerator-transform@0.9.11
+-- clean-css@3.4.26
| +-- commander@2.8.1
| | `-- graceful-readlink@1.0.1
| `-- source-map@0.4.4
|   `-- amdefine@1.0.1
+-- eslint@3.19.0
| +-- chalk@1.1.3
| | +-- ansi-styles@2.2.1
| | +-- escape-string-regexp@1.0.5
| | +-- has-ansi@2.0.0
| | +-- strip-ansi@3.0.1
| | `-- supports-color@2.0.0
| +-- concat-stream@1.6.0
| | +-- inherits@2.0.3
| | +-- readable-stream@2.2.9
| | | +-- buffer-shims@1.0.0
| | | +-- core-util-is@1.0.2
| | | +-- process-nextick-args@1.0.7
| | | +-- string_decoder@1.0.0
| | | `-- util-deprecate@1.0.2
| | `-- typedarray@0.0.6
| +-- debug@2.6.6
| | `-- ms@0.7.3
| +-- doctrine@2.0.0
| | `-- isarray@1.0.0
| +-- escope@3.6.0
| | +-- es6-map@0.1.5
| | | +-- d@1.0.0
| | | +-- es5-ext@0.10.16
| | | +-- es6-iterator@2.0.1
| | | +-- es6-set@0.1.5
| | | +-- es6-symbol@3.1.1
| | | `-- event-emitter@0.3.5
| | +-- es6-weak-map@2.0.2
| | `-- esrecurse@4.1.0
| |   `-- estraverse@4.1.1
| +-- espree@3.4.3
| | +-- acorn@5.0.3
| | `-- acorn-jsx@3.0.1
| |   `-- acorn@3.3.0
| +-- esquery@1.0.0
| +-- estraverse@4.2.0
| +-- esutils@2.0.2
| +-- file-entry-cache@2.0.0
| | +-- flat-cache@1.2.2
| | | +-- circular-json@0.3.1
| | | +-- del@2.2.2
| | | | +-- globby@5.0.0
| | | | +-- is-path-cwd@1.0.0
| | | | `-- is-path-in-cwd@1.0.0
| | | |   `-- is-path-inside@1.0.0
| | | `-- write@0.2.1
| | `-- object-assign@4.1.1
| +-- glob@7.1.1
| | +-- fs.realpath@1.0.0
| | +-- inflight@1.0.6
| | | `-- wrappy@1.0.2
| | `-- once@1.4.0
| +-- globals@9.17.0
| +-- ignore@3.3.0
| +-- imurmurhash@0.1.4
| +-- inquirer@0.12.0
| | +-- ansi-escapes@1.4.0
| | +-- ansi-regex@2.1.1
| | +-- cli-cursor@1.0.2
| | | `-- restore-cursor@1.0.1
| | |   +-- exit-hook@1.1.1
| | |   `-- onetime@1.1.0
| | +-- cli-width@2.1.0
| | +-- readline2@1.0.1
| | | +-- code-point-at@1.1.0
| | | +-- is-fullwidth-code-point@1.0.0
| | | `-- mute-stream@0.0.5
| | +-- run-async@0.1.0
| | +-- rx-lite@3.1.2
| | +-- string-width@1.0.2
| | `-- through@2.3.8
| +-- is-my-json-valid@2.16.0
| | +-- generate-function@2.0.0
| | +-- generate-object-property@1.2.0
| | | `-- is-property@1.0.2
| | +-- jsonpointer@4.0.1
| | `-- xtend@4.0.1
| +-- is-resolvable@1.0.0
| | `-- tryit@1.0.3
| +-- js-yaml@3.8.4
| | +-- argparse@1.0.9
| | | `-- sprintf-js@1.0.3
| | `-- esprima@3.1.3
| +-- json-stable-stringify@1.0.1
| | `-- jsonify@0.0.0
| +-- levn@0.3.0
| | +-- prelude-ls@1.1.2
| | `-- type-check@0.3.2
| +-- lodash@4.17.4
| +-- mkdirp@0.5.1
| | `-- minimist@0.0.8
| +-- natural-compare@1.4.0
| +-- optionator@0.8.2
| | +-- deep-is@0.1.3
| | +-- fast-levenshtein@2.0.6
| | `-- wordwrap@1.0.0
| +-- path-is-inside@1.0.2
| +-- pluralize@1.2.1
| +-- progress@1.1.8
| +-- require-uncached@1.0.3
| | +-- caller-path@0.1.0
| | | `-- callsites@0.2.0
| | `-- resolve-from@1.0.1
| +-- strip-bom@3.0.0
| +-- strip-json-comments@2.0.1
| +-- table@3.8.3
| | +-- ajv@4.11.8
| | | `-- co@4.6.0
| | +-- ajv-keywords@1.5.1
| | +-- slice-ansi@0.0.4
| | `-- string-width@2.0.0
| |   `-- is-fullwidth-code-point@2.0.0
| +-- text-table@0.2.0
| `-- user-home@2.0.0
|   `-- os-homedir@1.0.2
+-- grunt@1.0.1
| +-- coffee-script@1.10.0
| +-- dateformat@1.0.12
| +-- eventemitter2@0.4.14
| +-- exit@0.1.2
| +-- findup-sync@0.3.0
| | `-- glob@5.0.15
| +-- glob@7.0.6
| +-- grunt-cli@1.2.0
| | `-- resolve@1.1.7
| +-- grunt-known-options@1.1.0
| +-- grunt-legacy-log@1.0.0
| | +-- grunt-legacy-log-utils@1.0.0
| | | `-- lodash@4.3.0
| | +-- lodash@3.10.1
| | `-- underscore.string@3.2.3
| +-- grunt-legacy-util@1.0.0
| | +-- getobject@0.1.0
| | +-- lodash@4.3.0
| | `-- which@1.2.14
| |   `-- isexe@2.0.0
| +-- iconv-lite@0.4.17
| +-- js-yaml@3.5.5
| | `-- esprima@2.7.3
| +-- minimatch@3.0.4
| | `-- brace-expansion@1.1.7
| |   +-- balanced-match@0.4.2
| |   `-- concat-map@0.0.1
| +-- nopt@3.0.6
| | `-- abbrev@1.1.0
| +-- path-is-absolute@1.0.1
| `-- rimraf@2.2.8
+-- grunt-babel@6.0.0
| `-- babel-core@6.24.1
|   +-- babel-generator@6.24.1
|   | +-- detect-indent@4.0.0
|   | | `-- repeating@2.0.1
|   | +-- jsesc@1.3.0
|   | `-- trim-right@1.0.1
|   +-- babel-helpers@6.24.1
|   +-- babel-register@6.24.1
|   | +-- home-or-tmp@2.0.0
|   | `-- source-map-support@0.4.15
|   +-- convert-source-map@1.5.0
|   +-- json5@0.5.1
|   +-- private@0.1.7
|   `-- slash@1.0.0
+-- grunt-build-control@0.7.1
| +-- bluebird@3.5.0
| +-- semver@4.3.6
| `-- shelljs@0.2.6
+-- grunt-contrib-clean@1.1.0
| +-- async@1.5.2
| `-- rimraf@2.6.1
+-- grunt-contrib-compress@1.4.1
| +-- archiver@1.3.0
| | +-- archiver-utils@1.3.0
| | | +-- lazystream@1.0.0
| | | `-- normalize-path@2.1.1
| | |   `-- remove-trailing-separator@1.0.1
| | +-- async@2.4.0
| | +-- buffer-crc32@0.2.13
| | +-- tar-stream@1.5.4
| | | +-- bl@1.2.1
| | | `-- end-of-stream@1.4.0
| | +-- walkdir@0.0.11
| | `-- zip-stream@1.1.1
| |   `-- compress-commons@1.2.0
| |     `-- crc32-stream@2.0.0
| |       `-- crc@3.4.4
| +-- iltorb@1.2.1
| | `-- node-pre-gyp@0.6.34
| |   +-- mkdirp@0.5.1
| |   | `-- minimist@0.0.8
| |   +-- nopt@4.0.1
| |   | +-- abbrev@1.1.0
| |   | `-- osenv@0.1.4
| |   |   +-- os-homedir@1.0.2
| |   |   `-- os-tmpdir@1.0.2
| |   +-- npmlog@4.0.2
| |   | +-- are-we-there-yet@1.1.2
| |   | | `-- delegates@1.0.0
| |   | +-- console-control-strings@1.1.0
| |   | +-- gauge@2.7.3
| |   | | +-- aproba@1.1.1
| |   | | +-- has-unicode@2.0.1
| |   | | +-- object-assign@4.1.1
| |   | | +-- signal-exit@3.0.2
| |   | | +-- string-width@1.0.2
| |   | | | +-- code-point-at@1.1.0
| |   | | | `-- is-fullwidth-code-point@1.0.0
| |   | | |   `-- number-is-nan@1.0.1
| |   | | +-- strip-ansi@3.0.1
| |   | | | `-- ansi-regex@2.1.1
| |   | | `-- wide-align@1.1.0
| |   | `-- set-blocking@2.0.0
| |   +-- rc@1.2.1
| |   | +-- deep-extend@0.4.1
| |   | +-- ini@1.3.4
| |   | +-- minimist@1.2.0
| |   | `-- strip-json-comments@2.0.1
| |   +-- request@2.81.0
| |   | +-- aws-sign2@0.6.0
| |   | +-- aws4@1.6.0
| |   | +-- caseless@0.12.0
| |   | +-- combined-stream@1.0.5
| |   | | `-- delayed-stream@1.0.0
| |   | +-- extend@3.0.0
| |   | +-- forever-agent@0.6.1
| |   | +-- form-data@2.1.4
| |   | | `-- asynckit@0.4.0
| |   | +-- har-validator@4.2.1
| |   | | +-- ajv@4.11.6
| |   | | | +-- co@4.6.0
| |   | | | `-- json-stable-stringify@1.0.1
| |   | | |   `-- jsonify@0.0.0
| |   | | `-- har-schema@1.0.5
| |   | +-- hawk@3.1.3
| |   | | +-- boom@2.10.1
| |   | | +-- cryptiles@2.0.5
| |   | | +-- hoek@2.16.3
| |   | | `-- sntp@1.0.9
| |   | +-- http-signature@1.1.1
| |   | | +-- assert-plus@0.2.0
| |   | | +-- jsprim@1.4.0
| |   | | | +-- assert-plus@1.0.0
| |   | | | +-- extsprintf@1.0.2
| |   | | | +-- json-schema@0.2.3
| |   | | | `-- verror@1.3.6
| |   | | `-- sshpk@1.11.0
| |   | |   +-- asn1@0.2.3
| |   | |   +-- bcrypt-pbkdf@1.0.1
| |   | |   +-- dashdash@1.14.1
| |   | |   +-- ecc-jsbn@0.1.1
| |   | |   +-- getpass@0.1.6
| |   | |   +-- jodid25519@1.0.2
| |   | |   +-- jsbn@0.1.1
| |   | |   `-- tweetnacl@0.14.5
| |   | +-- is-typedarray@1.0.0
| |   | +-- isstream@0.1.2
| |   | +-- json-stringify-safe@5.0.1
| |   | +-- mime-types@2.1.15
| |   | | `-- mime-db@1.27.0
| |   | +-- oauth-sign@0.8.2
| |   | +-- performance-now@0.2.0
| |   | +-- qs@6.4.0
| |   | +-- safe-buffer@5.0.1
| |   | +-- stringstream@0.0.5
| |   | +-- tough-cookie@2.3.2
| |   | | `-- punycode@1.4.1
| |   | +-- tunnel-agent@0.6.0
| |   | `-- uuid@3.0.1
| |   +-- rimraf@2.6.1
| |   | `-- glob@7.1.1
| |   |   +-- fs.realpath@1.0.0
| |   |   +-- inflight@1.0.6
| |   |   +-- minimatch@3.0.3
| |   |   | `-- brace-expansion@1.1.7
| |   |   |   +-- balanced-match@0.4.2
| |   |   |   `-- concat-map@0.0.1
| |   |   `-- path-is-absolute@1.0.1
| |   +-- semver@5.3.0
| |   +-- tar@2.2.1
| |   | +-- block-stream@0.0.9
| |   | +-- fstream@1.0.11
| |   | | `-- graceful-fs@4.1.11
| |   | `-- inherits@2.0.3
| |   `-- tar-pack@3.4.0
| |     +-- debug@2.2.0
| |     | `-- ms@0.7.1
| |     +-- fstream-ignore@1.0.5
| |     +-- once@1.4.0
| |     | `-- wrappy@1.0.2
| |     +-- readable-stream@2.2.9
| |     | +-- buffer-shims@1.0.0
| |     | +-- core-util-is@1.0.2
| |     | +-- isarray@1.0.0
| |     | +-- process-nextick-args@1.0.7
| |     | +-- string_decoder@1.0.0
| |     | `-- util-deprecate@1.0.2
| |     `-- uid-number@0.0.6
| +-- pretty-bytes@3.0.1
| `-- stream-buffers@2.2.0
+-- grunt-contrib-concat@1.0.1
| `-- source-map@0.5.6
+-- grunt-contrib-connect@1.0.2
| +-- connect@3.6.1
| | +-- debug@2.6.3
| | | `-- ms@0.7.2
| | +-- finalhandler@1.0.1
| | | +-- debug@2.6.3
| | | | `-- ms@0.7.2
| | | +-- statuses@1.3.1
| | | `-- unpipe@1.0.0
| | +-- parseurl@1.3.1
| | `-- utils-merge@1.0.0
| +-- connect-livereload@0.5.4
| +-- http2@3.3.6
| +-- morgan@1.8.1
| | +-- basic-auth@1.1.0
| | +-- debug@2.6.1
| | | `-- ms@0.7.2
| | +-- depd@1.1.0
| | +-- on-finished@2.3.0
| | | `-- ee-first@1.1.1
| | `-- on-headers@1.0.1
| +-- opn@4.0.2
| | `-- pinkie-promise@2.0.1
| |   `-- pinkie@2.0.4
| +-- portscanner@1.2.0
| +-- serve-index@1.8.0
| | +-- accepts@1.3.3
| | | `-- negotiator@0.6.1
| | +-- batch@0.5.3
| | +-- debug@2.2.0
| | | `-- ms@0.7.1
| | +-- escape-html@1.0.3
| | +-- http-errors@1.5.1
| | | `-- setprototypeof@1.0.2
| | `-- mime-types@2.1.15
| |   `-- mime-db@1.27.0
| `-- serve-static@1.12.2
|   +-- encodeurl@1.0.1
|   `-- send@0.15.2
|     +-- debug@2.6.4
|     | `-- ms@0.7.3
|     +-- destroy@1.0.4
|     +-- etag@1.8.0
|     +-- fresh@0.5.0
|     +-- http-errors@1.6.1
|     | `-- setprototypeof@1.0.3
|     +-- mime@1.3.4
|     +-- ms@1.0.0
|     `-- range-parser@1.2.0
+-- grunt-contrib-copy@1.0.0
| `-- file-sync-cmp@0.1.1
+-- grunt-contrib-qunit@1.3.0
| `-- grunt-lib-phantomjs@1.1.0
|   +-- phantomjs-prebuilt@2.1.14
|   | +-- es6-promise@4.0.5
|   | +-- extract-zip@1.5.0
|   | | +-- concat-stream@1.5.0
|   | | | `-- readable-stream@2.0.6
|   | | |   `-- string_decoder@0.10.31
|   | | +-- debug@0.7.4
|   | | +-- mkdirp@0.5.0
|   | | `-- yauzl@2.4.1
|   | |   `-- fd-slicer@1.0.1
|   | |     `-- pend@1.2.0
|   | +-- fs-extra@1.0.0
|   | | +-- jsonfile@2.4.0
|   | | `-- klaw@1.3.1
|   | +-- hasha@2.2.0
|   | | `-- is-stream@1.1.0
|   | +-- kew@0.7.0
|   | `-- request-progress@2.0.1
|   |   `-- throttleit@1.0.0
|   +-- semver@5.3.0
|   `-- temporary@0.0.8
|     `-- package@1.0.1
+-- grunt-contrib-watch@1.0.0
| +-- gaze@1.1.2
| | `-- globule@1.1.0
| |   `-- lodash@4.16.6
| +-- lodash@3.10.1
| `-- tiny-lr@0.2.1
|   +-- body-parser@1.14.2
|   | +-- bytes@2.2.0
|   | +-- content-type@1.0.2
|   | +-- debug@2.2.0
|   | | `-- ms@0.7.1
|   | +-- http-errors@1.3.1
|   | +-- iconv-lite@0.4.13
|   | +-- qs@5.2.0
|   | +-- raw-body@2.1.7
|   | | +-- bytes@2.4.0
|   | | `-- iconv-lite@0.4.13
|   | `-- type-is@1.6.15
|   |   `-- media-typer@0.3.0
|   +-- debug@2.2.0
|   | `-- ms@0.7.1
|   +-- faye-websocket@0.10.0
|   | `-- websocket-driver@0.6.5
|   |   `-- websocket-extensions@0.1.1
|   +-- livereload-js@2.2.2
|   `-- qs@5.1.0
+-- grunt-exec@1.0.1
+-- grunt-html@8.4.0
| +-- async@2.2.0
| `-- vnu-jar@17.3.0
+-- grunt-jekyll@0.4.6
| `-- tmp@0.0.31
|   `-- os-tmpdir@1.0.2
+-- grunt-saucelabs@9.0.0
| +-- colors@1.1.2
| +-- lodash@4.13.1
| +-- q@1.4.1
| +-- requestretry@1.9.1
| | +-- extend@3.0.1
| | +-- fg-lodash@0.0.2
| | | +-- lodash@2.4.2
| | | `-- underscore.string@2.3.3
| | `-- when@3.7.8
| +-- sauce-tunnel@2.5.0
| | `-- split@1.0.0
| `-- saucelabs@1.2.0
|   `-- https-proxy-agent@1.0.0
|     `-- agent-base@2.0.1
|       `-- semver@5.0.3
+-- grunt-stamp@0.3.0
+-- htmlhint@0.9.13
| +-- async@1.4.2
| +-- colors@1.0.3
| +-- commander@2.6.0
| +-- csslint@0.10.0
| | `-- parserlib@0.2.5
| +-- glob@5.0.15
| +-- jshint@2.8.0
| | +-- cli@0.6.6
| | | `-- glob@3.2.11
| | |   `-- minimatch@0.3.0
| | |     +-- lru-cache@2.7.3
| | |     `-- sigmund@1.0.1
| | +-- console-browserify@1.1.0
| | | `-- date-now@0.1.4
| | +-- htmlparser2@3.8.3
| | | +-- domelementtype@1.3.0
| | | +-- domhandler@2.3.0
| | | +-- domutils@1.5.1
| | | | `-- dom-serializer@0.1.0
| | | |   +-- domelementtype@1.1.3
| | | |   `-- entities@1.1.1
| | | +-- entities@1.0.0
| | | `-- readable-stream@1.1.14
| | |   +-- isarray@0.0.1
| | |   `-- string_decoder@0.10.31
| | +-- lodash@3.7.0
| | +-- minimatch@2.0.10
| | +-- shelljs@0.3.0
| | `-- strip-json-comments@1.0.4
| +-- parse-glob@3.0.4
| | +-- glob-base@0.3.0
| | +-- is-dotfile@1.0.2
| | +-- is-extglob@1.0.0
| | `-- is-glob@2.0.1
| +-- strip-json-comments@1.0.4
| `-- xml@1.0.0
+-- is-travis@1.0.0
+-- jquery@3.2.1
+-- load-grunt-tasks@3.5.2
| +-- arrify@1.0.1
| +-- multimatch@2.1.0
| | +-- array-differ@1.0.0
| | `-- array-union@1.0.2
| |   `-- array-uniq@1.0.3
| +-- pkg-up@1.0.0
| | `-- find-up@1.1.2
| |   `-- path-exists@2.1.0
| `-- resolve-pkg@0.1.0
|   `-- resolve-from@2.0.0
+-- node-sass@4.5.2
| +-- async-foreach@0.1.3
| +-- cross-spawn@3.0.1
| | `-- lru-cache@4.0.2
| |   +-- pseudomap@1.0.2
| |   `-- yallist@2.1.2
| +-- get-stdin@4.0.1
| +-- in-publish@2.0.0
| +-- lodash.assign@4.2.0
| +-- lodash.clonedeep@4.5.0
| +-- lodash.mergewith@4.6.0
| +-- meow@3.7.0
| | +-- camelcase-keys@2.1.0
| | | `-- camelcase@2.1.1
| | +-- decamelize@1.2.0
| | +-- loud-rejection@1.6.0
| | | +-- currently-unhandled@0.4.1
| | | | `-- array-find-index@1.0.2
| | | `-- signal-exit@3.0.2
| | +-- map-obj@1.0.1
| | +-- minimist@1.2.0
| | +-- normalize-package-data@2.3.8
| | | +-- hosted-git-info@2.4.2
| | | +-- is-builtin-module@1.0.0
| | | | `-- builtin-modules@1.1.1
| | | `-- validate-npm-package-license@3.0.1
| | |   +-- spdx-correct@1.0.2
| | |   | `-- spdx-license-ids@1.2.2
| | |   `-- spdx-expression-parse@1.0.4
| | +-- read-pkg-up@1.0.1
| | | `-- read-pkg@1.1.0
| | |   +-- load-json-file@1.1.0
| | |   | +-- parse-json@2.2.0
| | |   | | `-- error-ex@1.3.1
| | |   | |   `-- is-arrayish@0.2.1
| | |   | `-- strip-bom@2.0.0
| | |   |   `-- is-utf8@0.2.1
| | |   `-- path-type@1.1.0
| | +-- redent@1.0.0
| | | +-- indent-string@2.1.0
| | | `-- strip-indent@1.0.1
| | `-- trim-newlines@1.0.0
| +-- nan@2.6.2
| +-- node-gyp@3.6.1
| | +-- fstream@1.0.11
| | +-- graceful-fs@4.1.11
| | +-- osenv@0.1.4
| | `-- tar@2.2.1
| |   `-- block-stream@0.0.9
| +-- npmlog@4.1.0
| | +-- are-we-there-yet@1.1.4
| | | `-- delegates@1.0.0
| | +-- console-control-strings@1.1.0
| | +-- gauge@2.7.4
| | | +-- aproba@1.1.1
| | | +-- has-unicode@2.0.1
| | | `-- wide-align@1.1.2
| | `-- set-blocking@2.0.0
| +-- request@2.79.0
| | +-- aws-sign2@0.6.0
| | +-- aws4@1.6.0
| | +-- caseless@0.11.0
| | +-- combined-stream@1.0.5
| | | `-- delayed-stream@1.0.0
| | +-- forever-agent@0.6.1
| | +-- form-data@2.1.4
| | | `-- asynckit@0.4.0
| | +-- har-validator@2.0.6
| | | `-- commander@2.9.0
| | +-- hawk@3.1.3
| | | +-- boom@2.10.1
| | | +-- cryptiles@2.0.5
| | | +-- hoek@2.16.3
| | | `-- sntp@1.0.9
| | +-- http-signature@1.1.1
| | | +-- assert-plus@0.2.0
| | | +-- jsprim@1.4.0
| | | | +-- assert-plus@1.0.0
| | | | +-- extsprintf@1.0.2
| | | | +-- json-schema@0.2.3
| | | | `-- verror@1.3.6
| | | `-- sshpk@1.13.0
| | |   +-- asn1@0.2.3
| | |   +-- assert-plus@1.0.0
| | |   +-- bcrypt-pbkdf@1.0.1
| | |   +-- dashdash@1.14.1
| | |   | `-- assert-plus@1.0.0
| | |   +-- ecc-jsbn@0.1.1
| | |   +-- getpass@0.1.7
| | |   | `-- assert-plus@1.0.0
| | |   +-- jodid25519@1.0.2
| | |   +-- jsbn@0.1.1
| | |   `-- tweetnacl@0.14.5
| | +-- is-typedarray@1.0.0
| | +-- isstream@0.1.2
| | +-- json-stringify-safe@5.0.1
| | +-- oauth-sign@0.8.2
| | +-- qs@6.3.2
| | +-- stringstream@0.0.5
| | +-- tough-cookie@2.3.2
| | | `-- punycode@1.4.1
| | +-- tunnel-agent@0.4.3
| | `-- uuid@3.0.1
| +-- sass-graph@2.2.3
| | +-- scss-tokenizer@0.2.3
| | | `-- source-map@0.4.4
| | `-- yargs@6.6.0
| |   +-- camelcase@3.0.0
| |   `-- yargs-parser@4.2.1
| |     `-- camelcase@3.0.0
| `-- stdout-stream@1.4.0
+-- postcss-cli@2.6.0
| +-- chokidar@1.7.0
| | +-- anymatch@1.3.0
| | | `-- micromatch@2.3.11
| | |   +-- arr-diff@2.0.0
| | |   | `-- arr-flatten@1.0.3
| | |   +-- array-unique@0.2.1
| | |   +-- braces@1.8.5
| | |   | +-- expand-range@1.8.2
| | |   | | `-- fill-range@2.2.3
| | |   | |   +-- is-number@2.1.0
| | |   | |   +-- isobject@2.1.0
| | |   | |   `-- randomatic@1.1.6
| | |   | +-- preserve@0.2.0
| | |   | `-- repeat-element@1.1.2
| | |   +-- expand-brackets@0.1.5
| | |   | `-- is-posix-bracket@0.1.1
| | |   +-- extglob@0.3.2
| | |   +-- filename-regex@2.0.1
| | |   +-- kind-of@3.2.0
| | |   | `-- is-buffer@1.1.5
| | |   +-- object.omit@2.0.1
| | |   | +-- for-own@0.1.5
| | |   | | `-- for-in@1.0.2
| | |   | `-- is-extendable@0.1.1
| | |   `-- regex-cache@0.4.3
| | |     +-- is-equal-shallow@0.1.3
| | |     `-- is-primitive@2.0.0
| | +-- async-each@1.0.1
| | +-- glob-parent@2.0.0
| | +-- is-binary-path@1.0.1
| | | `-- binary-extensions@1.8.0
| | `-- readdirp@2.1.0
| |   `-- set-immediate-shim@1.0.1
| +-- globby@4.1.0
| | +-- glob@6.0.4
| | `-- pify@2.3.0
| +-- neo-async@1.8.2
| +-- read-file-stdin@0.2.1
| | `-- gather-stream@1.0.0
| +-- resolve@1.3.3
| | `-- path-parse@1.0.5
| `-- yargs@4.8.1
|   +-- cliui@3.2.0
|   | `-- wrap-ansi@2.1.0
|   +-- get-caller-file@1.0.2
|   +-- os-locale@1.4.0
|   | `-- lcid@1.0.0
|   |   `-- invert-kv@1.0.0
|   +-- require-directory@2.1.1
|   +-- require-main-filename@1.0.1
|   +-- which-module@1.0.0
|   +-- window-size@0.2.0
|   +-- y18n@3.2.1
|   `-- yargs-parser@2.4.1
|     `-- camelcase@3.0.0
+-- postcss-flexbugs-fixes@2.1.1
+-- shelljs@0.7.7
| +-- interpret@1.0.3
| `-- rechoir@0.6.2
+-- shx@0.2.2
| +-- es6-object-assign@1.1.0
| `-- minimist@1.2.0
+-- tether@1.4.0
+-- time-grunt@1.4.0
| +-- date-time@1.1.0
| | `-- time-zone@0.1.0
| +-- figures@1.7.0
| +-- hooker@0.2.3
| +-- number-is-nan@1.0.1
| `-- pretty-ms@2.1.0
|   +-- is-finite@1.0.2
|   +-- parse-ms@1.0.1
|   `-- plur@1.0.0
`-- uglify-js@2.8.23
  +-- uglify-to-browserify@1.0.2
  `-- yargs@3.10.0
    +-- camelcase@1.2.1
    +-- cliui@2.1.0
    | +-- center-align@0.1.3
    | | +-- align-text@0.1.4
    | | | +-- longest@1.0.1
    | | | `-- repeat-string@1.6.1
    | | `-- lazy-cache@1.0.4
    | +-- right-align@0.1.3
    | `-- wordwrap@0.0.2
    `-- window-size@0.1.0

npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@^1.0.0 (node_modules/chokidar/node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.1.1: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})
```

## bundle install
- Try install with prefix to project directory
- bundle install --path vendor/bundle


```
Fetching gem metadata from https://rubygems.org/...........
Fetching version metadata from https://rubygems.org/..
Fetching dependency metadata from https://rubygems.org/.
Using rake 12.0.0
Using public_suffix 2.0.5
Using colorator 1.1.0


Your user account isn't allowed to install to the system RubyGems.
  You can cancel this installation and run:

      bundle install --path vendor/bundle

  to install the gems into ./vendor/bundle/, or you can enter your password
  and install the bundled gems to RubyGems using sudo.

  Password:
Installing ffi 1.9.14 with native extensions
Using forwardable-extended 2.6.0
Using sass 3.4.23
Using rb-fsevent 0.9.8
Using kramdown 1.13.1
Using liquid 3.0.6
Using mercenary 0.3.6
Using rouge 1.11.1
Using safe_yaml 1.0.4
Using bundler 1.14.6
Using addressable 2.5.0
Installing rb-inotify 0.9.7
Installing pathutil 0.14.0
Installing jekyll-sass-converter 1.5.0
Installing scss_lint 0.51.0
Installing listen 3.0.8
Installing jekyll-watch 1.5.0
Installing jekyll 3.3.1
Installing jekyll-redirect-from 0.12.0
Installing jekyll-sitemap 0.12.0
Bundle complete! 4 Gemfile dependencies, 23 gems now installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

- bundle show scss_lint
/var/lib/gems/2.3.0/gems/scss_lint-0.51.0

***
# Build Bootstrap4
|    Task     |                                                        Description                                                         |
| ----------- | -------------------------------------------------------------------------------------------------------------------------- |
| grunt       | Run grunt to run tests locally and compile the CSS and JavaScript into /dist. Uses Sass, Autoprefixer, and UglifyJS.       |
| grunt dist  | grunt dist creates the /dist directory with compiled files. Uses Sass, Autoprefixer, and UglifyJS.                         |
| grunt test  | Runs scss-lint, ESLint and QUnit tests headlessly in PhantomJS (used for CI).                                              |
| grunt docs  | Builds and tests CSS, JavaScript, and other assets which are used when running the documentation locally via jekyll serve. |
| grunt watch | This is a convenience method for watching just Sass files and automatically building them whenever you save.               |

## Local documentation, for
- bundle exec jekyll serve
- Open http://localhost:9001 in your browser, and voilà.


## grunt
```
Running "clean:dist" (clean) task
>> 1 path cleaned.

Running "exec:sass" (exec) task

> bootstrap@4.0.0-alpha.6 sass /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6
> node-sass --output-style expanded --source-map true --precision 6 scss/bootstrap.scss dist/css/bootstrap.css && node-sass --output-style expanded --source-map true --precision 6 scss/bootstrap-grid.scss dist/css/bootstrap-grid.css && node-sass --output-style expanded --source-map true --precision 6 scss/bootstrap-reboot.scss dist/css/bootstrap-reboot.css

>> Rendering Complete, saving .css file...
>> Wrote CSS to /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/dist/css/bootstrap.css
>> Wrote Source Map to /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/dist/css/bootstrap.css.map
>> Rendering Complete, saving .css file...
>> Wrote Source Map to /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/dist/css/bootstrap-grid.css.map
>> Wrote CSS to /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/dist/css/bootstrap-grid.css
>> Rendering Complete, saving .css file...
>> Wrote CSS to /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/dist/css/bootstrap-reboot.css
>> Wrote Source Map to /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/dist/css/bootstrap-reboot.css.map

Running "exec:sass-docs" (exec) task

> bootstrap@4.0.0-alpha.6 sass-docs /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6
> node-sass --output-style expanded --source-map true --precision 6 docs/assets/scss/docs.scss docs/assets/css/docs.min.css

>> Rendering Complete, saving .css file...
>> Wrote CSS to /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/docs/assets/css/docs.min.css
>> Wrote Source Map to /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6/docs/assets/css/docs.min.css.map

Running "exec:postcss" (exec) task

> bootstrap@4.0.0-alpha.6 postcss /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6
> postcss --config grunt/postcss.js --replace dist/css/*.css


Running "exec:clean-css" (exec) task

> bootstrap@4.0.0-alpha.6 clean-css /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6
> cleancss --skip-advanced --source-map --output dist/css/bootstrap.min.css dist/css/bootstrap.css && cleancss --skip-advanced --source-map --output dist/css/bootstrap-grid.min.css dist/css/bootstrap-grid.css && cleancss --skip-advanced --source-map --output dist/css/bootstrap-reboot.min.css dist/css/bootstrap-reboot.css


Running "exec:clean-css-docs" (exec) task

> bootstrap@4.0.0-alpha.6 clean-css-docs /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6
> cleancss --skip-advanced --source-map --output docs/assets/css/docs.min.css docs/assets/css/docs.min.css


Running "babel:dev" (babel) task

Running "concat:bootstrap" (concat) task

Running "babel:dist" (babel) task

Running "stamp:bootstrap" (stamp) task

Running "exec:uglify" (exec) task

> bootstrap@4.0.0-alpha.6 uglify /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6
> uglifyjs --compress warnings=false --mangle --comments '/^!/' --output dist/js/bootstrap.min.js dist/js/bootstrap.js


Running "exec:scss-lint" (exec) task

> bootstrap@4.0.0-alpha.6 scss-lint /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6
> bundle exec scss-lint --config scss/.scss-lint.yml --exclude scss/_normalize.scss scss/*.scss


Running "qunit:files" (qunit) task
Testing js/tests/index.html

Starting test suite
================================================

√ All tests passed in "alert plugin" module
√ All tests passed in "alert" module
√ All tests passed in "button plugin" module
√ All tests passed in "button" module
√ All tests passed in "carousel plugin" module
√ All tests passed in "carousel" module
√ All tests passed in "collapse plugin" module
√ All tests passed in "collapse" module
√ All tests passed in "dropdowns plugin" module
√ All tests passed in "dropdowns" module
√ All tests passed in "modal plugin" module
√ All tests passed in "modal" module
√ All tests passed in "scrollspy plugin" module
√ All tests passed in "scrollspy" module
√ All tests passed in "tabs plugin" module
√ All tests passed in "tabs" module
√ All tests passed in "tooltip plugin" module
√ All tests passed in "tooltip" module........
√ All tests passed in "popover plugin" module
√ All tests passed in "popover" module
OK
>> 218 tests completed with 0 failed, 0 skipped, and 0 todo.
>> 481 assertions (in 4834ms), passed: 481, failed: 0

Running "exec:scss-lint-docs" (exec) task

> bootstrap@4.0.0-alpha.6 scss-lint-docs /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6
> bundle exec scss-lint --config scss/.scss-lint.yml --exclude docs/assets/scss/docs.scss docs/assets/scss/*.scss


Running "exec:clean-css-docs" (exec) task

> bootstrap@4.0.0-alpha.6 clean-css-docs /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6
> cleancss --skip-advanced --source-map --output docs/assets/css/docs.min.css docs/assets/css/docs.min.css


Running "exec:postcss-docs" (exec) task

> bootstrap@4.0.0-alpha.6 postcss-docs /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6
> postcss --config grunt/postcss.js --no-map --replace docs/assets/css/docs.min.css && postcss --config grunt/postcss.js --no-map --replace docs/examples/**/*.css


Running "exec:uglify-docs" (exec) task

> bootstrap@4.0.0-alpha.6 uglify-docs /media/sak/70_Current/Work/bootstrap4/bootstrap-4.0.0-alpha.6
> uglifyjs --compress warnings=false --mangle --comments '/^!/' --output docs/assets/js/docs.min.js docs/assets/js/vendor/*.js docs/assets/js/src/application.js


Running "clean:docs" (clean) task
>> 1 path cleaned.

Running "copy:docs" (copy) task
Created 2 directories, copied 14 files

Done.


Execution Time (2017-05-13 21:16:08 UTC+5:30)
exec:sass             4.6s  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 12%
exec:sass-docs       903ms  ▇▇▇▇ 2%
exec:postcss            5s  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 13%
exec:clean-css        2.5s  ▇▇▇▇▇▇▇▇▇▇▇ 7%
exec:clean-css-docs  630ms  ▇▇▇ 2%
babel:dev             3.3s  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 9%
babel:dist           754ms  ▇▇▇▇ 2%
exec:uglify             2s  ▇▇▇▇▇▇▇▇ 5%
exec:scss-lint        3.1s  ▇▇▇▇▇▇▇▇▇▇▇▇▇ 8%
qunit:files           7.5s  ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 20%
exec:scss-lint-docs   1.5s  ▇▇▇▇▇▇ 4%
exec:clean-css-docs  608ms  ▇▇▇ 2%
exec:postcss-docs     1.6s  ▇▇▇▇▇▇▇ 4%
exec:uglify-docs        3s  ▇▇▇▇▇▇▇▇▇▇▇▇▇ 8%
Total 37.2s
```

### WORKAROUND, sans Ruby
- Change lines 235-240, in Gruntfile.js
- from
```
      'scss-lint': {
        command: 'npm run scss-lint'
      },
      'scss-lint-docs': {
        command: 'npm run scss-lint-docs'
      },
```
- To
```
      'scss-lint': {
        command: 'npm run -version'
      },
      'scss-lint-docs': {
        command: 'npm run -version'
      },
```

- **Not sure of impact!** Compare with dist files and check for breakages


***
# Install Ruby from Source
## Depends
- `sudo apt-get install build-essential manpages-dev`
## Steps:
- Download and unpack a tarball
	- https://www.ruby-lang.org/en/downloads/
	- https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.gz
	- `a330e10d5cb5e53b3a0078326c5731888bb55e32c4abfeb27d9e7f8e5d000250`
	- `a330e10d5cb5e53b3a0078326c5731888bb55e32c4abfeb27d9e7f8e5d000250  ruby-2.4.1.tar.gz`
	- see `man shasum`
- `./configure`
	- `./configure --prefix=/20-DEV/Ruby`
- `make`
- `sudo make install`
	- By default, this will install Ruby into /usr/local.
	- To change, pass the --prefix=DIR option to the ./configure script.

### NOTE:
- check which programs need to be in global namespace for ruby to work as expected
