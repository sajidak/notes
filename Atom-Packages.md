---
title: Atom PAckages
---

# Atom packages for markdown

[TOC]

**Temporary update - till image fixed**
```bash
# Update
rsync -nvh /media/sak/70_Current/Work/buffer/markdown-themeable-pdf-configs/* ~/.atom/markdown-themeable-pdf/
```

## keybindings
```js
'body':
  'alt-z':        'editor:toggle-soft-wrap'
```

## Install
- [x] markdown-preview-enhanced
- [x] markdown-table-editor
- [x] atom-mdtoc
- [x] document-outline
- [x] lines
- [x] language-markdown
- [x] markdown-themeable-pdf
- [ ] pdf-view

## Now Installed

### Date
- Insert the current date & time at cursor
- date:date, date:time, and date:datetime
- Date Time Format `DDD, DD-MMM-YYYY HH24:MI:SS +0530`
- Keybinding
```
'body':
  'ctrl-shift-I': 'date:datetime'
```

### lines
- Sort (case sensitive or not)
- Reverse
- Unique
- Shuffle

### markdown-table-editor
- **Works Beautifully**
- Format table (automatically)
- Move cursor from cell to cell
- Alter column alignment
- Insert and delete rows and columns
- CJK characters support


### document-outline
- **works**
- Displays a hierarchical, interactive outline tree view of your document
- highlights current section in editor
- Keybinding
```js
'body':
  'ctrl-alt-o': 'document-outline:toggle'
  ```

### markdown-preview-enhanced
`Mon, 08-May-2017 16:05:30 +0530`
- [ ] recommended: language-gfm-enhanced
- disable `markdown-preview`, and add in keymap
```
'.editor:not(.mini)':
  'ctrl-shift-M': 'markdown-preview-enhanced:toggle'
```
- disable in setting `Keybindings`
- Scrool sync, 2 side
- pandoc
- TOC gen (beta)
	- can also create TOC by inserting `[TOC]` to your markdown file
- export HTML, mobile friendly
- many more . . .
- Customization:
```bash
# How to use this?
/home/sak/.atom/markdown-preview-enhanced/phantomjs_header_footer_config.js

```


### markdown-themeable-pdf
https://atom.io/packages/markdown-themeable-pdf
- `markdown-preview-enhanced` can also export html
- exports markdown file to PDF, HTML, JPEG or PNG format
- start new PDF page by typing Snippet `page-break` in editor
- custom css
	- `~/.atom/markdown-themeable-pdf/styles.css` or
	- per project `project-path/markdown-themeable-pdf/styles.css`
	- or define path in settings
	- Custom header & Custom footer
		- `~/.atom/markdown-themeable-pdf/header.js`
		- `~/.atom/markdown-themeable-pdf/footer.js`
		- per project settings also
		- or keep at custom location
- Known - Table header glitches when a table starts directly on a new page
	- put in your markdown in front of the table an html code <div class="page-break" /> to prevent this.
- Customization
-
|     file     |                intent                |
| ------------ | ------------------------------------ |
| document.css | default styles that will be applied? |
| footer.js    | footer content in html format        |
| header.js    | header content in html format        |
| logo.png     | not needed                           |
| styles.css   | custom styles that will be applied   |
- backups are at `~/70_Current/Work/buffer/markdown-themeable-pdf-configs/`
- Styles that will be applied `~/.atom/packages/markdown-themeable-pdf/css/document.css`
- Default Settings `~/.atom/packages/markdown-themeable-pdf/lib/markdown-themeable-pdf.js`

### pdf-view
https://atom.io/packages/pdf-view
- Adds support for viewing PDF files in Atom.
- Powered by [PDF.js](https://github.com/mozilla/pdf.js)
- ?? SumatraPDF for windows??


### markdown-folder
- **Not of much use. Remove.**
- folds and unfolds markdown headings and fenced code blocks
- **WORKS**, Need to manually add keybindings

### language-gfm-enhanced
- fork of language-gfm extended to support some features of markdown-preview-enhanced.

### sorter
- Alphabetic Sort
	- default javascript sorting function
	- `sorter:sort`
- Natural Sort
	- sorts like a human
	- uses javascript-natural-sort
	- `sorter:natural-sort`

### atom-mdtoc (best option, `Mon, 08-May-2017 16:05:38 +0530`)
- Auto linking via anchor tags
- Depth control e.g. maxDepth:6
- Refresh list on save with updateOnSave:1 (disable with updateOnSave:0)
- Exclude the first h1-level heading in a file with firsth1:0 (include with firsth1:1)
- Use spaces instead of bullets with bullets:0 (use bullets with bullets:1)
- Use a flatten list instead of a tree with flatten:1 (use tree with flatten:0)
- Header numbering with numbering:1 (disable with numbering:0)
- Works with repeated headings (see also this Table Of Contents)

***
## Sample, Tests
### Table1
|   col1   |   col2   |             col3              |
| -------- | -------- | ----------------------------- |
| data1    | data 2   | data 3                        |
| data     | **long** | _aasda_                       |
| col1     | col2     | ~~col 3~~                     |
| aardvark | data     | very long data in this column |
***

## Read more
- [ ] https://wkhtmltopdf.org/
	- [ ] https://atom.io/packages/gfm-pdf
- [ ] https://github.com/swinton/pdfify
	- Generates Octocat-friendly PDFs from Markdown
- [ ] markdown-mindmap
- [ ] atom-justify
- [X] atom-section-divider
- [x] unity-ui (does not exist)
- [x] language-markdown
- [x] autoclose-html
- [x] markdown-writer
	- Convenience shortcuts for convenient editing
- [ ] Preview
	 https://atom.io/packages/preview
	 Preview source code in compiled form in separate tab
	 Shows loading and error messages
	 Updates on Tab Change

- [ ] Perl
	- [ ] language-perl6
	- [ ] language-perl
	- [ ] atom-perl6-editor-tools
	- [ ] linter-perl-lint
	- [ ] linter-perl-check-syntax
- [ ] JS Docs
	- [ ] atom-easy-jsdoc
	- [ ] jsdoc

- [ ] [Pandoc](http://pandoc.org) File format converters
	- ** CHECK THIS OUT ASAP**
	- **From** md, html, docx, odt
	- **To** html5, html slide show, docx, odt, opendoc xml, epub, pdf via latex, md
	- see
		- http://pandoc.org/installing.html
		- http://www.tug.org/texlive/
		- https://www.npmjs.com/package/pandoc-bin
	-  pandoc - Pandoc Previewer

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


## Other Evaluated
### pdfify-atom
https://atom.io/packages/pdfify
- Needs [pdfify](https://github.com/swinton/pdfify)
	- Generates Octocat-friendly PDFs from Markdown
	- generate a PDF `pdfify /path/to/some/markdown/file.md`
	- To insert a page break, include a {.page-break} header attribute `# Lorem ipsum {.page-break}`
	- Customized styles - create a ~/.pdfify/style.css based off the included lib/style.css
	- Customized header / footer - create a ~/.pdfify/header.html /  ~/.pdfify/footer.html based off lib/header.html / lib/footer.html

### wkhtmltopdf and wkhtmltoimage
**Not package, but dependency**
https://wkhtmltopdf.org/
- un entirely "headless"
- download from https://wkhtmltopdf.org/downloads.html
- Linux - depends on: zlib, fontconfig, freetype, X11 libs (libX11, libXext, libXrender)
- `wkhtmltopdf [GLOBAL OPTION]... [OBJECT]... <output file>`
- `wkhtmltopdf path/to/html/file google.pdf`
- see manual at https://wkhtmltopdf.org/usage/wkhtmltopdf.txt

### markdown-pdf
- depends on markdown-preview , marked
	- will not work as markdown-preview-enhanced is installed

- [x] atom-beautify
	- Beautify HTML, CSS, JavaScript, PHP, Python, Ruby, Java, C, C++, C#, Objective-C, CoffeeScript, TypeScript, Coldfusion, SQL, and more in Atom
	- It will only beautify selected text if a selection is found – if not, the whole file will be beautified.
	- Beautify On Save can be enabled for each language individually.


- [x] markdown-document
	- **Fixed in 1.17**
	- Expandable Outline View
	- Supports Multiple Panes
	- Click to go to header
	- Outline Refreshes on Save
	- Handling and Marking Non-Sequential Headers
	- Manual Refresh

- [x] tidy-markdown
	- depends on git
	- formats tables
	- renumbers lists
	- cleans up empty lines


- ~~markdown-folding~~ - It folds and unfolds markdown sections following the headers.

- [x] markdown-toc
	- Auto linking via anchor tags, e.g. # A 1 → #a-1
	- Depth control [1-6] with depthFrom:1 and depthTo:6
	- Enable or disable links with withLinks:1
	- Refresh list on save with updateOnSave:1
	- Use ordered list (1. ..., 2. ...) with orderedList:0

- [x] markdown-toc-auto
	- Insert TOC
	- Automatically update TOC on editor save.
	- Customizable max and min level of header to use. auto update, inlucde link or not.
	- Extract only markdown header by using Atom's scope descriptor used in syntax highlight(So ignore # in embedded code in markdown).
	- Generate link for GitHub wiki
	- Remove invalid char for link
	- Extract inner text(xxx) from <kbd>xxx</kbd> tag and use in link.

- [x] atom-material-ui
	- requires Atom 1.17
	- not very suitable for intended use



## `keymap.json` extract
```js
'body':
  'alt-z':        'editor:toggle-soft-wrap'
  'ctrl-shift-I': 'date:datetime'
  'ctrl-alt-o':   'document-outline:toggle'
  'ctrl-shift-M': 'markdown-preview-enhanced:toggle'

/* This package will not be installed
'atom-text-editor[data-grammar="source gfm"]:not([mini])':
  'alt-c':        'markdown-folder:cycle'
  'ctrl-alt-c':   'markdown-folder:cycleall'
  'alt-x':        'markdown-folder:togglefenced'
  'ctrl-alt-x':   'markdown-folder:toggleallfenced'
  'alt-t':        'markdown-folder:toggle'
  'ctrl-alt-0':   'markdown-folder:unfoldall'
  'ctrl-alt-1':   'markdown-folder:foldall-h1'
  'ctrl-alt-2':   'markdown-folder:foldall-h2'
  'ctrl-alt-3':   'markdown-folder:foldall-h3'
  'ctrl-alt-4':   'markdown-folder:foldall-h4'
  'ctrl-alt-5':   'markdown-folder:foldall-h5'
  */
```

## Configuration
### markdown-preview
- `Break on Single Newline` = CHECK
- `Use Github.com style`
### tree-view
- `Always Open Existing` = CHECK
- `Auto Reveal` = UNCHECK (Will turn off tree hide)
### markdown-preview-enhanced
- Disable package `markdown-preview`, keymaps conflict
- `Keybindings` > `Enable` = UNCHECK
### markdown-themeable-pdf


## Info
- symbols-view
```
'.platform-linux atom-text-editor':
	'ctrl-r': 			'symbols-view:toggle-file-symbols'
'.platform-linux atom-text-editor':
	'ctrl-alt-down':	'symbols-view:go-to-declaration'
'.platform-linux atom-text-editor':
	'ctrl-alt-up': 		'symbols-view:return-from-declaration'
```

## Further Reading
- http://www.alanverga.com/blog/2014/10/19/html-to-pdf-with-phantomjs
- **Headers and Footers**
	- http://phantomjs.org/api/webpage/property/paper-size.html
	- A repeating page header and footer can also be added via the header and footer property. These can be provided as an object that contains a height and a contents property. The contents property must be set as a phantom.callback object.
```js
header: {
	height: "1cm",
	contents: phantom.callback(function(pageNum, numPages) {
	  return "<h1>Header <span style='float:right'>" + pageNum + " / " + numPages + "</span></h1>";
	})
},
footer: {
	height: "1cm",
	contents: phantom.callback(function(pageNum, numPages) {
	  return "<h1>Footer <span style='float:right'>" + pageNum + " / " + numPages + "</span></h1>";
	})
}
```
