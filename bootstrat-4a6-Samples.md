# Samples
from http://devdocs.io/bootstrap~4/
`Mon, 26-Jun-2017 20:06:45 +0530`

## Form Classes
|          Classes           |          Used for          |                                      Supported variations                                       |
| -------------------------- | -------------------------- | ----------------------------------------------------------------------------------------------- |
| `.form-group`              | Any group of form controls | Use with any block-level element like `<fieldset>` or `<div>`                                   |
| `.form-control`            | Textual inputs             | text, password, datetime-local, date, month, time, week, number, email, url, search, tel, color |
|                            | Select menus               | multiple, size                                                                                  |
|                            | Textareas                  | N/A                                                                                             |
| `.form-control-file`       | File inputs                | file                                                                                            |
| `.form-check`              | Checkboxes and radios      | N/A                                                                                             |
| `.form-check-inline`       | Checkboxes and radios      | on the same horizontal row                                                                      |
| `.form-control-static`     |                            | to place plain text next to a form label within a form                                          |
| `.form-text`               |                            | Block-level help text in forms                                                                  |
| `.custom-controls-stacked` | Checkboxes and radios      | to ensure each form control is on separate lines                                                |
|                            |                            |                                                                                                 |

### form-group
http://devdocs.io/bootstrap~4/components/forms
```html
<div class="form-group row">
  <label for="example-text-input" class="col-2 col-form-label">Text</label>
  <div class="col-10">
    <input class="form-control" type="text" value="Artisanal kale" id="example-text-input">
  </div>
</div>
<div class="form-group row">
  <label for="example-search-input" class="col-2 col-form-label">Search</label>
  <div class="col-10">
    <input class="form-control" type="search" value="How do I shoot web" id="example-search-input">
  </div>
</div>
```

### form-inline
http://devdocs.io/bootstrap~4/components/forms
```html
<form class="form-inline">
  <label class="sr-only" for="inlineFormInput">Name</label>
  <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="inlineFormInput" placeholder="Jane Doe">

  <label class="sr-only" for="inlineFormInputGroup">Username</label>
  <div class="input-group mb-2 mr-sm-2 mb-sm-0">
    <div class="input-group-addon">@</div>
    <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Username">
  </div>

  <div class="form-check mb-2 mr-sm-2 mb-sm-0">
    <label class="form-check-label">
      <input class="form-check-input" type="checkbox"> Remember me
    </label>
  </div>

  <button type="submit" class="btn btn-primary">Submit</button>
</form>
```

## Using the Grid
- For more structured form layouts that are also responsive, you can utilize Bootstrap’s predefined grid classes or mixins to create horizontal forms.
- Add the .row class to form groups and use the .col-\*-\* classes to specify the width of your labels and controls.
- Be sure to add .col-form-label to your `<label>`s as well so they’re vertically centered with their associated form controls.
- For `<legend>` elements, you can use .col-form-legend to make them appear similar to regular `<label>` elements.

## Help text
- Block-level help text in forms can be created using .form-text (previously known as .help-block in v3).
- Inline help text can be flexibly implemented using any inline HTML element and utility classes like .text-muted.
- **Associating help text with form controls**
- Help text should be explicitly associated with the form control it relates to using the aria-describedby attribute.
- This will ensure that assistive technologies – such as screen readers – will announce this help text when the user focuses or enters the control.

## Checkboxes and radios
- Each checkbox and radio is wrapped in a `<label>` for three reasons:
	- It provides a larger hit areas for checking the control.
	- It provides a helpful and semantic wrapper to help us replace the default `<input>`s.
	- It triggers the state of the `<input>` automatically, meaning no JavaScript is required.

### Stacked
Custom checkboxes and radios are inline to start.
Add a parent with class **.custom-controls-stacked** to ensure each form control is on separate lines.
```html
<div class="custom-controls-stacked">
  <label class="custom-control custom-radio">
    <input id="radioStacked1" name="radio-stacked" type="radio" class="custom-control-input">
    <span class="custom-control-indicator"></span>
    <span class="custom-control-description">Toggle this custom radio</span>
  </label>
  <label class="custom-control custom-radio">
    <input id="radioStacked2" name="radio-stacked" type="radio" class="custom-control-input">
    <span class="custom-control-indicator"></span>
    <span class="custom-control-description">Or toggle this other custom radio</span>
  </label>
</div>
```

## File browser
The file input is the most gnarly of the bunch and require additional JavaScript if you’d like to hook them up with functional Choose file… and selected file name text.
```html
<label class="custom-file">
  <input type="file" id="file" class="custom-file-input">
  <span class="custom-file-control"></span>
</label>
```
