# PDF Viewers

 **TODO:**
 - Attempt repack as Portues module
	 - qpdfview
	 - XPDF


## qpdfview
https://launchpad.net/qpdfview
tabbed document viewer.
Uses Poppler for PDF support, libspectre for PS support, DjVuLibre for DjVu support, CUPS for printing support and the Qt toolkit for its interface.

Current features include:
* Outline, properties and thumbnail panes
* Scale, rotate and fit
* Fullscreen and presentation views
* Continuous and multiple-page layouts
* Search for text
* Configurable tool bars
* Configurable keyboard shortcuts
* Persistent per-file settings
* SyncTeX support
* Rudimentary annotation support (with Poppler version 0.20.1 or higher)
* Rudimentary form support
* Support for PostScript and DjVu documents via plugins
- `sudo apt-get install qpdfview`
922 kB download, 4,545 kB install
- **Best, so far**
	- Shows links with outline boxes,
	- need to see settings to turn them off


## Okular
https://okular.kde.org/
PDF, XPS, ePub, CHM, Postscript and many other
- Embedded 3D model
- Subpixel rendering
- Table selection tool
- Geometric shapes
- Adding textboxes, and stamps
- Copy images to clipboard
- Magnifier and many more
* `sudo apt-get install okular`
83.6 MB download, 289 MB install
* **Post Install**
	- Trim margins from screen, Text width
	- magnifier


## XPDF
http://www.foolabs.com/xpdf/
- Current version: 3.04 (released 2014-may-28)
- Xpdf 3.04 supports PDF 1.7
- designed to be small and efficient.
- It can use Type 1, TrueType, or standard X fonts
ftp://ftp.foolabs.com/pub/xpdf/xpdfbin-linux-3.04.tar.gz
ftp://ftp.foolabs.com/pub/xpdf/xpdfbin-win-3.04.zip
* `sudo apt-get install xpdf`
1,115 kB download, 3,562 kB install
* **Post Install**
	- Good rendering
	- no file browser to open files


## MuPDF
https://mupdf.com/
- lightweight PDF, XPS, and E-book viewer
- for high quality anti-aliased graphics.
- Renders text with metrics and spacing accurate to within fractions of a pixel for the highest fidelity in reproducing the look of a printed page on screen.
- highly-extensible because of its modular nature.
- notable features include:
    - Supports a highly quality anti-aliased graphics renderer
    - Supports PDF 1.7 with transparency, encryption, hyperlinks, annotations, searching plus many more
	- PDF, XPS, OpenXPS, CBZ, EPUB, and FictionBook 2
    - Reads XPS and OpenXPS documents
    - Written modularly to support additional features
https://mupdf.com/downloads/mupdf-1.11-windows.zip
* `sudo apt-get install mupdf`
* **Post Install**
	- No Scrollbars
	- Excellent Rendering
	- CLI only?


## Sumatra PDF
https://www.sumatrapdfreader.org/free-pdf-reader.html
PDF, ePub, MOBI, CHM, XPS, DjVu, CBZ, CBR reader for Windows
https://www.sumatrapdfreader.org/dl/SumatraPDF-3.1.2-64.zip
https://www.sumatrapdfreader.org/manual.html


## Foxit Reader
https://www.foxitsoftware.com/products/pdf-reader/
- cross platform, small and fast secure PDF reader
- An intuitive user interface
- Support for scanning documents into PDF
- Allows shared viewing of documents
- Commenting tools
- Add/verify digital signatures and many more
- **Good** features on Windows, Limited features on Linux
