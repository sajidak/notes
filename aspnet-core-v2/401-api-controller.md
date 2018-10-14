# Microsoft.AspNetCore.Mvc.Controller
> https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.controller?view=aspnetcore-2.1

# Controller
```cs
public abstract class Controller
	: Microsoft.AspNetCore.Mvc.ControllerBase
	, IDisposable
	, Microsoft.AspNetCore.Mvc.Filters.IActionFilter
	, Microsoft.AspNetCore.Mvc.Filters.IAsyncActionFilter
	{}
```

- Properties
	- ControllerContext
	- HttpContext
	- MetadataProvider
	- ModelBinderFactory
	- ModelState
	- ObjectValidator
	- Request
	- Response
	- RouteData
	- TempData
	- Url
	- User
	- ViewBag
	- ViewData

- Methods (interesting subset)
	- `OnActionExecuting` - Called before the action method is invoked.
		```cs
		[Microsoft.AspNetCore.Mvc.NonAction]
		public virtual void OnActionExecuting (Microsoft.AspNetCore.Mvc.Filters.ActionExecutingContext context);
		```
	- `File` - Returns the file specified by `virtualPath` (Status200OK) with the specified `contentType` as the Content-Type and the specified `fileDownloadName` as the suggested file name.
		```cs
		[Microsoft.AspNetCore.Mvc.NonAction]
		public virtual Microsoft.AspNetCore.Mvc.VirtualFileResult File (string virtualPath, string contentType, string fileDownloadName, bool enableRangeProcessing);
		```

# PageModel
```cs
[Microsoft.AspNetCore.Mvc.RazorPages.Infrastructure.PageModel]
public abstract class PageModel
	: Microsoft.AspNetCore.Mvc.Filters.IAsyncPageFilter
	, Microsoft.AspNetCore.Mvc.Filters.IFilterMetadata
	, Microsoft.AspNetCore.Mvc.Filters.IPageFilter
	{}
```

- Methods (interesting subset)
	- `OnPageHandlerSelected` - Called after a handler method has been selected, but before model binding occurs.
		```cs
		public virtual void OnPageHandlerSelected (Microsoft.AspNetCore.Mvc.Filters.PageHandlerSelectedContext context);
		```
	- `OnPageHandlerSelectionAsync` - Called asynchronously after the handler method has been selected, but before model binding occurs.
		```cs
		public virtual System.Threading.Tasks.Task OnPageHandlerSelectionAsync (Microsoft.AspNetCore.Mvc.Filters.PageHandlerSelectedContext context);
		```
	- ** `OnPageHandlerExecuting` - Called before the handler method executes, after model binding is complete.
		```cs
		public virtual void OnPageHandlerExecuting (Microsoft.AspNetCore.Mvc.Filters.PageHandlerExecutingContext context);
		```
	- `OnPageHandlerExecutionAsync` - Called asynchronously before the handler method is invoked, after model binding is complete.
		```cs
		public virtual System.Threading.Tasks.Task OnPageHandlerExecutionAsync (Microsoft.AspNetCore.Mvc.Filters.PageHandlerExecutingContext context, Microsoft.AspNetCore.Mvc.Filters.PageHandlerExecutionDelegate next);
		```
