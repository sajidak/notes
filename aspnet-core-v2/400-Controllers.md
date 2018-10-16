# Controllers

## See
- GetVirtualPath method of the route collection.

## What is a Controller?
- Inherit from Microsoft.AspNetCore.Mvc.Controller
- one of the following conditions is true:
	- The class name is suffixed with "Controller"
	- The class is decorated with the [Controller] attribute
- must not have an associated [NonController] attribute.

### Defining Actions
- Public methods on a controller, except those decorated with the [NonAction] attribute, are actions
- Parameters on actions are bound to request data and are validated using model binding.
- Actions can return anything, but frequently return an instance of `IActionResult` (or `Task<IActionResult>` for async methods)
- The action method is responsible for choosing what kind of response. The action result does the responding.

### Controller Helper Methods
- Methods resulting in an empty response body
	- BadRequest
	- NotFound
	- Ok
	- Redirect
	- LocalRedirect
	- RedirectToAction
	- RedirectToRoute
- Methods resulting in a non-empty response body with a predefined content type
	- View
	- Json
	- File
	- PhysicalFile
	- VirtualFile
- Methods resulting in a non-empty response body formatted in a content type negotiated with the client
	- applies whenever an action returns an ObjectResult type or something other than an IActionResult implementation.
	- CreatedAtRoute

## Constructor Injection
## Action Injection with FromServices
- by marking the parameter with the attribute `[FromServices]`
- e.g. `public IActionResult About([FromServices] IDateTime dateTime)`

## Accessing Settings from a Controller
> https://docs.microsoft.com/en-us/aspnet/core/mvc/controllers/dependency-injection?view=aspnetcore-2.1#accessing-settings-from-a-controller
- Accessing application or configuration settings from within a controller
- create a class. e.g. `SampleWebSettings`
- configure the application to use the options model
	```cs
	public Startup(IHostingEnvironment env)
	{
	    var builder = new ConfigurationBuilder()
	        .SetBasePath(env.ContentRootPath)
	        .AddJsonFile("samplewebsettings.json");
	    Configuration = builder.Build();
	}

	public IConfigurationRoot Configuration { get; set; }

	// This method gets called by the runtime. Use this method to add services to the container.
	// For more information on how to configure your application, visit http://go.microsoft.com/fwlink/?LinkID=398940
	public void ConfigureServices(IServiceCollection services)
	{
	    // Required to use the Options<T> pattern
	    services.AddOptions();

	    // Add settings from configuration
	    services.Configure<SampleWebSettings>(Configuration);

	    // Uncomment to add settings from code
	    //services.Configure<SampleWebSettings>(settings =>
	    //{
	    //    settings.Updates = 17;
	    //});

	    services.AddMvc();

	    // Add application services.
	    services.AddTransient<IDateTime, SystemDateTime>();
	}
	```
- request it from any Controller or Action method by requesting an instance of `IOptions<T>`
	```cs
	public class SettingsController : Controller
	{
	    private readonly SampleWebSettings _settings;

	    public SettingsController(IOptions<SampleWebSettings> settingsOptions)
	    {
	        _settings = settingsOptions.Value;
	    }

	    public IActionResult Index()
	    {
	        ViewData["Title"] = _settings.Title;
	        ViewData["Updates"] = _settings.Updates;
	        return View();
	    }
	}
	```

## Session
`HttpContext.Session.GetString(SessionName);`

### Enable
- Step 1
	```cs
	public void ConfigureServices(
	            IServiceCollection services)
	        {
	            services.AddDistributedMemoryCache();
	            services.AddSession();
	        }
	```
- Step 2
	```cs
	public void Configure(
	            IApplicationBuilder app,
	            IHostingEnvironment env)
	        {
	            app.UseSession();

	            app.Use(async (context, next) =>
	            {
	                context.Session.SetString("GreetingMessage", "Hello Session State");
	                await next();
	            });

	            app.Run(async (context) =>
	            {
	                var message = context.Session.GetString("GreetingMessage");
	                await context.Response.WriteAsync($"{message}");
	            });
	        }
	```

## Attribute Routing
> https://docs.microsoft.com/en-us/aspnet/core/mvc/controllers/routing?view=aspnetcore-2.1

### Examples
- Will work for `/products/5`, but not for `/products`
```cs
public class ProductsApiController : Controller
{
   [HttpGet("/products/{id:int}", Name = "Products_List")]
   public IActionResult GetProduct(int id) { ... }
}
```

### Token replacement in route templates
- `[controller]`
- `[action]`
- `[area]`


### route optional parameters, default values, and constraints
- e.g. 1
	```cs
	[HttpPost("product/{id:int}")]
	public IActionResult ShowProduct(int id)
	{
	   // ...
	}
	```

### `asp-route-{value}`
- e.g. 2.a
	```
	@model Speaker
	<!DOCTYPE html>
	<html>
	<body>
	    <a asp-controller="Speaker"
	       asp-action="Detail"
	       asp-route-id="@Model.SpeakerId">SpeakerId: @Model.SpeakerId</a>
	</body>
	</html>
	```
	- Will generate `<a href="/Speaker/Detail/12">SpeakerId: 12</a>`
- e.g. 2.b
	```
	@model Speaker
	<!DOCTYPE html>
	<html>
	<body>
	    <a asp-controller="Speaker"
	       asp-action="Detail"
	       asp-route-speakerid="@Model.SpeakerId">SpeakerId: @Model.SpeakerId</a>
	<body>
	</html>
	```
	- Will generate `<a href="/Speaker/Detail?speakerid=12">SpeakerId: 12</a>`
	- because speakerid wasn't found in the matching route:
- Action used for this e.g.
	```cs
	public IActionResult AnchorTagHelper(int id)
	{
	    var speaker = new Speaker
	    {
	        SpeakerId = id
	    };

	    return View(speaker);
	}
	```


## Route constraint
> https://docs.microsoft.com/en-us/aspnet/core/fundamentals/routing?view=aspnetcore-2.1
