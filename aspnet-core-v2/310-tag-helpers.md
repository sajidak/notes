# ASP.NET Core built-in Tag Helpers
> https://docs.microsoft.com/en-us/aspnet/core/mvc/views/tag-helpers/built-in/?view=aspnetcore-2.1

## Interesting
- `@Html.DisplayFor(model => model.Name)`
	- from https://docs.microsoft.com/en-us/aspnet/core/mvc/views/working-with-forms?view=aspnetcore-2.1#the-form-tag-helper
- **Note**
	- Always use for (and not foreach) to iterate over a list.
	- Evaluating an indexer in a LINQ expression can be expensive and should be minimized.
- **Enum binding**
	- often convenient to use `<select>` with an enum property and generate the SelectListItem elements from the enum values.
- HTML Helper **alternatives**
	- Html.TextBox
	- Html.TextBoxFor
	- Html.Editor
	- Html.EditorFor
	- Html.TextAreaFor
	- Html.DropDownListFor
	- Html.ListBoxFo
	- Html.DropDownListFor
	- Html.ListBoxFor



## Anchor Tag Helper
- asp-controller
- asp-action
- asp-route-{value}
- asp-route
- asp-all-route-data
- asp-fragment
- asp-area
- asp-protocol
- asp-host
- asp-page
	- used with Razor Pages
	- Prefixing the page name with a forward slash ("/") creates the URL.
	- mutually exclusive with the asp-route, asp-controller, and asp-action attributes.
- asp-page-handler
	- used with Razor Pages.
	- intended for linking to specific page handlers.

### Examples
- 1
	- `@Html.ActionLink("Create a New Product", "Create", null, new { @class = "btn btn-lg btn-outline-secondary ml-auto" })`
	- `@Html.ActionLink("Edit", "Edit", new { id = item.PRD_ID }) |`


## The Form Tag Helper
- Generates the HTML `<FORM>` action attribute value for a MVC controller action or named route
- Generates a hidden Request Verification Token
	- when used with the `[ValidateAntiForgeryToken]` attribute in the HTTP Post action method
- Has an HTML Helper alternative `Html.BeginForm` and `Html.BeginRouteForm`

## The Input Tag Helper
```html
<input asp-for="<Expression Name>" />
```

### data annotations attributes
| Attribute                     | Input Type      |
|:----------------------------- |:--------------- |
| [EmailAddress]                | type=”email”    |
| [Url]                         | type=”url”      |
| [HiddenInput]                 | type=”hidden”   |
| [Phone]                       | type=”tel”      |
| [DataType(DataType.Password)] | type=”password” |
| [DataType(DataType.Date)]     | type=”date”     |
| [DataType(DataType.Time)]     | type=”time”     |

## Environment Tag Helper
- conditionally renders its enclosed content based on the current hosting environment.
- **include** and **exclude** attributes.
- These attributes control rendering the enclosed content based on the included or excluded hosting environment names.
- are comma separated list of environment names,
- Include: render the enclosed content only for hosting environment names(s) specified.
	```xml
	<environment include="Staging,Production">
	  <strong>HostingEnvironment.EnvironmentName is Staging or Production</strong>
	</environment>
	```
- Exclude: render the enclosed content for all hosting environment names except the one(s) specified.
	```xml
	<environment exclude="Development">
	  <strong>HostingEnvironment.EnvironmentName is Staging or Production</strong>
	</environment>
	```

## Select Tag Helper
- Generates select and associated option elements
- alternative Html.DropDownListFor and Html.ListBoxFor
- `<select asp-for="Country" asp-items="Model.Countries"></select>`

### Enum binding
- GetEnumSelectList method generates a SelectList object for an enum.
	```html
	<select asp-for="EnumCountry"
			asp-items="Html.GetEnumSelectList<CountryEnum>()"> >
	</select>
	```
- enum sample
	```cs
    public enum CountryEnum
    {
        [Display(Name = "United Mexican States")]
        Mexico,
        [Display(Name = "United States of America")]
        USA,
        Spain
    }
	```
- See also
	- https://www.mikesdotnetting.com/article/265/asp-net-mvc-dropdownlists-multiple-selection-and-enum-support
	-

***

# Populating Lookup Data
> https://docs.microsoft.com/en-us/aspnet/core/mvc/views/dependency-injection?view=aspnetcore-2.1#populating-lookup-data

## DI
- syntax for` @inject`: `@inject <type> <name>`
- think of `@inject` as adding a property to your view, and populating the property using DI.
- In addition to injecting new services, this technique can also be used to override previously injected services on a page.


## Simple Example
- View
	```
	@using System.Threading.Tasks
	@using ViewInjectSample.Model.Services
	@model ViewInjectSample.Model.Profile
	@inject ProfileOptionsService Options
	<!DOCTYPE html>
	<html>
	<head>
	  <title>Update Profile</title>
	</head>
	<body>
	<div>
	    <h1>Update Profile</h1>
	    Name: @Html.TextBoxFor(m => m.Name)
	    <br/>
	    Gender: @Html.DropDownList("Gender",
	           Options.ListGenders().Select(g =>
	                new SelectListItem() { Text = g, Value = g }))
	    <br/>

	    State: @Html.DropDownListFor(m => m.State.Code,
	           Options.ListStates().Select(s =>
	                new SelectListItem() { Text = s.Name, Value = s.Code}))
	    <br />

	    Fav. Color: @Html.DropDownList("FavColor",
	           Options.ListColors().Select(c =>
	                new SelectListItem() { Text = c, Value = c }))
	    </div>
	</body>
	</html>
	```
- Service Class
	```cs
	using System.Collections.Generic;

	namespace ViewInjectSample.Model.Services
	{
	    public class ProfileOptionsService
	    {
	        public List<string> ListGenders()
	        {
	            // keeping this simple
	            return new List<string>() {"Female", "Male"};
	        }

	        public List<State> ListStates()
	        {
	            // a few states from USA
	            return new List<State>()
	            {
	                new State("Alabama", "AL"),
	                new State("Alaska", "AK"),
	                new State("Ohio", "OH")
	            };
	        }

	        public List<string> ListColors()
	        {
	            return new List<string>() { "Blue","Green","Red","Yellow" };
	        }
	    }
	}
	```
- Configure Service
```cs
public void ConfigureServices(IServiceCollection services)
{
    services.AddMvc();

    services.AddTransient<IToDoItemRepository, ToDoItemRepository>();
    services.AddTransient<StatisticsService>();
    services.AddTransient<ProfileOptionsService>();
```
