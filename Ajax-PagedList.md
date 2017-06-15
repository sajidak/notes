# AJAX with ASP.NET MVC

**TODO:** Organize and add comments

**Links:**
[home](http://pluralsight.com/training/Player?author=scott-allen&name=mvc4-building-m6-ajax&mode=live&clip=0&course=mvc4-building)
[Ajax unobtrusive](https://app.pluralsight.com/player?author=scott-allen&name=mvc4-building-m6-ajax&mode=live&clip=4&course=mvc4-building)
[AutoComplete](https://app.pluralsight.com/player?author=scott-allen&name=mvc4-building-m6-ajax&mode=live&clip=5&course=mvc4-building)
[Pager](https://app.pluralsight.com/player?author=scott-allen&name=mvc4-building-m6-ajax&mode=live&clip=6&course=mvc4-building)

## Notes:
- Scripts/_references.js
	- gives VS list of foles commonly used
	- will be used for intellisense
	- add any file you need intellisense for
- modernizr.js
	- should be run before any html goes to client
	- use in head section
- in Web.Config file in the Views folder
	- `<namespaces>` same as import statement in individual pages
	- need to restart  VS for changes to take effect

## Ajax on client
- `jquery.unobtrusive`
- `jquery.validation`
- replace `form` with `Ajax.BeginForm`
	- replace with generated code, for unobtrusive
- `Ajax.ActionLink`
- `#ListSection` = id of div, whose content will be replaced by ajax response
- Paging
	- use `PagedList.Mvc`
	- add references in Controller, View, Model, Layouts
	- include PagedList.css for desired rendering

## Auto Complete
```cs
// Controller Action to return only requested data slice
// can also be called individually
public ActionResult AutoComplete(string term)
{
	var model =
		x
		x
		x
		.Select( r=> new
		{
			label = r.name
			// needs to be label or value or both
			// label is sufficient for now
		});
	// return data in JSON format
	return Json(model, JsonRequestBehavior.AllowGet);
}
```

## Paging
```cs
// Controller code
public ActionResult Index(string searchTerm = null, int page = 1, int pageSize = 10)
{
	// var model =
	var IPagedList =
		_db.xyz
		.x
		.x
		.Select(r => new xyzModel
			{
				Id = r.Id,
				Name = r.Name,
				x
				x
			}).ToPagedList(page, pageSize)
}
```


```cs
// Controller code, to get generated HTML
// Will be replaced with generated HTML code
@using(Ajax.BeginForm(
	new AjaxOptions{
		HttpMethod="get",
		InsertionMode=InsertionMode.Replace,
		UpdateTargetId="ListSection"
	}
))
// #ListSection = id of dive of which content needs to be replaced with

if (Request.IsAjaxRequect())
{
	return PartialView("_PartialViewName", model)
} else {
	return View(model);
}
```

```html
<!-- Content of View -->

<form method="get" action="@url.Action("Index")"
	data-otf-ajax="true" data-otf-target="#ListSection">

	<input type="search" name="searchTerm" data-otf-autocomplete="@url.Action("Autocomplete")" />
	<input type="submit" value="Search By Name" />
</form>


<!-- Use Partial View for replacable section, including the 'div' -->
<!-- Content of partial View -->
<div id="ListSection">
	<!-- Code for pager controls  -->
	<div class="pagedList" data-otf-target="#ListSection">
		@Html.PagedListPager(Model
			, page => Url.Action("Index", new {page})
			, PagedListRenderOptions.MinimalWithItemCountText
		)
	</div>
	<!-- Code for Items to be displayed  -->
	@foreach (var item in Model)
	{

	}
</div>
<!-- #ListSection = id of dive of which content needs to be replaced with -->
```

## otf.js
- Consolidated code for
	- unobtrusive AJAX search
	- Autocomplete
	- Paging
```js
$(function () {
	//************************************************************************//
	// UNOBTRUSIVE SEARCH - BEGIN
	//------------------------------------------------------------------------//
	// event sink function, for Unobtrusive Search
	var ajaxFormSubmit = function () {
		// jq reference to the element that triggered the event
		var $form = $(this);
		// data that will be sent to server
		var options = {
			url: $form.attr("action"),
			type: $form.attr("method"),
			data: $form.serialize()
		};

		// function to process the response
		$.ajax(options).done(
			// TODO-01: Make this function reusable. Same code called from several places
			function (data){
				// get element which needs to be updated,
				// use convention to enable hardcoding this name
				var $target = $($form.attr("data-otf-target"));
				var $newHtml = $(data);
				$target.replaceWith($newHtml);
				$newHtml.effect("highlight");	// visually indicate to user that data changes
				}
			);
		return false;	// stop default submit
	};

	// Intercept Search action
	$("form[data-otf-ajax='true']").submit(ajaxFormSubmit);
	//------------------------------------------------------------------------//
	// UNOBTRUSIVE SEARCH - END
	//************************************************************************//


	//************************************************************************//
	// AUTOCOMPLETE- BEGIN
	//------------------------------------------------------------------------//
	// process the auto submit, from createAutoComplete
	var submitAutoCompleteForm = function (event, ui) {
		var $input = $(this);
		$input.val(ui.item.label);

		// get and submit the form
		var $form = $input.parents("form:first");
		$form.submit();
		// NOTE: This looks incomplete, verify
		};

	// function to link AutoComplete events and functions
	var createAutoComplete = function () {
		var $input = $(this);
		var options = {
			source = $input.attr("data-otf-autocomplete")
			select: submitAutoCompleteForm	// submit form when user selects suggestion
			};
		};

	// Intercept Autocomplete triggers
	$("input[data-otf-autocomplete]").each(createAutoComplete);

	//------------------------------------------------------------------------//
	// AUTOCOMPLETE - END
	//************************************************************************//


	//************************************************************************//
	// PAGING- BEGIN
	//------------------------------------------------------------------------//
	// Function to process paging
	var getPage = function () {
		var $a = $(this);
		var options = {
			url: $a.attr("href"),
			data: $("form").serialize(),
			type: "get"
		};

		$.ajax(options).done(
			// see "TODO-01"
			function (data) {
				var target = $a.parents("div.pagedList").attr("data-otf-target");
				$target.replaceWith(data);
				}
			);
		return false;	// stop default submit
	};

	// Intercept paging events
	// needs to be this way, coz elements will be recreated with each new request
	// main-content will never be destroyed during the lifetime of the page
	$(".main-content").on("click", ".pagedList a", getPage);

	//------------------------------------------------------------------------//
	// PAGING - END
	//************************************************************************//

});

```

## otf.js
**Updated with reusable content update function**
```js
	// hmmm, how do we pass target? use option
	var updateResult = function (data, targetElem){
		var $newHtml = $(data);
		$(targetElem).replaceWith($newHtml);
		$newHtml.effect("highlight");	// visually indicate to user that data changes
		}
	);

// TODO:
// usage:
```
