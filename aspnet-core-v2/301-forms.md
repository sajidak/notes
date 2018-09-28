# Forms

## Links
- https://www.learnrazorpages.com/

## Misc
- **Enabling Tag Helpers**
	- enabled by adding an @addTagHelper directive to the page,
	- or more usually to a _ViewImports.cshtml file
	- `@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers`

- **Cache Tag Helper**

- **asp-append-version**
	- The query string named `v` is added to the image's URL if the `append-version` attribute is set to true.
	- The value is calculated from the file contents, so if the file is amended, the value will differ.
	- `<img asp-append-version="true" src="~/images/banner1.svg" />`

- **Antiforgery options**
	- Explicitly add an antiforgery token to a `<form>` element
	- `@Html.AntiForgeryToken()`
	- Customize antiforgery options in `Startup.ConfigureServices`:
		```cs
		services.AddAntiforgery(options =>
		{
			options.CookieDomain = "contoso.com";
			options.CookieName = "X-CSRF-TOKEN-COOKIENAME";
			options.CookiePath = "Path";
			options.FormFieldName = "AntiforgeryFieldname";
			options.HeaderName = "X-CSRF-TOKEN-HEADERNAME";
			options.RequireSsl = false;
			options.SuppressXFrameOptionsHeader = false;
		});
		```
	- `ValidateAntiForgeryToken` is an action filter that can be applied to an individual action, a controller, or globally.
		- an be overridden with the `IgnoreAntiforgeryToken` attribute.
	- `IgnoreAntiforgeryToken` filter is used to eliminate the need for an antiforgery token for a given action (or controller)


## Accessing User Input

- User input is only available to server-side code if the form control has a value applied to the name attribute.

- There are several ways to reference posted form values:
    - Accessing the Request.Form collection via a string-based index, using the name attribute of the form control as the index value.
		```cs
		public void OnPost()
		{
			var emailAddress = Request.Form["emailaddress"];
			// do something with emailAddress
		}
		```
    - Leveraging Model Binding to map form fields to handler method parameters.
		```cs
		public void OnPost(string emailAddress)
		{
			// do something with emailAddress
		}
		```
    - Leveraging Model Binding to map form fields to public properties on a PageModel class.
		- The property to be included in model binding must be decorated with the BindProperty attribute.
		```cs
		[BindProperty]
		public string EmailAddress { get; set; }

		public void OnPost()
		{
			// do something with EmailAddress
		}
		```

## Tag Helpers
`<input asp-for="EmailAddress" />`
will render as
`<input type="text" id="EmailAddress" name="EmailAddress" value="" />`


## Antiforgery Token
- Turn off for app
	```cs
	services.AddMvc().AddRazorPagesOptions(o =>
	{
		o.Conventions.ConfigureFilter(new IgnoreAntiforgeryTokenAttribute());
	});
	```

- PageModel class (not a handler method) only
	```cs
	[IgnoreAntiforgeryToken(Order = 1001)]
	public class IndexModel : PageModel
	{
		public void OnPost()
		{

		}
	}
	```

## BindProperty
- From version 2.1 of ASP.NET Core,
	- you can add the new [BindProperties] attribute to the PageModel class rather than the individual properties,
	- which results in all the public properties in the PageModel taking part in model binding
- From GET Requests
	- `[BindProperty(SupportsGet = true)]`


## Binding Route Data
```cs
@page "{id}"
@model ModelBindingModel
@{
}

<h3>Id = @ViewData["id"]</h3>
```
