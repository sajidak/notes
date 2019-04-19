# VS Code extensions for Ruby on Rails

## Shortlisted
- [ ] TBD

## Read More
- https://github.com/rubyide/vscode-ruby/wiki/1.-Debugger-Installation
- https://github.com/rubyide/vscode-ruby/wiki/2.-Launching-from-VS-Code
- https://github.com/rubyide/vscode-ruby/wiki/5.-Example-configurations
- https://github.com/rubyide/vscode-ruby/wiki/3.-Attaching-to-a-debugger

## To Evaluate
- [x] https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby
- [x] https://marketplace.visualstudio.com/items?itemName=castwide.solargraph
- [x] https://marketplace.visualstudio.com/items?itemName=bung87.rails
- [x] https://marketplace.visualstudio.com/items?itemName=jemmyw.rails-fast-nav
- [x] https://marketplace.visualstudio.com/items?itemName=hridoy.rails-snippets
- [ ] https://marketplace.visualstudio.com/items?itemName=vortizhe.simple-ruby-erb
- [ ] https://marketplace.visualstudio.com/items?itemName=matthieumu.vscode-rubycommentdoc
- [ ] https://marketplace.visualstudio.com/items?itemName=HookyQR.ruby-starter
- [ ] https://marketplace.visualstudio.com/items?itemName=endverbraucher.pack-rails
- [ ] https://marketplace.visualstudio.com/items?itemName=newaeonweb.extension-utilities-pack
- [ ] https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop
- [ ] https://marketplace.visualstudio.com/items?itemName=miguel-savignano.ruby-symbols
- [ ] https://marketplace.visualstudio.com/items?itemName=siliconsenthil.rufo-vscode
- [ ] Other
  - [ ] https://github.com/kaiwood/vscode-endwise


### rebornix.Ruby - Ruby
- https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby
- Provides Ruby language and debugging support for Visual Studio Code

- Addl Gems 
  - gem install ruby-debug-ide
  - gem install solargraph
  - gem install debase # (or gem install byebug)
  - gem install rcodetools
  - gem install rufo
  - gem install rubocop


- Addl Extns
  - https://marketplace.visualstudio.com/items?itemName=kaiwood.endwise
  - https://marketplace.visualstudio.com/items?itemName=castwide.solargraph



- may need to manually install gem dependencies like rubocop, ruby-debug-ide or solargraph.
	- For debugging, try
	- `ruby -v`
	- `gem env gemdir`
	- `gem list | grep rubocop`
	- `which rubocop`
	- `rubocop -v`
- Language Server
- Debugger
	- Dependencies
	- `gem install ruby-debug-ide`
	- `gem install debase` (or `gem install byebug`)
- Linters
	- Available Linter hooks
    - ruby -wc (installed by default)
    - rubocop
    - ruby-lint
    - reek
    - fasterer
    - debride
- Formatting
	- Rubocop (`gem install rubocop`)
	- Rufo
	- endwise
- Autocomplete
	- rcodetools
	- Solargraph
- Intellisense (Go to/Peek Definition/Symbols)
	- rubyLocate
	- Solargraph


### castwide.solargraph - Ruby Solargraph
- https://marketplace.visualstudio.com/items?itemName=castwide.solargraph
- A Ruby language server featuring code completion, intellisense, and inline documentation

- Context-aware suggestions and documentation for the Ruby core
- Detection of some variable types and method return values (e.g., String.new. returns String instance methods)
- Identification of local, class, and instance variables within the current scope
- Find references and rename symbols (experimental as of solargraph gem v0.22.0)
- Support for gems
- Near-complete support for the Ruby core and stdlib
- Partial support for Ruby on Rails

### bung87.rails - Rails
- https://marketplace.visualstudio.com/items?itemName=bung87.rails
- Ruby on Rails support for Visual Studio Code

- Ruby on Rails "Asset Helpers" and "Tag Helpers" snippets.
- .erb syntax highlights.
- Navigation between related files through command.
- Go to Definition.
- View path suggestion 、Model's static method suggestion and Model's field suggestion.
- Open online document to the side through command.

### jemmyw.rails-fast-nav - Rails Fast Nav
- https://marketplace.visualstudio.com/items?itemName=jemmyw.rails-fast-nav
- Commands to move between files in a Rails application.

- Navigate to all known files (alt+r) [command.railsFastNavigation]
- Switch to model [command.railsFastSwitchToModel]
- Switch to controller [command.railsSwitchToController]
- Switch to view [command.railsFastSwitchToView]
- Switch to test/spec [command.railsFastSwitchToTest] + alias [command.railsFastSwitchToSpec]
- Switch to fixture [command.railsFastSwitchToFixture]
- Create View [command.railsCreateView]
- Create Spec [command.railsCreateSpec]



### hridoy.rails-snippets - Ruby on Rails
- https://marketplace.visualstudio.com/items?itemName=hridoy.rails-snippets
- 10K+ snippets & daily update



### vortizhe.simple-ruby-erb - Simple Ruby ERB
> Skip

Provides simple Ruby and ERB language, code snippets and ERB tag helper support for Visual Studio Code without messing with linting or debugging

- Both Ruby and ERB Syntax Highlighting
- Command for toggle between ERB tags
- Code Snippets


### matthieumu.vscode-rubycommentdoc - Ruby Comment Doc
> Skip

Generates comments for Ruby files


### HookyQR.ruby-starter - Ruby Starter Pack
> Review and manually install extns of interest


### endverbraucher.pack-rails - Ruby and Rails Extension Pack
> Review and manually install extns of interest

- rails
- gemfile
- ruby-symbols
- ruby-rubocop
- ruby
- haml
- simple-ruby-erb
- rails-i18n
- haml
- docs-yaml
- rspec-snippets
- rails-run-spec-vscode


### newaeonweb.extension-utilities-pack - > Review and manually install extns of interest
> Review and manually install extns of interest

### misogi.ruby-rubocop - ruby-rubocop
execute rubocop for current Ruby code.
rubocop is code analyzer for ruby.
`gem install rubocop`


### miguel-savignano.ruby-symbols - ruby-symbols
> Skip

Search methos in ruby using go to symbol in file



### siliconsenthil.rufo-vscode - rufo-vscode
Ruby code formatter using rufo gem
`gem install rufo`



## Recommended Settings
From https://marketplace.visualstudio.com/items?itemName=HookyQR.ruby-starter

```json
	"dash.docset": { "npm": ["json"], "svg": ["svg"], "javascript": ["javascript", "node", "mongodb", "sinon", "chai", "cordova", "nodemongo"], "monkeyc": ["monkeyc"] },
	"editor.insertSpaces": true,
	"editor.lineNumbers": "on",
	"editor.renderWhitespace": "all",
	"editor.tabSize": 2,
	"gitlens.advanced.maxListItems": 100,
	"gitlens.advanced.messages": { "suppressCommitHasNoPreviousCommitWarning": false, "suppressCommitNotFoundWarning": false, "suppressFileNotUnderSourceControlWarning": true, "suppressGitVersionWarning": false, "suppressLineUncommittedWarning": false, "suppressNoRepositoryWarning": true, "suppressResultsExplorerNotice": true, "suppressShowKeyBindingsNotice": true, "suppressUpdateNotice": true, "suppressWelcomeNotice": false },
	"gitlens.advanced.telemetry.enabled": false,
	"gitlens.blame.avatars": false,
	"gitlens.blame.format": "${message|25?} ${author|10-} ${date|8}",
	"gitlens.blame.heatmap.enabled": false,
	"gitlens.blame.highlight.locations": ["gutter", "line", "overview"],
	"gitlens.codeLens.authors.enabled": false,
	"gitlens.codeLens.enabled": false,
	"gitlens.codeLens.recentChange.enabled": false,
	"gitlens.defaultDateFormat": "DD-MM-YY",
	"gitlens.explorers.avatars": false,
	"gitlens.heatmap.toggleMode": "window",
	"gitlens.historyExplorer.enabled": true,
	"gitlens.historyExplorer.location": "scm",
	"gitlens.mode.statusBar.enabled": false,
	"gitlens.outputLevel": "verbose",
	"gitlens.recentChanges.highlight.locations": ["gutter", "line"],
	"gitlens.resultsExplorer.files.layout": "list",
	"gitlens.resultsExplorer.location": "scm",
	"gitlens.statusBar.enabled": false,
	"gitlens.statusBar.reduceFlicker": true,
	"htmlhint.enable": true,
	"ruby.codeCompletion": "rcodetools",
	"ruby.format": "rubocop",
	"ruby.intellisense": "rubyLocate",
	"ruby.lint": { "rubocop": true },
	"telemetry.enableCrashReporter": false,
	"telemetry.enableTelemetry": false,
	"trailing-spaces.highlightCurrentLine": false,
	"trailing-spaces.logLevel": "none",
	"vsicons.dontShowNewVersionMessage": true,
	"vsicons.projectDetection.disableDetect": true,
	"cSpell.diagnosticLevel": "Hint",
	"cSpell.language": "en-GB,en",
	"cSpell.enabledLanguageIds": [ "asciidoc", "c", "cpp", "csharp", "css", "erb", "go", "handlebars", "html", "jade", "javascript", "javascriptreact", "json", "latex", "less", "markdown", "php", "plaintext", "pub", "python", "restructuredtext", "ruby", "rust", "scss", "text", "typescript", "typescriptreact", "yml" ],
	"cSpell.showStatus": false,
```
