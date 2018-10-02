# Nlog - for aspnetcore2.1

## Links
- https://github.com/NLog/NLog/wiki/Configuration-file
- https://nlog-project.org/config/?tab=targets
	- Targets, Layout, Layout renderers
	- https://github.com/NLog/NLog/wiki/ColoredConsole-target
	- https://github.com/NLog/NLog/wiki/File-target
	- https://github.com/NLog/NLog/wiki/Database-target
	- https://github.com/NLog/NLog/wiki/FilteringWrapper-target
- https://nlog-project.org/config/?tab=layout-renderers
	- TODO: list interesting layouts.


## Get started
> https://github.com/NLog/NLog.Web/wiki/Getting-started-with-ASP.NET-Core-2

- Add dependency in csproj:
	```xml
	<PackageReference Include="NLog.Web.AspNetCore" Version="4.5.1" />
	<PackageReference Include="NLog" Version="4.5.1" />

	<!-- Enable copy to bin folder -->
	<ItemGroup>
	  <Content Update="nlog.config" CopyToOutputDirectory="PreserveNewest" />
	</ItemGroup>
	```
- Create a nlog.config file
- Update program.cs
	- add using NLog.Web; and using Microsoft.Extensions.Logging;
		```cs
		public static void Main(string[] args)
		{
		    // NLog: setup the logger first to catch all errors
		    var logger = NLog.Web.NLogBuilder.ConfigureNLog("nlog.config").GetCurrentClassLogger();
		    try
		    {
		        logger.Debug("init main");
		        BuildWebHost(args).Run();
		    }
		    catch (Exception ex)
		    {
		        //NLog: catch setup errors
		        logger.Error(ex, "Stopped program because of exception");
		        throw;
		    }
		    finally
		    {
		        // Ensure to flush and stop internal timers/threads before application-exit (Avoid segmentation fault on Linux)
		        NLog.LogManager.Shutdown();
		    }
		}

		public static IWebHost BuildWebHost(string[] args) =>
		    WebHost.CreateDefaultBuilder(args)
		        .UseStartup<Startup>()
		        .ConfigureLogging(logging =>
		        {
		            logging.ClearProviders();
		            logging.SetMinimumLevel(Microsoft.Extensions.Logging.LogLevel.Trace);
		        })
		        .UseNLog()  // NLog: setup NLog for Dependency injection
		        .Build();
		```
- Configure appsettings.json
- The Logging configuration specified in appsettings.json overrides any call to SetMinimumLevel.
	```json
	{
    "Logging": {
        "LogLevel": {
            "Default": "Trace",
            "Microsoft": "Information"
        	}
    	}
	}
	```
- Inject the ILogger in your controller:
	```cs
	using Microsoft.Extensions.Logging;

	public class HomeController : Controller
	{
	    private readonly ILogger<HomeController> _logger;

	    public HomeController(ILogger<HomeController> logger)
	    {
	        _logger = logger;
	    }

	    public IActionResult Index()
	    {
	        _logger.LogInformation("Index page says hello");
	        return View();
	    }
	```


## Configuration File
- Configuration file locations
web.nlog located in the same directory as web.config
NLog.config in application’s directory
NLog.config structure
```xml
<nlog
  xmlns="http://www.nlog-project.org/schemas/NLog.xsd"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  autoReload="true">

</nlog>
```

- Configuration elements
    - `<targets />` – defines log targets/outputs
    - `<rules />` – defines log routing rules
    - `<extensions />` – loads NLog extensions from the *.dll file
    - `<include />`– includes external configuration file
    - `<variable />` – sets the value of a configuration variable

- Log levels
    - Fatal
    - Error
    - Warn
    - Info
    - Debug
    - Trace

- Targets
- Rules
- Variables
	- `<variable name="var" value="xxx" />`
