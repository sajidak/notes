# Bootstrap 4 - Handy Reference
`Fri, 09-Jun-2017 21:35:57 +0530`
_Contains only those bits needed for RCW project._

**TODO:**
- Add info on icon usage
- update with beta 3 changes

**Contents**

[TOC]
---

## Grid system
### Variable width content
Using the col-{breakpoint}-auto classes, columns can size itself based on the natural width of its content. This is super handy with single line content like inputs, numbers, etc. This, in conjunction with horizontal alignment classes, is very useful for centering layouts with uneven column sizes as viewport width changes.
```html
<div class="row justify-content-md-center">
  <div class="row">
    <div class="col">1 of 3</div>
    <div class="col-12 col-md-auto">Variable width content</div>
    <div class="col col-lg-2">3 of 3</div>
  </div>
</div>
```

### Vertical alignment
- `row align-items-start`
- `row align-items-center`
- `row align-items-end`

### Horizontal alignment
- `row justify-content-start`
- `row justify-content-center`
- `row justify-content-end`
- `row justify-content-around` - looks most useful
- `row justify-content-between`

### Column resets
- `clearfix` - along with responsive utility classes

### Reordering
#### Flex order
- `col flex-unordered`
- `col flex-last`
- `col flex-first`

#### Push and pull
- `col-md-* push-md-*`
- `col-md-* pull-md-*`

#### Nesting
- With a row inside a col

### Responsive Utilities
- `hidden-*-up`
- `hidden-*-down`
- `visible-print-block`
- `visible-print-inline`
- `visible-print-inline-block`
- `hidden-print`

### Reboot
Move into _Typography_??
- `font-size: 16px` is declared on the `<html>`
- `font-size: 1rem` on the `<body>`
- `font-family` is applied to the `<body>`
- All lists—`<ul>`, `<ol>`, and `<dl>`
	- have their `margin-top` removed and a `margin-bottom`: 1rem.
	- Nested lists have no `margin-bottom`

## Typography
- `display-*` (1-4)
- `lead`
- `mark`, `small`
- `initialism` to an `<abbr>` for a slightly smaller font-size
- `blockquote`, `blockquote-reverse` - for right aligned content
- `<ul class="list-unstyled">`
- `list-inline` and `list-inline-item`
- `text-truncate`
- Description List alignment
	- Makes `dt`s bold
	```html
	<dl class="row">
	  <dt class="col-sm-3">Description lists</dt>
	  <dd class="col-sm-9">A description list is perfect for defining terms.</dd>

	  <dt class="col-sm-3">Euismod</dt>
	  <dd class="col-sm-9">Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
	  <dd class="col-sm-9 offset-sm-3">Donec id elit non mi porta gravida at eget metus.</dd>

	  <dt class="col-sm-3">Nesting</dt>
	  <dd class="col-sm-9">
	    <dl class="row">
	      <dt class="col-sm-4">Nested definition list</dt>
	      <dd class="col-sm-8">Aenean posuere, tortor sed cursus feugiat, nunc augue blandit nunc.</dd>
	    </dl>
	  </dd>
	</dl>
	```

## Images, Figures  & Tables
### Images
- `img-fluid`
- `img-thumbnail` - for a rounded 1px border appearance
- `rounded`

### Figures
Images in figures have no explicit size, so be sure to add the `.img-fluid` class to your `<img>` to make it responsive
- `figure`
- `figure-img`
- `figure-caption`

### Tables
- `table`
- `table-inverse`
- `thead-inverse`
- `thead-default`
- `table-striped`
- `table-bordered`
- `table-hover`
- `table-sm` - cuts cell padding in half
- on row or cell
	- `table-active`, `table-success`, `table-warning`, `table-danger`, `table-info`
- bg-primary + bg-info - for cleaner formatting
- `table-responsive` - to make table scroll horizontally on small devices

## Navbar
> Navbars require a wrapping `.navbar` with `.navbar-toggleable-*` for responsive collapsing
- `navbar-light`
- `navbar-inverse`
-  built-in support for a handful of sub-components
	- `navbar-brand` - anchor works best
	- `navbar-nav` - for a full-height and lightweight navigation
	- `navbar-toggler`
		- `navbar-collapse`
		- `navbar-toggleable-*`
	- `form-inline`
	- `navbar-text` - for adding vertically centered strings of text
	- `collapse.navbar-collapse` - for grouping and hiding navbar contents by a parent breakpoint
- **example**
```html
<!-- Image and text -->
<nav class="navbar navbar-light bg-faded">
  <a class="navbar-brand" href="#">
  <img src="/brand/bootstrap-solid.svg" width="30" height="30" class="d-inline-block align-top" alt="">
    Bootstrap
  </a>
</nav>
```

### Placement
- `navbar fixed-top`
- `navbar fixed-bottom`
- `navbar sticky-top`

### Navs
- `nav`
	- `nav-link`

#### Horizontal alignment
- `justify-content-center`
- `justify-content-end`

#### Vertical
- `nav flex-column`
- `flex-*-column`
- vertical navigation is possible without `<ul>`s, too
	```html
	<nav class="nav flex-column">
	  <a class="nav-link active" href="#">Active</a>
	  <a class="nav-link" href="#">Link</a>
	  <a class="nav-link" href="#">Link</a>
	  <a class="nav-link disabled" href="#">Disabled</a>
	</nav>
	```

#### Nav Styles
- `nav nav-tabs`
- `nav-pills`
- `nav nav-pills nav-fill`
- `nav nav-pills nav-justified`

## Forms
- `<fieldset>`s have no borders, padding, or margin
- `<legend>`s, like fieldsets, have also been restyled to be displayed as a heading of sorts
- `<label>`s are set to `display: inline-block` to allow margin to be applied.
- `<input>`s, `<select>`s, `<textarea>`s, and `<button>`s are mostly addressed by Normalize,
	- but **Reboot** removes their margin and sets `line-height: inherit`, too.
- `<textarea>`s are modified to only be resizable vertically
- `<abbr>` element receives basic styling to make it stand out amongst paragraph text.
- HTML5 `[hidden]` atribute has compatibility issues
	- use `invisible` class
---
1. all inputs **must** have a type attribute
2. always include a `<label>` with each form control, even if you need to hide it from non-screenreader visitors with `.sr-only`
---

- `form-group`
	- Any group of form controls
	- only purpose is to provide margin-bottom around a label and control pairing
	- can use it with `<fieldset>`s, `<div>`s, or nearly any other element

- `form-control`
	- Textual inputs -  text, password, datetime-local, date, month, time, week, number, email, url, search, tel, color
	- Select menus - multiple, size
	- Textareas

- `form-control-static`
	- to place plain text next to a form label within a form

- `form-control-file`
	- File inputs

- `form-check`
	-  used for	Checkboxes and radios
	- `form-check-*` - see more
	- `form-check-inline`

- `col-form-legend`
	```html
	<div class="form-group">
	  <label for="exampleInputEmail1">Email address</label>
	  <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
	  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
	</div>
	```

- `form-inline`
	- Controls are `display: flex`
	- Controls and input groups receive `width: auto` to override the Bootstrap default `width: 100%`
	- Controls only appear inline in viewports that are at least 576px wide

- `custom-select`
	- read more


### Validation
- `form-control-feedback`
	```html
	<div class="form-group has-success">
	  <label class="form-control-label" for="inputSuccess1">Input with success</label>
	  <input type="text" class="form-control form-control-success" id="inputSuccess1">
	  <div class="form-control-feedback">Success! You've done it.</div>
	  <small class="form-text text-muted">Example help text that remains unchanged.</small>
	</div>
	```

### Using the Grid
- Add the `.row` class to form groups and use the `.col-*-*` classes to specify the width of your labels and controls
- Be sure to add `.col-form-label` to your `<label>`s as well so they’re vertically centered with their associated form controls.
- For `<legend>` elements, you can use `.col-form-legend` to make them appear similar to regular `<label>` elements.

### Custom forms
**Checkboxes** and **Radios**
```html
<label class="custom-control custom-checkbox">
  <input type="checkbox" class="custom-control-input">
  <span class="custom-control-indicator"></span>
  <span class="custom-control-description">Check this custom checkbox</span>
</label>
```

- Custom checkboxes can also utilize the :indeterminate pseudo class when manually set via JavaScript
	- `$('.your-checkbox').prop('indeterminate', true)`

#### Stacked
- Custom checkboxes and radios are inline to start.
- Add a parent with class `.custom-controls-stacked` to ensure each form control is on separate lines

#### Select menu
- Custom `<select>` menus need only a custom class, `.custom-select` to trigger the custom styles.

#### File browser
- require additional JavaScript if you’d like to hook them up with functional Choose file… and selected file name text.
	```html
	<label class="custom-file">
	  <input type="file" id="file" class="custom-file-input">
	  <span class="custom-file-control"></span>
	</label>
	```
- To make a custom "upload file" control, wrap the `<input>` tag inside a `<label>` that has the `.custom-file` class applied.
- Use `.custom-file-input` on the actual `<input>` element.
- Also use a `<span>` element with the `.custom-file-control` class applied.
- To set text of the button
	```scss
	$custom-file-text: (
	  placeholder: (
	    en: "Choose file...",
	    es: "Seleccionar archivo..."
	  ),
	  button-label: (
	    en: "Browse",
	    es: "Navegar"
	  )
	);
	```
- to support file uploads, HTML forms must specify an `enctype` of `multipart/form-data`
	``` html
	<form method="post" enctype="multipart/form-data" asp-controller="UploadFiles" asp-action="Index">
	```
	- see https://docs.microsoft.com/en-us/aspnet/core/mvc/models/file-uploads

- For additional information see
	- https://www.quackit.com/bootstrap/bootstrap_4/tutorial/bootstrap_custom_forms.cfm
	- https://www.codeply.com/go/SkIJQ5LqKp/bootstrap-4-file-input
	- https://www.codeply.com/go/1cYCiy9m7M/bootstrap-4-file-input
	- https://github.com/twbs/bootstrap/issues/20813
		```html
		<label class="custom-file d-block">
			<input data-toggle="custom-file" data-target="#company-logo" type="file" name="company_logo" accept="image/png" class="custom-file-input">
			<span id="company-logo" class="custom-file-control custom-file-name" data-content="Upload company logo..."></span>
		</label>
		```
	- https://bootstrap-vue.js.org/docs/components/form-file/


### Input group
- does not support multiple form-controls in a single input group
- Place any checkbox or radio option within an input group’s addon instead of text
- Multiple add-ons are supported and can be mixed with checkbox and radio input versions
- Buttons in input groups must wrapped in a .input-group-btn for proper alignment and sizing
	- Buttons with dropdowns
	- Segmented buttons

### Accessibility
`<label>` elements with
- `sr-only`
- `aria-label`
- `aria-labelledby`
- `aria-describedby`
- title or placeholder
