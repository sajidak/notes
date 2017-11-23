# GO Language - Packages
`2017-Nov-23`

**Contents**
<!-- MDTOC maxdepth:6 firsth1:1 numbering:0 flatten:0 bullets:1 updateOnSave:1 -->

- [GO Language - Packages](#go-language-packages)   
   - [Atom Packages](#atom-packages)   
      - [ide-go](#ide-go)   
      - [go-plus](#go-plus)   
      - [go-debug](#go-debug)   
      - [go-outline](#go-outline)   
      - [go-quick-import](#go-quick-import)   
      - [go-tip](#go-tip)   
      - [go-imports](#go-imports)   
   - [Visual Studio Code](#visual-studio-code)   
      - [Go for Visual Studio Code](#go-for-visual-studio-code)   
   - [TODO:](#todo)   
      - [autoprefixer](#autoprefixer)   
      - [sass-compiler](#sass-compiler)   
      - [build-sass](#build-sass)   
      - [build-sassc](#build-sassc)   
      - [source-preview-sass](#source-preview-sass)   
      - [atom-minify-stand-alone](#atom-minify-stand-alone)   
      - [Live Sass Compiler](#live-sass-compiler)   
      - [Sass Helper](#sass-helper)   
      - [Beautify css/sass/scss/less](#beautify-csssassscssless)   
      - [Sass Formatter](#sass-formatter)   
      - [TypeScript Import](#typescript-import)   
      - [IntelliSense for CSS class names](#intellisense-for-css-class-names)   
      - [HTML CSS Support](#html-css-support)   
      - [JS-CSS-HTML Formatter](#js-css-html-formatter)   
      - [Latest TypeScript and Javascript Grammar](#latest-typescript-and-javascript-grammar)   
      - [HTML Class Suggestions](#html-class-suggestions)   
      - [SCSS IntelliSense](#scss-intellisense)   
      - [JS Refactorings](#js-refactorings)   
      - [HTML SCSS Support](#html-scss-support)   
      - [TypeScript Import](#typescript-import)   

<!-- /MDTOC -->


## Atom Packages
### ide-go
https://atom.io/packages/ide-go
- Code Format
- Document outline
- Find references
- Go to definition
- Hover
- Needs https://atom.io/packages/atom-ide-ui

### go-plus
https://atom.io/packages/go-plus
- Display information about your current go installation, by running go version and go env
- Autocomplete using gocode
- Format your code with gofmt, goimports, or goreturns; optionally run one of these tools on save of any .go file
- Run go install . and go test -c -o {tempdir} . to verify your code can compile and to keep gocode suggestions up to date
- Run a variety of linters (e.g. golint, vet, etc.) against your code using gometalinter
- Run tests, display test output, and display test coverage using go test -coverprofile
- Display documentation for identifiers in source code using gogetdoc
- Rename the symbol under your cursor using gorename
- Go to definition using guru or godef
- Highlight occurrences of an identifier using guru
- Find usages of an identifier using guru

### go-debug
https://atom.io/packages/go-debug
- A go debugger for atom using delve.
- go-debug tries to install/download delve automatically.
- additional configurations by creating a file and setting the path in the go-debug setting Configuration File

### go-outline
https://atom.io/packages/go-outline
- It shows all following symbols contained in the whole package:
    - global variables/constants
    - global functions
    - types, interfaces
    - functions with receivers
- If a file changes, the tree will be updated.
- Needs go-outline-parser on your $PATH.

### go-quick-import
https://atom.io/packages/go-quick-import
- Quickly add and remove imports without losing your place while editing

###
https://atom.io/packages/language-go
- Adds syntax highlighting and snippets to Go files in Atom

### go-tip
https://atom.io/packages/go-tip
- inspect variables, functions, types, etc., by hovering over them
- can return information on the following:
    - Functions
    - Types (including structs with tags)
    - Variables
    - Packages
    - Constants (includes value)
    - Literals

### go-imports
https://atom.io/packages/go-imports
- Auto import Go packages using goimports tool
- Should Install goimports if it is not installed

## Visual Studio Code
### Go for Visual Studio Code
https://marketplace.visualstudio.com/items?itemName=lukehoban.Go
- Completion Lists (using gocode)
- Signature Help (using gogetdoc or godef+godoc)
- Snippets
- Quick Info (using gogetdoc or godef+godoc)
- Goto Definition (using gogetdoc or godef+godoc)
- Find References (using guru)
- Find implementations (using guru)
- References CodeLens
- File outline (using go-outline)
- Workspace symbol search (using go-symbols)
- Rename (using gorename. Note: For Undo after rename to work in Windows you need to have diff tool in your path)
- Build-on-save (using go build and go test)
- Lint-on-save (using golint or gometalinter)
- Format on save as well as format manually (using goreturns or goimports or gofmt)
- Generate unit tests skeleton (using gotests)
- Add Imports (using gopkgs)
- Add/Remove Tags on struct fields (using gomodifytags)
- Semantic/Syntactic error reporting as you type (using gotype-live)
- Run Tests under the cursor, in current file, in current package, in the whole workspace (using go test)
- Show code coverage
- Generate method stubs for interfaces (using impl)
- [partially implemented] Debugging (using delve)
- To use the debugger, you must currently manually install delve
- Go tools that the Go extension depends on
    - go-outline: go get -u -v github.com/ramya-rao-a/go-outline
    - go-symbols: go get -u -v github.com/acroca/go-symbols
    - gocode: go get -u -v github.com/nsf/gocode
    - godef: go get -u -v github.com/rogpeppe/godef
    - godoc: go get -u -v golang.org/x/tools/cmd/godoc
    - gogetdoc: go get -u -v github.com/zmb3/gogetdoc
    - golint: go get -u -v github.com/golang/lint/golint
    - gomodifytags: go get -u -v github.com/fatih/gomodifytags
    - gopkgs: go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
    - gorename: go get -u -v golang.org/x/tools/cmd/gorename
    - goreturns: go get -u -v sourcegraph.com/sqs/goreturns
    - gotests: go get -u -v github.com/cweill/gotests/...
    - guru: go get -u -v golang.org/x/tools/cmd/guru
    - impl: go get -u -v github.com/josharian/impl
- Delve install instructions at https://github.com/derekparker/delve/blob/master/Documentation/installation/README.md

## TODO:
- [ ] Evaluate js, css, scss stack

### autoprefixer
- Prefix CSS and SCSS with Autoprefixer
- Run on Save option

### sass-compiler
- Sass Compiler based on node-sass library that provides binding for Node.js to libsass. Works only with scss syntax.
- node-sass library https://github.com/sass/node-sass

### build-sass
- Atom Build provider for sass, compiles SCSS (and Sass) into CSS
- Supports the linter package for error highlighting
- Uses `Ruby Sass`

### build-sassc
- Atom Build provider for sass, compiles SCSS (and Sass) into CSS
- Supports the linter package for error highlighting
- Uses `LibSass`

### source-preview-sass
- source-preview provider for Sass, using LibSass for performance.

### atom-minify-stand-alone
- Minify a js / css file without dependencies.
- Minify css / js files using native json regular expression.
- String literal can be parsed normally now.
- This package is in early development.

***

### Live Sass Compiler
https://marketplace.visualstudio.com/items?itemName=ritwickdey.live-sass
- compile/transpile your SASS/SCSS files to CSS files at realtime with live browser reload.
- Live SASS & SCSS Compile.
- Customizable file location of exported CSS.
- Customizable exported CSS Style (expanded, compact, compressed, nested).
- Customizable extension name (.css or .min.css).
- Quick Status bar control.
- Exclude Specific Folders by settings.
- Live Reload to browser (Dependency on Live Server extension).
- Autoprefix Supported (See setting section)

### Sass Helper
https://marketplace.visualstudio.com/items?itemName=ramyaraoa.sass-helper
- Convert your css to scss by extracting mixins and nesting rules and properties in scss files in Visual Studio Code using the Sass Helper.
- Create a scss/sass file with nested rules for an existing css file. (using sass-convert)
Create a sass file for an existing scss file. (using sass-convert)
Nest css rules in a scss file. (using sass-convert)
Nest css properties with same namespace in a scss file.
Extract a mixin out of selected css properties in a scss file.
Few features of this extension use the sass-convert command-line tool which can be installed from http://sass-lang.com/install

### Beautify css/sass/scss/less
https://marketplace.visualstudio.com/items?itemName=michelemelluso.code-beautifier
Beautify css, sass and less code (extension for Visual Studio Code)
Command `beautify.format`
If you beautify other languages ​​the code/text will be beautified to Visual Studio Code's default formatter.

### Sass Formatter
https://marketplace.visualstudio.com/items?itemName=sasa.vscode-sass-format
Sass formatter extension for VS Code built on top of sass-convert. Beautify sass, scss and css files.
Requires sass command line tools to be installed. Tested sass command line tools: Sass 3.5.3.

### TypeScript Import
https://marketplace.visualstudio.com/items?itemName=kevinmcgowan.TypeScriptImport
simply declare it inline, accept the code hint and the plugin deals with the rest

### IntelliSense for CSS class names
https://marketplace.visualstudio.com/items?itemName=Zignd.html-css-class-completion
A Visual Studio Code extension that provides CSS class name completion for the HTML class attribute based on the CSS class definitions that can be found in your workspace or in external files referenced through the link element.
Gives you autocompletion for CSS class definitions that can be found in your workspace (defined in CSS files or the in types listed in the Supported Language Modes section)
Supports external stylesheets referenced through link elements in HTML files
Command to manually re-cache the class definitions used in the autocompletion

### HTML CSS Support
https://marketplace.visualstudio.com/items?itemName=ecmel.vscode-html-css
Class attribute completion.
Id attribute completion.
Supports Zen Coding completion for class and id attributes.
Scans workspace folder for css and scss files.
Supports remote css files.
Uses vscode-css-languageservice.

### JS-CSS-HTML Formatter
https://marketplace.visualstudio.com/items?itemName=lonefy.vscode-JS-CSS-HTML-formatter
wraps js-beautify to format your JS, CSS, HTML, JSON file.

### Latest TypeScript and Javascript Grammar
https://marketplace.visualstudio.com/items?itemName=ms-vscode.typescript-javascript-grammar

### HTML Class Suggestions
https://marketplace.visualstudio.com/items?itemName=AndersEAndersen.html-class-suggestions
Suggestions based on the css files in your workspace.
Monitors your workspace for css file changes and refreshes the suggestions if needed.
css parsing using the css npm module.
Avoids parsing identical files by comparing file hash.
Language support: html, php

### SCSS IntelliSense
https://marketplace.visualstudio.com/items?itemName=mrmlnc.vscode-scss
SCSS IntelliSense (Variables, Mixins and Functions) for all files in the workspace.
Code Completion Proposals (variables, mixins, functions) — description
Hover (variables, mixins, functions) — description
Signature Help (mixins, functions) — description
Code navigation
Go to (variables, mixins, functions) — description
Show all All Symbol Definitions in Folder (variables, mixin, functions) — description
Visual Studio reference comments: // <reference path="./variable.scss" />.
Import files by @import "filepath"; from anywhere. Even outside of the open workspace.

### JS Refactorings
https://marketplace.visualstudio.com/items?itemName=cmstead.jsrefactor

### HTML SCSS Support
https://marketplace.visualstudio.com/items?itemName=P-de-Jong.vscode-html-scss
Class attribute completion.
Id attribute completion.
Supports @import.
Scans workspace folder for scss files.
Supports Angular projects by looking for component scss files relative to the opened component html file.
Press F12 to go to definition(s).
Uses vscode-css-languageservice.

### TypeScript Import
https://marketplace.visualstudio.com/items?itemName=kevinmcgowan.TypeScriptImport


***
