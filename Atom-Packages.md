# Atom packages for markdown

**Contents**
[TOC]

**Temporary update - till image fixed**
```bash
# Update 1 - update styles
WORK_FOLDER="/media/sak/70_Current/Work/buffer/markdown-themeable-pdf-configs";
rsync -v ${WORK_FOLDER}/working.css ~/.atom/packages/markdown-themeable-pdf/css/document.css
rsync -v ${WORK_FOLDER}/*.js ~/.atom/markdown-themeable-pdf/
rsync -v ${WORK_FOLDER}/markdown-themeable-pdf.js ~/.atom/packages/markdown-themeable-pdf/lib/markdown-themeable-pdf.js
# Update 2 - fix error in atom-mdtoc
sed -i 's/repeat/_repeat_/g' ~/.atom/packages/atom-mdtoc/lib/toc-view.coffee
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
- [x] pdf-view (Linux only)
- [x] select-rectangle

## Now Installed

### Date
- Insert the current date & time at cursor
- date:date, date:time, and date:datetime
- Date Time Format `DD-MMM-YYYY`
- Date Time Format `ddd, DD-MMM-YYYY HH:mm:ss.SSS ZZ`
	- for time stamp `ddd, DD-MMM-YYYY HH:mm:ss.X ZZ`
	- [formats](https://date-fns.org/docs/format)
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
- Scroll sync, 2 side
- pandoc
- TOC gen (beta)
	- can also create TOC by inserting `[TOC]` to your markdown file
- export HTML, mobile friendly
- many more . . .
- Customization:


### markdown-themeable-pdf
https://atom.io/packages/markdown-themeable-pdf
- `markdown-preview-enhanced` can also export html
- exports markdown file to PDF, HTML, JPEG or PNG format
- Start new PDF page
	- ~~by typing Snippet `page-break` in editor~~
	- **Inline method** (WORKS)
		- Add the following code where you would like to have a page break in your HTML document:
		`<div style="page-break-after: always;"></div>`
	- Stylesheet method
		- Add this code to your existing CSS to get the same result.
		`.pagebreak {page-break-after: always;}`
- Code highlight themes `~/.atom/packages/markdown-themeable-pdf/node_modules/highlight.js/styles`

#### Customization - PDF output

| file         | intent                                                      | file                                                       |
| ------------ | ----------------------------------------------------------- | ---------------------------------------------------------- |
| document.css | default styles that will be applied                         | `~/.atom/packages/markdown-themeable-pdf/css/document.css` |
| footer.js    | footer content in html format                               | `~/.atom/markdown-themeable-pdf/footer.js`                 |
| header.js    | header content in html format                               | `~/.atom/markdown-themeable-pdf/header.js`                 |
| styles.css   | custom styles that will be applied on top of `document.css` |                                                            |
| markdown-themeable-pdf.js |   |  |

- Per project `project-path/markdown-themeable-pdf/styles.css`

**To apply changes to package locations**
```sh
WORK_FOLDER="/media/sak/70_Current/Work/buffer/markdown-themeable-pdf-configs";
rsync -v ${WORK_FOLDER}/working.css ~/.atom/packages/markdown-themeable-pdf/css/document.css
rsync -v ${WORK_FOLDER}/*.js ~/.atom/markdown-themeable-pdf/
rsync -v ${WORK_FOLDER}/markdown-themeable-pdf.js ~/.atom/packages/markdown-themeable-pdf/lib/markdown-themeable-pdf.js
```
- Files Changed are:
	- `document.css` original content as installed
	- `working.css` modified copy of `document.css`
	- `header.js` with updated content
	- `footer.js` with updated content

#### Customization - General
- Following are availaible for use,
- from ~/.atom/packages/markdown-themeable-pdf/lib/markdown-themeable-pdf.js
- line 242: `jobInfo` as `info`
	- `info.fileInfo`
- Explore values of
	- fileInfo.dest
- JS - to show messages to user: `atom.notifications`
	- .addInfo('text to display');
	- .addWarning('text to display');
	- .addError('text to display');
	- .addSuccess('text to display');
	
#### Customization - HTML Template
- file `~/.atom/packages/markdown-themeable-pdf/lib/markdown-themeable-pdf.js`
- line 461 to 465 - replace with
```js
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
                '</html>\n';

```


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
- fork of language-gfm extended to support some features of markdown-preview-enhanced
- TO INSTALL AND TEST

### sorter
- Alphabetic Sort
	- default javascript sorting function
	- `sorter:sort`
- Natural Sort
	- sorts like a human
	- uses javascript-natural-sort
	- `sorter:natural-sort`

### atom-mdtoc
(best option, `Mon, 08-May-2017 16:05:38 +0530`)
- Auto linking via anchor tags
- Depth control e.g. maxDepth:6
- Refresh list on save with updateOnSave:1 (disable with updateOnSave:0)
- Exclude the first h1-level heading in a file with firsth1:0 (include with firsth1:1)
- Use spaces instead of bullets with bullets:0 (use bullets with bullets:1)
- Use a flatten list instead of a tree with flatten:1 (use tree with flatten:0)
- Header numbering with numbering:1 (disable with numbering:0)
- Works with repeated headings (see also this Table Of Contents)
#### Error in v0.8.3
To fix [See](https://github.com/mcpride/atom-mdtoc/issues/6)
modify file `~/.atom/packages/atom-mdtoc/lib/toc-view.coffee`
```
// replace in line 291
String::repeat = (n) -> Array(n+1).join(this)
// to
String::_repeat_ = (n) -> Array(n+1).join(this)

//replace in line 120
@tocContent += '&emsp;'.repeat(level - 1)
//to
@tocContent += '&emsp;'._repeat_(level - 1)

//replace in line 122
@tocContent += '   '.repeat(level - 1) + '- '
//to
@tocContent += '   '._repeat_(level - 1) + '- '
```

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

### New
- https://atom.io/packages/js-refactor-atom
- https://atom.io/packages/nms-color-bracket
    - Colors pairs of Brackets based on nesting level
    - Colors up to 12 deep
    - Alt-q to toggle
    - Saving will reprocess current page
    - Unpaired close "}" brackets will flash
- https://atom.io/packages/emmet
- https://atom.io/packages/nanobot
- https://atom.io/packages/fonts
	- from http://programmingfonts.org/list
	- 3270, Anka/Coder, Anonymous Pro, Aurulent Sans Mono, Average Mono, BPmono, Bitstream Vera Sans Mono, Code New Roman, Consolamono, Cousine, Cutive Mono, DejaVu Mono, Droid Sans Mono, Effects Eighty, Fantasque Sans Mono, Fifteen, Fira Mono, FiraCode, Fixedsys, Fixedsys with ligatures, GNU Freefont, GNU Unifont, Generic Mono, Hack, Hasklig, Hermit Light, Hermit, Inconsolata, Inconsolata-g, Latin Modern Mono Light, Latin Modern Mono, Lekton, Liberation Mono, Luxi Mono, M+ Light, M+ Medium, M+ Thin, M+, Meslo, Monofur, Monoid, Mononoki, NotCourierSans, Nova Mono, Office Code Pro, Oxygen Mono, PT Mono, Profont, Proggy Clean, Quinze, Roboto, Share Tech Mono, Source Code Pro Extra Light, Source Code Pro Light, Source Code Pro Medium, Source Code Pro, Sudo, TeX Gyre Cursor, Terminus, Ubuntu Mono, VT323, Verily Serif Mono, saxMono
- https://atom.io/packages/pretty-json
	- Minify and sorting commands are available too.
- https://atom.io/packages/slides-preview
	- preivew markdown slides using remarkjs
	- also https://github.com/shafreeck/slides
	- share and synchronize your slides
- https://atom.io/packages/atom-live-server
	- Launch a simple development http server with live reload capability.
- https://atom.io/packages/atom-html-preview
	- A live preview tool for Atom Editor.
	- Press CTRL-SHIFT-H in the editor to open the preview pane.

### select-rectangle
- **Select alt-s**
	- At first, select region that you want to do. Next, press alt-s to select rectangle region.
	- if repeating the alt-s would go back to the initial selection. After that, You can copy, cut or following actions.
- **Clear alt-cmd-c**
	- After selecting rectangle region by alt-s, alt-cmd-c clears the region-rectangle by replacing all of its contents with spaces.
- **Open alt-cmd-o**
	- After selecting rectangle region by alt-s, alt-cmd-o inserts blank space to fill the space of the region-rectangle (open-rectangle).
	- This pushes the previous contents of the region-rectangle to the right.

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
### column-select
**WILL NOT WORK ON WINDOWS, KEY BINDINGS ARE FOR ROTATING SCREEN**
**Key Bindings**
|         **Command**         |       **Mac**       |    **Windows**    |     **Linux**      |
| --------------------------- | ------------------- | ----------------- | ------------------ |
| Up                          | Ctrl-Shift-Up       | Ctrl-Alt-Up       | Alt-Shift-Up       |
| Down                        | Ctrl-Shift-Down     | Ctrl-Alt-Down     | Alt-Shift-Down     |
| PageUp                      | Ctrl-Shift-PageUp   | Ctrl-Alt-PageUp   | Alt-Shift-PageUp   |
| PageDown                    | Ctrl-Shift-PageDown | Ctrl-Alt-PageDown | Alt-Shift-PageDown |
| Up to top of document.      | Ctrl-Shift-Home     | Ctrl-Alt-Home     | Alt-Shift-Home     |
| Down to bottom of document. | Ctrl-Shift-End      | Ctrl-Alt-End      | Alt-Shift-End      |

Compared to the normal column selection in Atom, this does the following
- Allows reversing direction (go down a few lines, if you go one too many just go up one).
- Added Page and Document jumps.
- Skips rows that are too short.
- If you start at the end of a line, then it will stay at the end of each line.
- Handles tab characters.

### pdfify-atom
https://atom.io/packages/pdfify
- Needs [pdfify](https://github.com/swinton/pdfify)
	- Generates Octocat-friendly PDFs from Markdown
	- generate a PDF `pdfify /path/to/some/markdown/file.md`
	- To insert a page break, include a {.page-break} header attribute `# Lorem ipsum {.page-break}`
	- Customized styles
		- create `~/.pdfify/style.css` based off the included lib/style.css
	- Customized header
		-  create `~/.pdfify/header.html` based off lib/header.html
	- Customized footer
		- create `~/.pdfify/footer.html` based off lib/footer.html

### wkhtmltopdf and wkhtmltoimage
**Not package, but dependency**
https://wkhtmltopdf.org/
- run entirely "headless"
- download from https://wkhtmltopdf.org/downloads.html
- Linux - depends on: zlib, fontconfig, freetype, X11 libs (libX11, libXext, libXrender)
- `wkhtmltopdf [GLOBAL OPTION]... [OBJECT]... <output file>`
- `wkhtmltopdf path/to/html/file google.pdf`
- see manual at https://wkhtmltopdf.org/usage/wkhtmltopdf.txt

### markdown-pdf
- depends on markdown-preview , marked
	- will not work if markdown-preview-enhanced is installed

### More
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
### atom-mdtoc
- To fix [error](https://github.com/mcpride/atom-mdtoc/issues/6)
	- Replace all 3 `repeat` with `_repeat_`
	- in file `~/.atom/packages/atom-mdtoc/lib/toc-view.coffee`
	- occurs in lines 120, 122, 201
### markdown-themeable-pdf
- `Show by Default` = UNCHECK
- Export File Type
	- pdf
- Papersize Format
	- Legal
- Code Highlighting Theme
	- github-gist-css
	- theme defines are at `~/.atom/packages/markdown-themeable-pdf/node_modules/highlight.js/styles`


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
