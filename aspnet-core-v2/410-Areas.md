# Areas
> https://docs.microsoft.com/en-us/aspnet/core/mvc/controllers/areas?view=aspnetcore-2.1


- Areas are an ASP.NET MVC feature used to organize related functionality into a group as a separate namespace (for routing) and folder structure (for views). 
- Using areas creates a hierarchy for the purpose of routing by adding another route parameter, area, to controller and action.
- Each area has its own controllers, models, and views.
- Default locations
	- /Areas/<Area-Name>/Views/<Controller-Name>/<Action-Name>.cshtml
	- /Areas/<Area-Name>/Views/Shared/<Action-Name>.cshtml
	- /Views/Shared/<Action-Name>.cshtml
- Default locations which can be changed via the `AreaViewLocationFormats` on the `Microsoft.AspNetCore.Mvc.Razor.RazorViewEngineOptions`.
	```cs
	services.Configure<RazorViewEngineOptions>(options =>
	{
		options.AreaViewLocationFormats.Clear();
		options.AreaViewLocationFormats.Add("/Categories/{2}/Views/{1}/{0}.cshtml");
		options.AreaViewLocationFormats.Add("/Categories/{2}/Views/Shared/{0}.cshtml");
		options.AreaViewLocationFormats.Add("/Views/Shared/{0}.cshtml");
	});	
	```

- Need to tell MVC that each controller is associated with an area.
	- by decorating the controller name with the [Area] attribute.
	```cs
	[Area("Products")]
	public class HomeController : Controller	
	```
- links from an action within an area based controller to another action on a different controller and a different area.
	- current request's path is like `/Products/Home/Create`
	- HtmlHelper syntax: `@Html.ActionLink("Go to Services Home Page", "Index", "Home", new { area = "Services" })`
	- TagHelper syntax: `<a asp-area="Services" asp-controller="Home" asp-action="Index">Go to Services Home Page</a>`
- links from an action within an area based controller to another action on a different controller and NOT in an area.
	- HtmlHelper syntax: `@Html.ActionLink("Go to Manage Products Home Page", "Index", "Home", new { area = "" })`
	- TagHelper syntax: `<a asp-area="" asp-controller="Manage" asp-action="Index">Go to Manage Products Home Page</a>`

## Publishing Areas
All *.cshtml and wwwroot/** files are published to output when <Project Sdk="Microsoft.NET.Sdk.Web"> is included in the .csproj file.
