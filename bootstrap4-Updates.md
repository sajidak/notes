# Bootstrap 4 - Updates
`Wed, 08-Nov-2017 13:30:07.208 +0530`

> Changes from earlier versions, to be consolidated into
[bootstrap4-Notes](bootstrap4-Notes.md)

_Contains only those bits needed for RCW project._
**TODO:** Add info on icon usage

**Contents**

[TOC]
---

## Notes:
- How can I make a web font using the SVG images?
	- http://www.entypo.com/faq.php
	- Pick the SVG images you want to use and then go to Fontello, Fontastic.me or the IcoMoon app and follow their instructions on how to do this.
	- [Fontello](http://www.fontello.com/)
	- [Fontastic.me](http://www.fontastic.me/)
	- [IcoMoon app](https://icomoon.io/app)

## Breaking
- Removed the unused `.form-control-label` class. If you did make use of this class, it was duplicate of the `.col-form-label` class that vertically centered a `<label>` with it’s associated input in horizontal form layouts.
- Renamed `.table-inverse`, `.thead-inverse`, and `.thead-default` to `.*-dark` and `.*-light`, matching our color schemes used elsewhere.

## Global changes
- Flexbox is enabled by default. In general this means a move away from floats and more across our components.
- Switched from `px` to `rem` as our primary CSS unit, though pixels are still used for media queries and grid behavior as device viewports are not affected by type size.
- Global `font-size` increased from 14px to 16px.

## Components
- Dropped panels, thumbnails, and wells for a new all-encompassing component, cards.

## Icons
Bootstrap doesn’t include an icon library by default, but we have a handful of recommendations for you to choose from. While most icon sets include multiple file formats, we prefer SVG implementations for their improved accessibility and vector support.

### Preferred Icons
- [Iconic](https://useiconic.com/open/)
- [Octicons](https://octicons.github.com/)
- [Entypo](http://www.entypo.com/)

### More options
While we haven’t tried these out, they do look promising and provide multiple formats—including SVG.
- [Bytesize](https://github.com/danklammer/bytesize-icons)
- [Google Material icons](https://material.io/icons/)
- [Ionicons](http://ionicons.com/)
- [Feather](https://feathericons.com/)
- [Dripicons](http://demo.amitjakhu.com/dripicons/)
- [Ikons](http://ikons.piotrkwiatkowski.co.uk/)
- [Glyph](http://glyph.smarticons.co/)


## Typography
- Moved all `.text-` utilities to the _utilities.scss file.
- `.dl-horizontal` has been dropped. Instead, use `.row` on `<dl>` and use grid column classes (or mixins) on its `<dt>` and `<dd>` children.
- `.list-inline` now requires that its children list items have the new `.list-inline-item` class applied to them.

## Images
- Renamed `.img-responsive` to `.img-fluid`
- Renamed `.img-rounded` to `.rounded`
- Renamed `.img-circle` to `.rounded-circle`

## Tables
- Renamed `.table-condensed` to `.table-sm` for consistency.
- Added a new `.table-inverse` option.
- Added table header modifiers: `.thead-default` and `.thead-inverse`.
- Renamed contextual classes to have a `.table--prefix`. Hence .active, .success, .warning, .danger and .info to .table-active, .table-success, .table-warning, .table-danger and .table-info.

## Forms
- Moved element resets to the _reboot.scss file.
- Renamed .control-label to .col-form-label.
- Renamed .input-lg and .input-sm to .form-control-lg and .form-control-sm, respectively.
- Dropped `.form-group-*` classes for simplicity’s sake. Use `.form-control-*` classes instead now.
- Dropped .help-block and replaced it with .form-text for block-level help text. For inline help text and other flexible options, use utility classes like .text-muted.
- Dropped .radio-inline and .checkbox-inline.
- Consolidated .checkbox and .radio into .form-check and the various .form-check-* classes.
- Horizontal forms overhauled:
	- Dropped the .form-horizontal class requirement.
	- .form-group no longer applies styles from the .row via mixin, so .row is now required for horizontal grid layouts (e.g., `<div class="form-group row">`).
	- Added new .col-form-label class to vertically center labels with .form-controls.
	- Added new .form-row for compact form layouts with the grid classes (swap your .row for a .form-row and go).
- Added custom forms support (for checkboxes, radios, selects, and file inputs).
- Replaced .has-error, .has-warning, and .has-success classes with HTML5 form validation via CSS’s :invalid and :valid pseudo-classes.
- Renamed .form-control-static to .form-control-plaintext.

## Buttons & Button group
- Renamed .btn-default to .btn-secondary.
- Removed .btn-group-justified. As a replacement you can use `<div class="btn-group d-flex" role="group"></div>` as a wrapper around elements with .w-100.
- Removed explicit spacing between button groups in button toolbars; use margin utilities now.

## Dropdowns
- Dropdowns can be built with `<div>s` or `<ul>s` now.
- Rebuilt dropdown styles and markup to provide easy, built-in support for `<a>` and `<button>` based dropdown items.
- Renamed .divider to .dropdown-divider.
- Dropdown items now require .dropdown-item.
- Dropdown toggles no longer require an explicit `<span class="caret"></span>`; this is now provided automatically via CSS’s `::after` on `.dropdown-toggle`.

## List groups
- Replaced a.list-group-item with an explicit class, .list-group-item-action, for styling link and button versions of list group items.
- Added .list-group-flush class for use with cards.

## Navbar
The navbar has been entirely rewritten in flexbox with improved support for alignment, responsiveness, and customization.

## Labels and badges
- Renamed .label to .badge to disambiguate from the `<label>` element.
- Dropped the .badge component as it was nearly identical to labels. Use the .badge-pill modifier together with the label component instead for that rounded look.
- Badges are no longer floated automatically in list groups and other components. Utility classes are now required for that.
- .badge-default has been dropped and .badge-secondary added to match component modifier classes used elsewhere.

## Panels
- .panel to .card, now built with flexbox.
- .panel-default removed and no replacement.
- .panel-group removed and no replacement. .card-group is not a replacement, it is different.
- .panel-heading to .card-header
- .panel-title to .card-title. Depending on the desired look, you may also want to use heading elements or classes (e.g. `<h3>`, .h3) or bold elements or classes (e.g. `<strong>`, `<b>`, `.font-weight-bold`). Note that .card-title, while similarly named, produces a different look than .panel-title.
- .panel-body to .card-body
- .panel-footer to .card-footer
- .panel-primary, .panel-success, .panel-info, .panel-warning, and .panel-danger have been dropped for .bg-, .text-, and .border utilities generated from our $theme-colors Sass map.

## Utilities
- Made display utilities responsive (e.g., .d-none and d-{sm,md,lg,xl}-none).
- Dropped the bulk of .hidden-* utilities for new display utilities. For example, instead of .hidden-sm-up, use .d-sm-none.
- Added .float-{sm,md,lg,xl}-{left,right,none} classes for responsive floats and removed .pull-left and .pull-right since they’re redundant to .float-left and .float-right.
- Added responsive variations to our text alignment classes .text-{sm,md,lg,xl}-{left,center,right}.
- Added new responsive margin and padding utilities for all sides, plus vertical and horizontal shorthands.
- Dropped .center-block for the new .mx-auto class.
