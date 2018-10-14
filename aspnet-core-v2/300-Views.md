# Razor Notes

## Atribute Routing
see https://docs.microsoft.com/en-us/aspnet/core/mvc/views/tag-helpers/built-in/anchor-tag-helper?view=aspnetcore-2.1
```
[Route("Speaker/{id:int}")]
```

## Specifying a Layout
```
@{
    Layout = "_Layout";
}
```

## Sections
- To instruct the view engine to ignore the body or sections, call the IgnoreBody and IgnoreSection methods.
	```
	@section Scripts {
	     <script type="text/javascript" src="/scripts/main.js"></script>
	   }
	```

## Tag Helper

### Anchor Tag Helper
```
<a asp-controller="Speaker"
   asp-action="Index">All Speakers</a>

// will generate
<a href="/Speaker">All Speakers</a>

```

```cs
var url = Url.Action("Destination");
```

## Specify Views
```cs
// An explicit view to return:
return View("Orders");

// A model to pass to the view:
return View(Orders);

// Both a view and a model:
return View("Orders", Orders);

return View("Views/Home/About.cshtml");

```

- view discovery searches for a matching view file in this order:
    1. Views/[ControllerName]/[ViewName].cshtml
    2. Views/Shared/[ViewName].cshtml
- If using an absolute path starting at the app root (optionally starting with "/" or "~/"), the .cshtml extension must be specified:
 
