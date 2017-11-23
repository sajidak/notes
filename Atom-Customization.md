# Atom Customization

**Contents**
<!-- MDTOC maxdepth:6 firsth1:1 numbering:0 flatten:0 bullets:1 updateOnSave:1 -->

- [Atom Customization](#atom-customization)   
   - [Generic keybindings](#generic-keybindings)   
   - [Installed Packages](#installed-packages)   
      - [Removed Packages](#removed-packages)   
      - [Date](#date)   
      - [lines](#lines)   
      - [markdown-table-editor](#markdown-table-editor)   
      - [document-outline](#document-outline)   
      - [language-markdown](#language-markdown)   
      - [markdown-preview-enhanced](#markdown-preview-enhanced)   
      - [atom-mdtoc](#atom-mdtoc)   
      - [markdown-themeable-pdf](#markdown-themeable-pdf)   
      - [pdf-view](#pdf-view)   
      - [select-rectangle](#select-rectangle)   
- [Index](#index)   
   - [1. Read more](#1-read-more)   
   - [2. `keymap.json` extract](#2-keymapjson-extract)   
   - [3. Package Configurations](#3-package-configurations)   
      - [i. markdown-preview](#i-markdown-preview)   
      - [ii. tree-view](#ii-tree-view)   
      - [iii. markdown-preview-enhanced](#iii-markdown-preview-enhanced)   
      - [iv. atom-mdtoc](#iv-atom-mdtoc)   
      - [v. markdown-themeable-pdf](#v-markdown-themeable-pdf)   
      - [vi. markdown-themeable-pdf Customization](#vi-markdown-themeable-pdf-customization)   
         - [HTML Template](#html-template)   
         - [Header and Footer](#header-and-footer)   

<!-- /MDTOC -->
***

## Generic keybindings
```js
'body':
  'alt-z':        'editor:toggle-soft-wrap'
```

## Installed Packages
- [ ] date
- [ ] lines
- [ ] markdown-table-editor
- [ ] document-outline
- [ ] language-markdown
- [ ] markdown-preview-enhanced
- [ ] atom-mdtoc
- [ ] markdown-themeable-pdf
- [ ] pdf-view (Linux only)
- [ ] select-rectangle (Win only)

### Removed Packages
- [ ] ~~select-rectangle~~
- [ ] ~~block-selection-mode (Win Only)~~


### Date
- Insert the current date & time at cursor
- date:date, date:time, and date:datetime
- Date Format `DD MMM YYYY`
- Date Time Format `ddd, DD-MMM-YYYY HH:mm:ss ZZ`
	- for time stamp `ddd, DD-MMM-YYYY HH:mm:ss.x ZZ`
	- [format options](https://date-fns.org/docs/format)
- Keybinding
```
'body':
  'ctrl-shift-I': 'date:datetime'
```
**Format Options:**

| Unit                    | Token  | Result examples                  |
|:----------------------- |:------ |:-------------------------------- |
| Month                   | `M`    | 1, 2, ..., 12                    |
|                         | `Mo`   | 1st, 2nd, ..., 12th              |
|                         | `MM`   | 01, 02, ..., 12                  |
|                         | `MMM`  | Jan, Feb, ..., Dec               |
|                         | `MMMM` | January, February, ..., December |
| Quarter                 | `Q`    | 1, 2, 3, 4                       |
|                         | `Qo`   | 1st, 2nd, 3rd, 4th               |
| Day of month            | `D`    | 1, 2, ..., 31                    |
|                         | `Do`   | 1st, 2nd, ..., 31st              |
|                         | `DD`   | 01, 02, ..., 31                  |
| Day of year             | `DDD`  | 1, 2, ..., 366                   |
|                         | `DDDo` | 1st, 2nd, ..., 366th             |
|                         | `DDDD` | 001, 002, ..., 366               |
| Day of week             | `d`    | 0, 1, ..., 6                     |
|                         | `do`   | 0th, 1st, ..., 6th               |
|                         | `dd`   | Su, Mo, ..., Sa                  |
|                         | `ddd`  | Sun, Mon, ..., Sat               |
|                         | `dddd` | Sunday, Monday, ..., Saturday    |
| Day of ISO week         | `E`    | 1, 2, ..., 7                     |
| ISO week                | `W`    | 1, 2, ..., 53                    |
|                         | `Wo`   | 1st, 2nd, ..., 53rd              |
|                         | `WW`   | 01, 02, ..., 53                  |
| Year                    | `YY`   | 00, 01, ..., 99                  |
|                         | `YYYY` | 1900, 1901, ..., 2099            |
| ISO week-numbering year | `GG`   | 00, 01, ..., 99                  |
|                         | `GGGG` | 1900, 1901, ..., 2099            |
| AM/PM                   | `A`    | AM, PM                           |
|                         | `a`    | am, pm                           |
|                         | `aa`   | a.m., p.m.                       |
| Hour                    | `H`    | 0, 1, ... 23                     |
|                         | `HH`   | 00, 01, ... 23                   |
|                         | `h`    | 1, 2, ..., 12                    |
|                         | `hh`   | 01, 02, ..., 12                  |
| Minute                  | `m`    | 0, 1, ..., 59                    |
|                         | `mm`   | 00, 01, ..., 59                  |
| Second                  | `s`    | 0, 1, ..., 59                    |
|                         | `ss`   | 00, 01, ..., 59                  |
| 1/10 of second          | `S`    | 0, 1, ..., 9                     |
| 1/100 of second         | `SS`   | 00, 01, ..., 99                  |
| Millisecond             | `SSS`  | 000, 001, ..., 999               |
| Timezone                | `Z`    | -01:00, +00:00, ... +12:00       |
|                         | `ZZ`   | -0100, +0000, ..., +1200         |
| Seconds timestamp       | `X`    | 512969520                        |
| Milliseconds timestamp  | `x`    | 512969520900                     |


### lines
- Sort (case sensitive or not)
- Reverse
- Unique
- Shuffle

### markdown-table-editor
- Format table (automatically)
- Move cursor from cell to cell
- Alter column alignment
- Insert and delete rows and columns
- CJK characters support

### document-outline
- Displays a hierarchical, interactive outline tree view of your document
- highlights current section in editor
- Keybinding
```js
'body':
  'ctrl-alt-o': 'document-outline:toggle'
```

### language-markdown
- Smarter lists
	- Automatically create new list-items when pressing enter
	- Indent or outdent list-items by pressing tab or shift+tab
	- Toggle tasks with cmd+shift+x or ctrl+shift+x
	- Remove empty trailing list-items when pressing enter
- Add shortcuts (via _, * and ~) for toggling inline-emphasis and strike-through on selected text
- Add shortcuts for converting selected text to a link (via @) or an image (via !)
- Supports embedded HTML- and Liquid-tags
- Supported grammars
	- CommonMark Markdown
	- Github Flavored Markdown (including AtomDoc)
	- Markdown Extra
	- CriticMark annotation
	- Front Matter (yaml, toml and json)
	- R Markdown

### markdown-preview-enhanced
- disable `markdown-preview`, and add in keymap
```
'.editor:not(.mini)':
  'ctrl-shift-M': 'markdown-preview-enhanced:toggle'
```
- disable in setting `Keybindings`
- Scroll sync, 2 side
- TOC gen (beta)
	- can also create TOC by inserting `[TOC]` to your markdown file
- export HTML, mobile friendly
- many more . . .
- **?** Where is stylesheet used for preview formatting?

### atom-mdtoc
- Auto linking via anchor tags
- Depth control e.g. maxDepth:6
- Refresh list on save with updateOnSave:1 (disable with updateOnSave:0)
- Exclude the first h1-level heading in a file with firsth1:0 (include with firsth1:1)
- Use spaces instead of bullets with bullets:0 (use bullets with bullets:1)
- Use a flatten list instead of a tree with flatten:1 (use tree with flatten:0)
- Header numbering with numbering:1 (disable with numbering:0)
- Works with repeated headings (see also this Table Of Contents)
- **Error in [v0.8.3](https://github.com/mcpride/atom-mdtoc/issues/6)**
	- To fix, modify file `~/.atom/packages/atom-mdtoc/lib/toc-view.coffee`
	- Replace in lines 120, 122 & 291
	- `repeat` with `_repeat_`

### markdown-themeable-pdf
- https://atom.io/packages/markdown-themeable-pdf
- `markdown-preview-enhanced`
- Exports markdown file to PDF, HTML, JPEG or PNG format
- Start new PDF page
	- ~~by typing Snippet `page-break` in editor~~
	- **Inline method** (WORKS)
		- Add the following code where you would like to have a page break in your HTML document:
		`<div style="page-break-after: always;"></div>`
	- Stylesheet method
		- Add this code to your existing CSS to get the same result.
		`.pagebreak {page-break-after: always;}`
- Code highlight themes `~/.atom/packages/markdown-themeable-pdf/node_modules/highlight.js/styles`

### pdf-view
- https://atom.io/packages/pdf-view
- Adds support for viewing PDF files in Atom.
- Powered by [PDF.js](https://github.com/mozilla/pdf.js)
- **?** SumatraPDF for windows?

### select-rectangle
- https://atom.io/packages/select-rectangle
- Select `alt-s`
	- At first, select region that you want to do. Next, press alt-s to select rectangle region. if repeating the alt-s would go back to the initial selection. After that, You can copy, cut or following actions.
- Clear `alt-cmd-c`
	- After selecting rectangle region by alt-s, alt-cmd-c clears the region-rectangle by replacing all of its contents with spaces.
- Open `alt-cmd-o`
	- After selecting rectangle region by alt-s, alt-cmd-o inserts blank space to fill the space of the region-rectangle (open-rectangle). This pushes the previous contents of the region-rectangle to the right.

***
# Index

## 1. Read more
- [ ] [atom-minify-stand-alone](https://atom.io/packages/atom-minify-stand-alone)
	- Minify a js / css file without dependencies.
	- Minify css / js files using native json regular expression.
	- String literal can be parsed normally now.
	- Works well in most css files and most js files
	- This package is in early development.
- [ ] [markdown-footnote](https://atom.io/packages/markdown-footnote)
	- Inserts a Pandoc compatible Markdown footnote.
	- Uses a 'random' md5 hash to name footnotes
	- `ctrl-shift-f` / `cmd-shift-f`
		- inserts a Pandoc-style `"[^1]"` footnote at cursor position
		- adds a new line at the end of the file with the same reference
		- ready for pasting of the link (or any other footnote text)
	- After inserting the footnote,
		- `ctrl-shift-b` / `cmd-shift-b` places the cursor
		- back in the body of the text, just after the initial reference
		- i.e. a shortcut back to the place in the text body where footnote was inserted
- [ ] [Pandoc](http://pandoc.org) File format converters
	- ** CHECK THIS OUT ASAP**
	- With configuration, can be used to generate PDF files from apps
	- **From** md, html, docx, odt
	- **To** html5, html slide show, docx, odt, opendoc xml, epub, pdf via latex, md
	- see
		- http://pandoc.org/installing.html
		- http://www.tug.org/texlive/
		- https://www.npmjs.com/package/pandoc-bin
	-  pandoc - Pandoc Previewer
- https://atom.io/packages/pretty-json
	- Minify and sorting commands are available too.
- https://atom.io/packages/slides-preview
	- preivew markdown slides using remarkjs
	- also https://github.com/shafreeck/slides
	- share and synchronize your slides
- https://atom.io/packages/atom-live-server
	- Launch a simple development http server with live reload capability.

## 2. `keymap.json` extract
```js
'body':
  'alt-z':        'editor:toggle-soft-wrap'
  'ctrl-shift-I': 'date:datetime'
  'ctrl-alt-o':   'document-outline:toggle'
  'ctrl-shift-M': 'markdown-preview-enhanced:toggle'
```

## 3. Package Configurations
### i. markdown-preview
- `Break on Single Newline` = CHECK
- `Use Github.com style`
### ii. tree-view
- `Always Open Existing` = CHECK
- `Auto Reveal` = UNCHECK (Will turn off tree hide)
### iii. markdown-preview-enhanced
- Disable package `markdown-preview`, keymaps conflict
- `Keybindings` > `Enable` = UNCHECK
### iv. atom-mdtoc
- To fix [error](https://github.com/mcpride/atom-mdtoc/issues/6)
	- modify file `~/.atom/packages/atom-mdtoc/lib/toc-view.coffee`
	- Replace in lines 120, 122 & 291
	- `repeat` with `_repeat_`
### v. markdown-themeable-pdf
- `Show by Default` = UNCHECK
- Export File Type
	- pdf
- Papersize Format
	- Legal
- Code Highlighting Theme
	- github-gist-css
	- theme defines are at `~/.atom/packages/markdown-themeable-pdf/node_modules/highlight.js/styles`

### vi. markdown-themeable-pdf Customization
| file                      | intent                                                      | file                                                                    |
| ------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------------------- |
| document.css              | default styles that will be applied, changes need restart. For HTML and PDF   | `~/.atom/packages/markdown-themeable-pdf/css/document.css`              |
| styles.css                | custom styles that will be applied on top of `document.css`. For HTML and PD |                                                                         |
|                           | Per project styling can be applied by project stylesheet    | `<project-path>/markdown-themeable-pdf/styles.css`                      |
| footer.js                 | footer content in html format, for PDF output               | `~/.atom/markdown-themeable-pdf/footer.js`                              |
| header.js                 | header content in html format, for PDF output               | `~/.atom/markdown-themeable-pdf/header.js`                              |
| markdown-themeable-pdf.js | HTML template used will be defined, (line 460)              | `~/.atom/packages/markdown-themeable-pdf/lib/markdown-themeable-pdf.js` |


#### HTML Template
- file `~/.atom/packages/markdown-themeable-pdf/lib/markdown-themeable-pdf.js`
- line 460 to 465 - replace with
```js
            var dom =
                '<!DOCTYPE html>\n' +
                '<html>\n' +
                '<head>\n' +
                '<meta charset="UTF-8">\n' +
                '<meta name="viewport" content="width=device-width, initial-scale=1.0">\n' +
                '<title>' + jobInfo.fileInfo.name + '</title>\n' +
                '<style>\n' + cssStyles + '\n</style>\n' +
                '</head>\n' +
                '<body>\n' +
                customHeader.html +
                '<div id="pageContent">\n' +
                html + '\n' +
                '</div>' +
                customFooter.html +
                '</body>\n' +
                '</html>\n'
                ;
```

#### Header and Footer
- File Details like name, extension...
	- from `~/.atom/packages/markdown-themeable-pdf/lib/markdown-themeable-pdf.js`
	- `info` object can be used to get file name without extension
- **Header customization**
	```js
	module.exports = function (info) {
	    return {
	        height: '1cm',
	        contents: '<div style="text-align: right;">Page {{page}} of {{pages}}</div>'
	    };
	};
	```
- **Footer customization**
	```js
	module.exports = function (info) {
	    var yearFormat = function () {
	        return (new Date()).toLocaleDateString('en-US', {
	            year: 'numeric',
	        });
	    };
	    return {
	        height: '1cm',
	        contents: '<div style="float:left;">&copy; ' + yearFormat() + ' your-name-here</div>' +
	                  '<div style="float:right;">'       + info.fileInfo.name          + '</div>'
	    };
	};
	```
- **Default Styles customization** (document.css)
	- Good enough for now, needs signifigant branding work
	```css
	* {
	    overflow: visible !important;
	    -webkit-text-size-adjust: 100%;
	    -webkit-font-smoothing: antialiased;
	    box-decoration-break: clone;
	}
	html, body {
	    background: #FFF;
	    font-family: Calibri, Carlito, "Segoe UI", Arial, freesans, sans-serif;
	    font-size: 12pt;
	    line-height: 1.2;
	    color: #333;
	    word-wrap: break-word;
		hyphens: auto;
		margin: 0px 25px;
	}
	hr {
	    margin-top: .5rem;
	    margin-bottom: 2rem;
	    border: 0;
	    border-top: 4px solid #EEE;
	}
	code {
	    font-family: Consolas, "Liberation Mono", Menlo, "Courier New", Courier, monospace;
	    font-size: 1.0rem;
	    padding: .1em .4em;
	    display: inline-block;
	    background-color: #f9f2f4;
	    color: #c7254e;
	    border-radius: 3px;
	    border: 0 none;
	    hyphens: manual;
	}
	pre code {
	    font-family: Consolas, "Liberation Mono", Menlo, "Courier New", Courier, monospace;
	    font-size: 1.0rem;
	    padding: 15px;
	    display: block;
	    background-color: #F9F9F9;
	    color: #c7254e;	/* #555 */
	    box-shadow: inset -1px -1px 0 rgba(0, 0, 0, .08);
	    word-wrap: normal;
		line-height: 1.5rem;
	}
	/* replace light background for some hljs themes */
	code.github-css,
	code.github-gist-css,
	code.tomorrow-css,
	code.default-css,
	code.googlecode-css,
	code.ascetic-css,
	code.color-brewer-css,
	code.grayscale-css,
	code.idea-css,
	code.vs-css,
	code.xcode-css {
	    background-color: #F9F9F9 !important;
	}
	blockquote {
	    padding: 10px;
	    margin-left: 0;
	    color: #666;
	    border: 0 none;
	    border-left: 4px solid #EEE;
	}
	blockquote p:last-child,
	blockquote ul:last-child,
	blockquote ol:last-child {
	    margin-bottom: 0;
	}
	table {
	    border-collapse: collapse;
	    border-spacing: 0;
	    background-color: #FFF;
	    width: 100%;
	    max-width: 100%;
	    margin-bottom: 20px;
	    border: 1px solid #DDD;
	}
	table div {
	    page-break-inside: avoid;
	}
	th, td {
	    vertical-align: top;
	    text-align: left;
	}
	table > thead > tr > th,
	table > tbody > tr > th,
	table > tfoot > tr > th,
	table > thead > tr > td,
	table > tbody > tr > td,
	table > tfoot > tr > td {
	    padding: 8px 14px;
	    vertical-align: top;
	    border-top: 1px solid #DDD;
	}
	table > caption + thead > tr:first-child > th,
	table > colgroup + thead > tr:first-child > th,
	table > thead:first-child > tr:first-child > th,
	table > caption + thead > tr:first-child > td,
	table > colgroup + thead > tr:first-child > td,
	table > thead:first-child > tr:first-child > td {
	    border-top: 0;
	}
	table > tbody + tbody {
	    border-top: 2px solid #DDD;
	}
	table table {
	    background-color: #FFF;
	}
	table > thead > tr > th,
	table > tbody > tr > th,
	table > tfoot > tr > th,
	table > thead > tr > td,
	table > tbody > tr > td,
	table > tfoot > tr > td {
	    border: 1px solid #DDD;
	    vertical-align: top;
	}
	table > thead > tr > th,
	table > thead > tr > td {
	    font-family: Cambria, Caladea, "serif";
	    border-bottom-width: 2px;
	    text-align: center;
	    vertical-align: middle;
	    font-weight: bold;
	    padding-top: 6px;
	    padding-bottom: 6px;
	    font-size: 0.9rem;
	}
	table > tbody > tr:nth-of-type(odd) {
	    background-color: #F9F9F9;
	}
	img {
	    max-width: 100%;
	    height: auto;
	    vertical-align: middle;
	}
	h1, h2, h3, h4, h5, h6 {
	    font-family: Cambria, Caladea, "serif";
	    font-weight: bold;
	    line-height: 1.2;
	    color: #111;
	    margin-top: 0.5rem;
	    margin-bottom: 0.7rem;
	    padding: 0;
	    page-break-after: avoid;
	}
	h1, h2 {
	    border-bottom: 1px solid #EEE;
	    padding-bottom: 0.5rem;
	}
	h1 {
	    font-size: 1.8rem;
	}
	h2 {
	    font-size: 1.5rem;
	}
	h3 {
	    font-size: 1.3rem;
	}
	h4 {
	    font-size: 1.1rem;
	}
	h5, h6 {
	    font-size: 1rem;
	    font-weight: bold;
	    color: #666;
	}
	p {
	    margin: 0 0 10px;
	}
	input[type="checkbox"] {
	    margin-right: 6px;
	    position: relative;
	    bottom: 1px;
	}
	ul,
	ol {
	    margin-top: 0;
	    margin-bottom: 10px;
	    padding-left: 20px;
	}
	li p {
	    margin-bottom: 2px;
	}
	ul li,
	ol li {
	    margin-bottom: 2px;
	}
	dl {
	    margin-top: 0;
	    margin-bottom: 20px;
	}
	dt {
	    font-weight: bold;
	}
	dd {
	    margin-left: 0;
	}
	a,
	a:visited {
	    text-decoration: none;
	    color: #4078C0;
	}
	.new-page,
	.page-break,
	.next-page,
	.page-end {
	    page-break-after: always;
	}
	#pageHeader,
	#pageHeader a,
	#pageHeader a:visited {
	    color: #777;
	    /* border-bottom: 1px solid #EEE; */
	    font-size: 80%;
	}
	#pageHeader span {
	    vertical-align: middle;
	}
	#pageFooter {
	    vertical-align: middle;
	    border-top: 1px solid #EEE;
	    padding-top: 5px;
	    color: #777;
	    font-size: 80%;
	}
	#pageFooter a,
	#pageFooter a:visited {
	    color: #777;
	}
	```

***
`Tue, 07-Nov-2017 20:38:40.1510067320579 +0530`
