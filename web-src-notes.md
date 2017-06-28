# Web Source Notes
`Sat 2017-May-20 14:05:54.451 +05:30`

> Snippets for expected use cases

# CSS
## Embed font
`data:[<mediatype>][;base64],<data>`
	- The `<mediatype>` is an Internet media type specification (with optional parameters.) - i.e. "text/plain;charset=UTF-8", "image/gif", "application/octet-stream", etc. If <mediatype> is omitted, it defaults to "text/plain;charset=US-ASCII".
	- The `;base64` string identifies the data as base64-encoded.
	- The `data`, separated from the preceding part by a comma (,)

```css
@font-face {
  font-family: 'MyFontFamily';
    url(data:font/truetype;charset=utf-8;base64,BASE64_ENCODED_DATA_HERE)  format('truetype'),
    url(data:font/woff;charset=utf-8;base64,BASE64_ENCODED_DATA_HERE)  format('woff'),
    url('myfont-webfont.svg#svgFontName') format('svg');
}
```
- get formate support by browser, bs4 source
- **method 1**
	- `https://www.fontsquirrel.com/tools/webfont-generator`
	- Go to fontsquirrel.com and download the font-face kit you want to use.
	- Go to the fontsquirrel font-face generator and upload the .ttf file from the kit you just downloaded.
	- Select the ‘Expert’ option.
	- For format select ‘TrueType’, ‘EOT’, and ‘SVG’.  (Woff is a compressed format only supported by firefox, but firefox also support .ttf, so woff is extraneous)
	- Under the CSS options select ‘Base64′ Encoding.
	- Download and use the files provided.
- https://github.com/glyptodon/guacamole-client/tree/master/guacamole/src/main/webapp/fonts/carlito
- https://fontlibrary.org/en/font/carlito
- https://fontlibrary.org/en/font/caladea



# js
http://jquerymodal.com/
```js
$('#manual-ajax').click(function(event) {
  event.preventDefault();
  $.get(this.href, function(html) {
    $(html).appendTo('body').modal();
  });
});
//
 $("#sticky").modal({
  escapeClose: false,
  clickClose: false,
  showClose: false
});
```

## Other
- `m = new Date().getFullYear();`


## Window open() Method
- https://www.w3schools.com/jsref/met_win_open.asp
- `window.open(URL, name, specs, replace)`
	- `URL` - Optional. Specifies the URL of the page to open. If no URL is specified, a new window with about:blank is opened
	- `name` Optional. Specifies the target attribute or the name of the window.
		- `_blank` - URL is loaded into a new window. This is default
		- `_parent` - URL is loaded into the parent frame
		- `_self` - URL replaces the current page
		- `_top` - URL replaces any framesets that may be loaded
		- `name` - The name of the window

## other
- https://developer.mozilla.org/en-US/docs/Web/API/Window/open
- https://www.w3schools.com/howto/howto_css_modals.asp
	- `modal.style.display = "block";`
	- `modal.style.display = "none";`
	- ''
- https://jqueryui.com/dialog/



# HTML
## favicon
- inside the `<head>` element
- `<link rel="shortcut icon" href="http://example.com/favicon.ico" />`
-  other image formats, such as .png. .gif, .jpeg, and even animated GIFs
- .ico format has had wide acceptance from browsers for quite some time and is a common format when using favicons
- 16x16, 32x32, 48x48, or 64x64 pixels in size, and 8-bit, 24-bit, or 32-bit in color depth
**OR**
- one favicon for your entire domain
	- save the favicon.ico file to the root folder
	- must be accessible from http://www.yourdomain.com/favicon.ico
**More e.g.s**
http://www.favicon-generator.org/
```html
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<link rel="icon" type="image/x-icon" href="http://example.com/favicon.ico" />
<link rel="icon" type="image/png" href="http://example.com/favicon.png" />
<link rel="icon" type="image/gif" href="http://example.com/favicon.gif" />
```

## Window Object
https://www.w3schools.com/jsref/obj_window.asp
### Window Object Properties
- `document` 	Returns the Document object for the window (See Document object)
- `status` 	Sets or returns the text in the statusbar of a window
### Window Object Methods
- `open()` 	Opens a new browser window
### Document Object Properties and Methods
- `document.open()` 	Opens an HTML output stream to collect output from document.write()
- `document.title` 	Sets or returns the title of the document
- `document.write()` 	Writes HTML expressions or JavaScript code to a document
- `document.writeln()` 	Same as write(), but adds a newline character after each statement
- `document.readyState` 	Returns the (loading) status of the document

# Other interesting
- https://www.w3schools.com/howto/howto_css_cards.asp
- https://www.w3schools.com/howto/howto_css_profile_card.asp
- https://www.w3schools.com/howto/tryit.asp?filename=tryhow_css_login_form_modal
- [Style Object Properties](https://www.w3schools.com/jsref/dom_obj_style.asp)
- [Navigator Object](https://www.w3schools.com/jsref/obj_navigator.asp)
- Navigator geolocation Property
	```js
	var x = document.getElementById("demo");
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);
		} else {
			x.innerHTML = "Geolocation is not supported by this browser.";
		}
	}
	function showPosition(position) {
		x.innerHTML = "Latitude: " + position.coords.latitude +
		"<br>Longitude: " + position.coords.longitude;
	}
	```
