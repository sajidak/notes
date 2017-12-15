# IDE Notes
01 Dec 2017

## Versions
as on 01 Dec 2017
- GO
	- 1.9.2 / October 25, 2017
- TS (TypeScript)
	- 2.6.1 / 31 October 2017
- JavaScript
	- December 4, 1995; 21 years ago


## TS / Javascript IDEs
### Explore more
- https://www.genuitec.com/products/webclipse/
- https://www.typescriptlang.org/
	- https://github.com/Microsoft/TypeScript/blob/master/doc/spec.md
- https://jsx.github.io/
	- JSX is a statically-typed, object-oriented programming language designed to run on modern web browsers.
-

### LiteIDE
http://liteide.org/en/liteide/
- Core features
	- System environment management
	- Configurable build commands
	- Simple and open debug system
	- Kate format for auto-completion and theming
	- Configurable auto-completion with WordApi
	- MIME type based system
	- Plugin support
	- Quick Open
- Golang support
	- Package browser
	- Class view and outline
	- Document browser
	- Gocode support
	- GOPATH API index
	- Code Navigation
	- Find Usages
	- Code Refactor
	- Go playground
- Additional support
	- Markdown
	- Json
	- Golang Present
- Install on Ubuntu 16.04
```sh
## get source
git clone https://github.com/visualfc/liteide.git
## install build pre-reqs
sudo apt-get update
sudo apt-get install qt4-dev-tools libqt4-dev libqtcore4 libqtgui4 libqtwebkit-dev g++
## build it
cd liteide/build
./update_pkg.sh
QTDIR=/usr ./build_linux.sh

## Run it: ##
cd ~/liteide/build/liteide/bin
./liteide
```


### Angular IDE
https://www.genuitec.com/products/angular-ide/
- Angular IDE by Webclipse is based on Eclipse Neon 1.a
- Optimized for developers to make the most of the latest Angular
- TypeScript 2.x validation and debugging
- Advanced coding of HTML templates with validation and auto-complete
- Integrated usage of the angular-cli for Angular best practices
- Completely free for light usage
#### Install
- Have npm
	```js
	npm install -g angular-ide
	ngide install ~/Development/angular-ide
	ngide open Foo.ts
	```
- Download
	- Install Eclipse
	- add [Webclipse Full Suite](http://marketplace.eclipse.org/marketplace-client-intro?mpc_install=2456312)
- Install from Update Site
	- use https://www.genuitec.com/updates/webclipse/ci/
	- select **Webclipse Full Suite**

### ALM tools
http://alm.tools/
- needs the latest chrome and the latest nodejs
- A complete dev and analysis environment for **TypeScript**
- Easy to install `npm install alm -g`
- Easy to use: `alm`
- also a demonstration on real world usage TypeScript + React + Redux + Socket IO + FreeStyle (CSSinJS) + Microsoft Monaco
- Features:
	- Super slick syntax highlighting just for TypeScript
	- Tabs
	- Panes
	- Live file linting
	- Project wide linting
	- AST viewer
	- Dependency viewer / analyzer
	- Typescript Build
	- Live incremental TypeScript compile
	- Cursor History
	- Clipboard ring
	- Git Status gutter
	- Git Status scroll bar
	- Git reset file
	- Find in project
	- Find and replace in file (with regex support)
	- Multi Cursor
	- Rectangular selections
	- Command Search
	- TypeScript symbol search
	- TypeScript project selector
	- Live TypeScript ouput JavaScript preview
	- Multi monitor
	- Super friendly error panel with f8 error cycling
	- Copy paste buttons when they make sense (so you don't need to select stuff)
	- Type info / errors on hover
	- TypeScript doctor so you don't need to hover
	- Code folding
	- Bracket and tag matching
	- Matching bracking jumping
	- TypeScript formatting
	- editorconfig support
	- HTML to TSX/JSX
	- CSS to TS/JS
	- File Tree
	- On screen hints around current options (e.g. tree view)
	- Snippets
