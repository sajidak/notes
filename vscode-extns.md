# VSCode extensions [](title)[](notoc)
`Fri 2017-May-26 17:25:20.046 +05:30`

```bash
#Patch markdown-pdf:
rsync -vhr /media/sak/70_Current/Work/buffer/vscode-xtns-bak/yzane.markdown-pdf-0.1.7 /home/sak/.vscode/extensions
# backup extensions:
rsync -vhr ~/.vscode/extensions/ /media/sak/70_Current/Work/buffer/vscode-xtns-bak/
# restore extensions:
rsync -vhr /media/sak/70_Current/Work/buffer/vscode-xtns-bak/ ~/.vscode/extensions/
```

***
## Contents [](notoc)
[](toc)

***
### Install extensions from Quick Open
Launch VS Code Quick Open (`Ctrl+P`), paste the following command, and press enter.

ext install ms-vscode.csharp
ext install k--kato.docomment
ext install jchannon.csharpextensions
ext install lukehoban.Go
ext install ms-vscode-devlab.vscode-mongodb
ext install joelday.docthis
ext install vscode-eslint
ext install jsynowiec.vscode-insertdatestring
ext install Kevenin.markdowninclude
ext install darkriszty.markdown-table-prettify
ext install AlanWalk.markdown-toc
ext install chrmarti.regex

# To Evaluate
## VSCode Map Preview
	jumpinjackie.vscode-map-preview
- VSCode extension for visually previewing geospatial file content (GeoJSON, KML, etc) on a map
- Support for various formats is available through the format drivers provided by the OpenLayers library

## Extensible Markdown Converter
	sakryukov.convert-markdown-
extend Markdown features by installing any of the "markdown-it" plug-ins that are abundantly available in the npm package registry

## Ionic Preview
	ionic-preview.ionic-preview
Preview a live version of your Ionic application in an VS Code pane.


# Markdown
> Need both for used formatting
1. `Markdown All in One`
2. `Markdown Extended`

## Markdown Preview Github Styling
	bierner.markdown-preview-github-styles
Changes VS Code's built-in markdown preview to match Github's style

## Markdown All in One
	yzhang.markdown-all-in-one
Keyboard shortcuts
Table of contents
Outline view
Automatically show preview
Print Markdown to HTML
List editing
GitHub Flavored Markdown
Override "Open Preview" keybinding with "Toggle Preview"
* Supports list numbering
* footnotes not supported
* definitions not supported
* abbr no support

## Markdown Extended
	jebbs.markdown-extended
Extended syntaxes to built-in markdown & What you see is what you get exporter.
Export to Self Contained HTML / PDF / PNG / JPEG
Editing Helpers
add per-file settings inside markdown to override user settings
Paste as Markdown Table
markdown-it-table-of-contents [[TOC]]
markdown-it-container
markdown-it-deflist
* supports footnotes
* no support lists
* abbr support
* definitions


***
# CSS-SCSS (2018 Aug 01)
## Shortlist items
- HTML CSS Support
- JS & CSS Minifier


## HTML CSS Support
ecmel.vscode-html-css
- Missing CSS support for HTML documents.
- Class attribute completion.
- Id attribute completion.
- Supports Zen Coding completion for class and id attributes.
- Scans workspace folder for css and scss files.
- Supports remote css files.
- Uses vscode-css-languageservice.


## IntelliSense for CSS class names in HTML
Zignd.html-css-class-completion
- https://github.com/zignd/HTML-CSS-Class-Completion
- CSS class name completion for the HTML class attribute based on the definitions found in your workspace.
- Command to manually re-cache the class definitions used in the autocompletion

## IntelliSense for CSS, SCSS class names in HTML and Slim
gencer.html-slim-scss-css-class-completion
- CSS and SCSS class name completion for the HTML and Slim class attribute based on the definitions found in your workspace.

## Live Sass Compiler
ritwickdey.live-sass
- Live SASS & SCSS Compile.
- Customizable file location of exported CSS.
- Customizable exported CSS Style (expanded, compact, compressed, nested).
- Customizable extension name (.css or .min.css).
- Quick Status bar control.
- Exclude Specific Folders by settings.
- Live Reload to browser (Dependency on Live Server extension).
- Autoprefix Supported (See setting section)


## Easy Compile
refgd.easy-compile
- Compile TypeScript and Less/Sass/Scss on save
- Support autoprefixer for Less/Sass/Scss
- Support mearge all media queries
- Support inline setting (Only for Complie)
- minify .js and .css files

## openapi-lint
mermade.openapi-lint
- Validation using oas-validator from OAS-Kit
- Linting using oas-linter also from OAS-Kit
- OAS v3 intellisense for files named openapi.json, openapi.yaml, openapi.yml
- OAS v2 intellisense for files named swagger.json, swagger.yaml, swagger.yml
- Conversion between JSON and YAML
- Snippets (minimal valid openapi/swagger JSON and YAML documents)

## JS & CSS Minifier
olback.es6-css-minify
- A simple Javascript & CSS minifier.
- Dependencies
	- uglify-es
	- clean-css

## CSS Compressor
bestvow.css-compressor





# New Review (2017-Nov-25)
### C#
https://marketplace.visualstudio.com/items?itemName=ms-vscode.csharp

### C# XML Documentation
https://marketplace.visualstudio.com/items?itemName=k--kato.docomment
- Type "///", it auto-generates an XML doucumentation comment

### C# Extensions
https://marketplace.visualstudio.com/items?itemName=jchannon.csharpextensions
- Add C# Class
- Add C# Interface
- Add fields from constructors
- Add constructor from properties
- Add read-only property from constructors
- Add property from constructors
- This extension traverses up the folder tree to find the project.json or *.csproj and uses that as the parent folder to determine namspaces.

### Go
https://marketplace.visualstudio.com/items?itemName=lukehoban.Go
- Post-install Steps
	- Rebuild from memory
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

### Docker
https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker
- Automatic Dockerfile and docker-compose.yml file generation
- Syntax highlighting and hover tips for docker-compose.yml and Dockerfile files
- IntelliSense (completions) for Dockerfile and docker-compose.yml files
- Linting (errors and warnings) for Dockerfile files
- Command Palette (F1) integration for the most common Docker commands (e.g. Build, Push)
- Explorer integration for managing Images and Containers
- Deploy images from DockerHub and Azure Container Registries to Azure App Service

### mssql
https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql
- Connect to Microsoft SQL Server, Azure SQL Database and SQL Data Warehouses.
- Create and manage connection profiles and most recently used connections.
- Write T-SQL script with IntelliSense, Go to Definition, T-SQL snippets, syntax colorizations, T-SQL error validations and GO batch separator.
- Execute your scripts and view results in a simple to use grid.
- Save the result to json or csv file format and view in the editor.
- Customizable extension options including command shortcuts and more.

### ~~MySQL~~
https://marketplace.visualstudio.com/items?itemName=formulahendry.vscode-mysql
**Look fot others too**
- Manage MySQL Connections
- List MySQL Servers
- List MySQL Databases
- List MySQL Tables
- Run MySQL Query

### MongoDB
https://marketplace.visualstudio.com/items?itemName=ms-vscode-devlab.vscode-mongodb
- Connect to local or hosted (e.g. Azure CosmosDB) servers
- Create and view MongoDB databases and collections with the MongoDB Explorer
- Author MongoDB "Scrapbooks" with rich IntelliSense (completions) for MongoDB scripts, including collections
- Execute scripts and see results directly in VS Code
- Update documents in place

### TODO:
Add extensions for
- js
- ts
- html5
- scss, css
- bundling
- minify
- linters
- formatters

***

# Installed
## C#
- `ms-vscode.csharp`
- C# for Visual Studio Code (powered by OmniSharp)

## Document This
- `joelday.docthis`
- automatically generates detailed JSDoc comments for both TypeScript and JavaScript files
- @class, @description, @enum, @export, @function, @implements, @interface, @param, @private, @returns, @static, @template, @type and @memberOf

## ESLint
- `vscode-eslint`
- Integrates ESLint into VS Code
- Need to install ESLint seperately

## Insert Date String
- `jsynowiec.vscode-insertdatestring`
- Insert DateTime, Insert Timestamp, Insert Formatted DateTime

## Markdown Include
- `Kevenin.markdowninclude`
- merge Markdown files from various locations to one file.
- !import`/path/from/root/import.md
- can be anywhere in the file

## Markdown table prettifier
`darkriszty.markdown-table-prettify`
- **Works**
- Similar to 'Markdown writer' in atom
- select the entire table, then right click to format
- not live, need to invoke command

## Markdown-TOC
- `AlanWalk.markdown-toc`
- outline numbered toc
- similar to atom

## Mono Debug
- `ms-vscode.mono-debug`
- sudo apt-get install mono-complete

## mssql
- `ms-mssql.mssql`


## MarkdownConverter
- `manuth.markdown-converter`
- alternative to 'Markdown PDF'
- **Install and trail**, looks most configurable
- convert MarkDown-files to html, png, or pdf
- DateTime-Formatting, configuring your own CSS-styles, setting Headers and Footers, FrontMatter
- Detailed config, front page, odd/even page...
    - https://github.com/manuth/MarkdownConverter/wiki/Config
- Does it work offline?

## Markdown PDF
- `yzane.markdown-pdf`
- alternative to 'MarkdownConverter'
* Syntax highlighting
* emoji
* checkbox
* Single style header and footer for all pages

## Perl
- `henriiik.vscode-perl`
- code intelligence for the perl language to Visual Studio Code, mainly through the use of Exuberant Ctags.
- Formatting is also supported with use of Perl::Tidy.
- *Review, trail and remove if not needed for regular use*

## Preview
- `searKing.preview-vscode`
- previewer of Markdown, ReStructured Text, HTML, Jade, Mermaid files, Image's URI or CSS properties

## Reflow paragraph
- `TroelsDamgaard.reflow-paragraph`
- Format the current paragraph to have lines no longer than your preferred line length, using alt+q

## Regex Previewer
- `chrmarti.regex`
- Shows the current regular expression's matches in a side-by-side document. This can be turned on/off

***
# Review Sun 2017-Oct-15

## Extensible Markdown Converter
- `sakryukov.convert-markdown-to-html`
- What works?
    Breaks footnotes
    Outline number list works for 2 levels

 1. See [Configuration and Usage](https://sakryukov.github.io/vscode-markdown-to-html/)
 2. user can extend features by installing any of the "markdown-it" plug-ins
 3. Conversion of individual file or all Markdown files of the current Visual Studio Code workspace;
 4. A possibility of installation of “markdown-it” plug-ins in an arbitrary directory, without the need to install “markdown-it” itself;
 5. Optional user-configurable auto-numbering with rich set of options;
 6. User-configurable Markup syntax coloring for plug-ins;
 7. Optional embedding of CSS in HTML;
 8. Optional Detection of the document title based on user-configurable Regular Expression;
 9. Optional preview in the default Web browser;
1. Preview in Visual Studio Code, in a full-size window or side by side, with styles fully matching generated HTML file;
2. Configuration of all processing detail of the extension, “markdown-it” and its plug-ins, from a single source.
3. **Extras**
    1. Tagging for detection of the document title
        1. `[](title)`
    2. File include declaration
    3. Table of Contents (TOC) tag
        2. `[](toc)` on a line by itself
    4. Exclude from TOC tag
        3. `[](notoc)` on same line as header, at end

## Markdown Extended (not working as espected)
- `jebbs.markdown-extended`
- use this plugin with Markdown Styling plugins, or the export HTML pages are not styled:
[Markdown Preview Github Styling](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-preview-github-styles)
- To support extra export formats, like PDF/PNG/JPEG, you need to download phantom binary accordingly, and config User Settings: `"markdownExtended.phantomPath": "path/to/phantomjs.exe"`
1. Extended Ability
2. Export to HTML / PDF / PNG / JPEG {got error}
3. Copy HTML to clipboard
4. Extended Plugins
    1. markdown-it-table-of-contents
    2. markdown-it-footnote [^1]
    3. markdown-it-abbr
    4. markdown-it-sup
    5. markdown-it-sub
    6. markdown-it-checkbox [^Checkbox]
    7. markdown-it-attrs
    8. markdown-it-kbd
    9. markdown-it-underline
5. -
6. [^1]: Footnote one
[^Checkbox]: Footnote for checkbox

## Markdown Shortcuts (good, tables to check)
- `mdickin.markdown-shortcuts`
- Handy shortcuts for editing Markdown (.md, .markdown) files. Now with title and context menu integration!
- [x] - md-shortcut.toggleNumbers  (works with outline too)
- [x] - md-shortcut.toggleCheckboxes
- md-shortcut.addTableWithHeader
    - Makes pretty table

## Markdown Footnotes
- `bierner.markdown-footnotes`
- Adds `[^1]` footnote syntax support to VS Code's built-in Markdown preview

## Markdown helper
- `joshbax.mdhelper`
- Apply Markdown formatting to text (keyboard shortcuts, context menu)
- Change text case
- Format GFM table


## Markdown Checkbox


## Markdown All in One
- `yzhang.markdown-all-in-one`
- keyboard shortcuts, table of contents, auto preview and more
- Table formatter
- Document outline

## Markdown TOC
- `AlanWalk.markdown-toc`

## Markdown TOC
- `joffreykern.markdown-toc`
- Generate a Table of Content base on markdown title (from level 2 to 4).
- Replace an existing toc when generate it again
- Insert anchor on your titles
- Auto-saving when a toc is generated
- Configurable generation of
    - Numbering your table of contents
    - Save your document when table of content generated

## Markdown Preview Enhanced
- `jasonroger.markdown-preview-enhanced-fork`
- keybindings similar to atom-linux


# To Install


***
# Interesting - Test which is not already bundled

## Markdown PDF [78MB]
- `yzane.markdown-pdf`
- **HOLD for now**, compare with `vscode-pdf`
- convert Markdown file to pdf, html, png or jpeg file
- Syntax highlighting
- emoji
- checkbox
- markdown-pdf.convertOnSave


## Markdown helper
- `joshbax.mdhelper`
- **Hold for now**
- keyboard shortcuts, Format GFM table
- context menu support is new with VS Code version 1.3.0; it seems to work only in folder view and only after switching to a Markdown file (i.e. opening VS Code to a Markdown file doesn't properly add the menu items)

## FelschR.extbundles-csharp [See also]
This extension pack contains useful extensions for C# and especially .NET Core development.
- ms-vscode.csharp
- `Version Lens` pflannery.vscode-versionlens
	- Shows package version information for npm, jspm, bower, dub and dotnet core in the Visual Studio Code editor
	- Replaces the version text but does not automatically install packages when clicking a code lens link
- `C# XML Documentation Comments` k--kato.docomment
	- Generate XML documentation comments for Visual Studio Code.
- `NuGet Package Manager` jmrog.vscode-nuget-package-manager
	- add or remove .NET Core 1.1+ package references to/from your project's .csproj or .fsproj files using Code's Command Palette.
- `NuGet Reverse Package Search` jesschadwick.nuget-reverse-package-search
	- Adds reverse .NET Core package lookup support like the "Add Package" context menu item in full Visual Studio

## vscode-pdf
- `tomoki1207.pdf`
- Display pdf in VSCode
- incorporates components from
    - PDF.js (https://github.com/mozilla/pdf.js
- Does not work on Linux, not tested on Windows

## Other
- `HTML Snippets` abusaidm.html-snippets
- `IntelliSense for CSS class names` Zignd.html-css-class-completion
	CSS class name completion for the HTML class attribute based on the CSS files in your workspace
- `get` josephwoodward.vscodeilviewer
	allows you to rapidly inspect the IL output of any given C# file.
- `ASP.NET Helper` schneiderpat.aspnet-helper
	- parses your project to enable IntelliSense for Razor pages within an ASP.NET MVC project
- `Instant Markdown` dbankier.vscode-instant-markdown
	- edit markdown documents in vscode and instantly preview it in your browser
- `html tag wrapper` hwencc.html-tag-wrapper
- `Knockout.js Snippets for VS Code` furstenberg.knockoutjs

## Lua
### vscode-lua
`trixnz.vscode-lua`
- [x] Autocompletion
- [x] Go to Symbol
- [x] Error checking
- [x] Linting
- [ ] Code Snippets
Support for linting is provided via [luacheck](https://github.com/mpeterv/luacheck)




# Current Working
## Perl 6 code snippets
- `sergot.perl6snippets`

## Perl Debug
- `mortenhenriksen.perl-debug`

## perltidy-more
- `Kaktus.perltidy-more`


## md2pdf
- `qinjia.md2pdf`
- convert markdown file to pdf
- Converts the Markdown language to PDF not the Markdown formatting to PDF

## TODO
- Python-vscode
	- Python language pack for Visual Studio Code
- tomoki1207.pdf
	- Display pdf in VSCode

## vscode-comment
- https://github.com/Microsoft/vscode-comment


# Other Evaluated
- `Markdown checkbox` PKief.markdown-checkbox
	- provides shortcuts and some workspace configurations so you can create a checkbox and mark it quickly and smoothly
- `Markdown All in One` yzhang.markdown-all-in-one
	- **Works mostly**
	- Keyboard shortcuts, manual TOC, auto list items
	- TOC, removes first header, toc can only be at first line
	- can be only 1 h1, all other are ignored
	- ordered list, all items are numbered 1 in text, but rendered in sequence
- `Markdown Table Formatter` ~~josa.markdown-table-formatter~~
- `markdown handy` ~~NaccOll.markdown-handy~~
	- clone of ~~yzane.markdown-pdf~~ without options
	- Export to html or pdf
	- No dependencies
- `MarkdownConverter` ~~manuth.markdown-converter~~
	- **Does NOT work**
	- export your Markdown-file as PDF-, HTML or Image-file
	-  DateTime-Formatting, configuring your own CSS-styles, setting Headers and Footers, FrontMatter and much more
- `Markdown-TOC` ~~joffreykern.markdown-toc~~
	- generates a table of contents for your markdown file.
	- modifies the heading text to make into a link
- `Table Formatter` ~~shuworks.vscode-table-formatter~~
	- **appears broken** try `darkriszty.markdown-table-prettify`
	- manual invoke
	- Only table at current cursor position, or All tables in file
	- GitHub Flavored Markdow, Plain Text Table, G`rid Table, Simple Table

# keybindings.json
`~/.config/Code/User/keybindings.json`
```js
{ "key": "ctrl+alt+p",            "command": "markdownConverter.convert",
                                     "when": "editorFocus" }
```
# settings.json
`~/.config/Code/User/settings.json`
```js
    "editor.fontSize": 14,
    "editor.fontFamily": "'Noto Mono', 'Droid Sans Mono', 'Courier New', monospace, 'Droid Sans Fallback'",
    "editor.insertSpaces": false,
    "editor.wrappingIndent": "indent",
    "editor.wordWrapColumn": 120,
    "editor.dragAndDrop": true,
    "files.insertFinalNewline": true,
    "files.defaultLanguage": "md",
    "html.format.wrapAttributes": "force-aligned",
    "zenMode.hideTabs": false,
    "telemetry.enableCrashReporter": false,
    "telemetry.enableTelemetry": false,
	"insertDateString.format": "`DDD YYYY-MMM-DD hh:mm:ss.SS Z`\n",
    //
    // markdown
    "markdown.styles": [],
    "markdown.previewFrontMatter": "show",
    "markdown.preview.fontFamily": "Calibri, Carlito, -apple-system, BlinkMacSystemFont, 'Segoe WPC', 'Segoe UI', 'HelveticaNeue-Light', 'Ubuntu', 'Droid Sans', sans-serif",
    "markdown.preview.fontSize": 14,
    "markdown.enableExperimentalExtensionApi": true,
    //
    // markdown-toc
    "markdown-toc.orderedList": true,
    //
    // // markdown-pdf
    // // Output format: pdf, html, png, jpeg
    // // "markdown-pdf.type": "html",
    // "markdown-pdf.outputDirectory": "/media/sak/70_Current/_Notes/formatted-docs",
    // // Page Option. Page size: A3, A4, A5, Legal, Letter, Tabloid
    // "markdown-pdf.format": "Legal",
    // "markdown-pdf.styles": [],
    // // Set the style file name. for example: github.css, monokai.css ...
    // // ~/.vscode/extensions/yzane.markdown-pdf-0.1.7/styles/*.css
    // "markdown-pdf.highlightStyle": "github.css",
    // "markdown-pdf.breaks": true,
    // //
    // "markdown-pdf.border.top": "1.0cm",
    // "markdown-pdf.border.bottom": "1.0cm",
    // "markdown-pdf.border.right": "1cm",
    // "markdown-pdf.border.left": "1.5cm",
    // //
    // "markdown-pdf.header.contents": "<div style=\"text-align: right;\"><strong>Static Text, need to replace for each export</strong></div><hr/></br>",
    // "markdown-pdf.header.height": "2.9cm",
    // //
    // "markdown-pdf.footer.height": "1.8cm",
    // "markdown-pdf.footer.contents": "<hr/><div style=\"float:left;\">&copy;2017 oblak consulting</div><div style=\"float:right;\">Page {{page}} of {{pages}}</div>",
    //
    "reflow.preferredLineLength": 120,
    "docthis.includeDescriptionTag": true,
    //
    // MARKDOWN CONVERTER SETTINGS:
    // The path to save the converted files to.
    // Note: The path may be relative to the markdown-file that is to be converted.
    "markdownConverter.outDir": "/media/sak/70_Current/_Notes/formatted-docs",

    // The path to the working-directory.
    //
    // Note:
    // Each file-path, like, for example, the template, stylesheets etc. are relative to this path.
    // This path may be relative to the workspace-directory.
    "markdownConverter.workDir": ".",

    // true to convert the current file even if it's not written in Markdown; otherwise false.
    "markdownConverter.ignoreLanguage": false,

    // true to save the file automatically before the conversion-process; otherwise false.
    "markdownConverter.autoSave": true,

    // The quality of the rendered file.
    "markdownConverter.document.quality": 90,

    // Either a single or a set of types to convert the markdown-file to.
    // "markdownConverter.conversionType": "PDF",
    "markdownConverter.conversionType": [
        "PDF",
        "HTML"
    ],

    // Settings related to the document.
    "markdownConverter.document": {
    "emoji": "github",
    "layout": {
        "margin": {
        "top": "1cm",
        "right": "1cm",
        "bottom": "1cm",
        "left": "1cm"
        },
        "format": "A4",
        "orientation": "portrait"
    },
    "header": {
        "height": "15mm",
        "content": "<table style=\"width: 100%; table-layout: fixed; \"><td style=\"text-align: left; \">{{ Author }}</td><td style=\"text-align: center\">{{ PageNumber }}/{{ PageCount }}</td><td style=\"text-align: right\">{{ Company.Name }}</td></table>"
    },
    "footer": {
        "height": "1cm",
        "content": "<table style=\"width: 100%; table-layout: fixed; \"><td style=\"text-align: left; \"></td><td style=\"text-align: center\">{{ CreationDate }}</td><td style=\"text-align: right\"></td></table>"
    }
    }
    //

```


# TO PROCESS
`Thu 2017-Jun-01`

mssql
ms-mssql.mssql
developing Microsoft SQL Server, Azure SQL Database and SQL Data Warehouse everywhere with a rich set of functionalities, including:

Connect to Microsoft SQL Server, Azure SQL Database and SQL Data Warehouses.
Create and manage connection profiles and most recently used connections.
Write T-SQL script with IntelliSense, Go to Definition, T-SQL snippets, syntax colorizations, T-SQL error validations and GO batch separator.
Execute your scripts and view results in a simple to use grid.
Save the result to json or csv file format and view in the editor.
Customizable extension options including command shortcuts and more.


markdownlint
DavidAnson.vscode-markdownlint

Markdown Theme Kit
ms-vscode.theme-markdownkit

## TO Update:
C#
Markdown Table Prettifier
Markdown TOC
