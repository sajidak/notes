# Atom Customization

**Contents**
<!-- MDTOC maxdepth:6 firsth1:1 numbering:0 flatten:0 bullets:1 updateOnSave:1 -->

- [Atom Customization](#atom-customization)
   - [Generic keybindings](#generic-keybindings)
   - [Installed Packages](#installed-packages)
      - [Date](#date)
      - [lines](#lines)
      - [markdown-table-editor](#markdown-table-editor)
      - [document-outline](#document-outline)
      - [markdown-preview-enhanced](#markdown-preview-enhanced)
      - [markdown-themeable-pdf](#markdown-themeable-pdf)
      - [pdf-view](#pdf-view)
      - [atom-mdtoc](#atom-mdtoc)
- [Index](#index)
   - [1. Read more](#1-read-more)
   - [2. `keymap.json` extract](#2-keymapjson-extract)
      - [i. Info](#i-info)
   - [3. Package Configurations](#3-package-configurations)
      - [i. markdown-preview](#i-markdown-preview)
      - [ii. tree-view](#ii-tree-view)
      - [iii. markdown-preview-enhanced](#iii-markdown-preview-enhanced)
      - [iv. atom-mdtoc](#iv-atom-mdtoc)
      - [v markdown-themeable-pdf](#v-markdown-themeable-pdf)
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
- [ ] markdown-preview-enhanced
- [ ] markdown-table-editor
- [ ] atom-mdtoc
- [ ] document-outline
- [ ] lines
- [ ] language-markdown
- [ ] markdown-themeable-pdf
- [ ] pdf-view (Linux only)
- [ ] select-rectangle

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

### markdown-preview-enhanced
- [ ] recommended: language-gfm-enhanced
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


***
# Index

## 1. Read more
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
### i. Info
- symbols-view
```
'.platform-linux atom-text-editor':
	'ctrl-r': 			'symbols-view:toggle-file-symbols'
'.platform-linux atom-text-editor':
	'ctrl-alt-down':	'symbols-view:go-to-declaration'
'.platform-linux atom-text-editor':
	'ctrl-alt-up': 		'symbols-view:return-from-declaration'
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
### v markdown-themeable-pdf
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

***
`Thu, 26-Oct-2017 11:45:49.1508998549724 +0530`
