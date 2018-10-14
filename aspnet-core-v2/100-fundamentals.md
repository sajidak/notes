---
title: ASP.NET Core fundamentals
description: Working notes for demo
---

# ASP.NET Core fundamentals
```cs
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;

namespace aspnetcoreapp
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateWebHostBuilder(args).Build().Run();
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseStartup<Startup>();
    }
}
```

> **Links**
> https://docs.microsoft.com/en-us/aspnet/#pivot=core&panel=core_overview
> https://docs.microsoft.com/aspnet/core/mvc/overview
> https://docs.microsoft.com/aspnet/core/fundamentals/
> https://docs.microsoft.com/dotnet/api/?view=aspnetcore-2.0

- The Main method invokes `WebHost.CreateDefaultBuilder`, which follows the builder pattern to create a web application host.
- The builder has methods that define the web server (for example, UseKestrel)
- and the startup class (`UseStartup`).
- The UseStartup method on WebHostBuilder specifies the Startup class for your app

## Startup
- The Startup class is where you define the request handling pipeline
- and where any services needed by the app are configured.
- The Startup class must be public and contain the following methods:
	```cs
	public class Startup
	{
	    // This method gets called by the runtime. Use this method
	    // to add services to the container.
	    public void ConfigureServices(IServiceCollection services)
	    {
	    }

	    // This method gets called by the runtime. Use this method
	    // to configure the HTTP request pipeline.
	    public void Configure(IApplicationBuilder app)
	    {
	    }
	}
	```
- ConfigureServices defines the Services used by your app
- for example, ASP.NET Core MVC, Entity Framework Core, Identity
- Configure defines the middleware for the request pipeline.

## Dependency injection (services)
see [Dependency injection](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/dependency-injection?view=aspnetcore-2.1)
- The Startup.ConfigureServices method is responsible for defining the services the app uses, including platform features
- extension methods
	- [AddDbContext](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.entityframeworkservicecollectionextensions.adddbcontext)
	- AddIdentity(https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.identityservicecollectionextensions.addidentity)
	- AddMvc(https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.mvcservicecollectionextensions.addmvc)
- Service lifetimes
	- **Transient**
		- created each time they're requested.
		- This lifetime works best for lightweight, stateless services.
	- **Scoped**
		- created once per request.
		- inject the service into the Invoke or InvokeAsync method.
		- > Don't inject via constructor injection because it forces the service to behave like a singleton
	- **Singleton**
		- created the first time they're requested
		- or when ConfigureServices is run

	```cs
	public void ConfigureServices(IServiceCollection services)
	{
	    services.Configure<CookiePolicyOptions>(options =>
	    {
	        options.CheckConsentNeeded = context => true;
	        options.MinimumSameSitePolicy = SameSiteMode.None;
	    });

	    services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

	    services.AddScoped<IMyDependency, MyDependency>();
	    services.AddTransient<IOperationTransient, Operation>();
	    services.AddScoped<IOperationScoped, Operation>();
	    services.AddSingleton<IOperationSingleton, Operation>();
	    services.AddSingleton<IOperationSingletonInstance>(new Operation(Guid.Empty));

	    // OperationService depends on each of the other Operation types.
	    services.AddTransient<OperationService, OperationService>();
	}
	```
- Framework-provided services
	- Initially, the IServiceCollection provided to ConfigureServices has the following services defined (depending on how the host was configured):

	| Service Type                                                    | Lifetime  |
	| --------------------------------------------------------------- | --------- |
	| `Microsoft.AspNetCore.Hosting.Builder.IApplicationBuilderFactory` | Transient |
	| `Microsoft.AspNetCore.Hosting.IApplicationLifetime`               | Singleton |
	| `Microsoft.AspNetCore.Hosting.IHostingEnvironment`                | Singleton |
	| `Microsoft.AspNetCore.Hosting.IStartup`                           | Singleton |
	| `Microsoft.AspNetCore.Hosting.IStartupFilter`                     | Transient |
	| `Microsoft.AspNetCore.Hosting.Server.IServer`                     | Singleton |
	| `Microsoft.AspNetCore.Http.IHttpContextFactory`                   | Transient |
	| `Microsoft.Extensions.Logging.ILogger<T>`                         | Singleton |
	| `Microsoft.Extensions.Logging.ILoggerFactory`                     | Singleton |
	| `Microsoft.Extensions.ObjectPool.ObjectPoolProvider`              | Singleton |
	| `Microsoft.Extensions.Options.IConfigureOptions<T>`               | Transient |
	| `Microsoft.Extensions.Options.IOptions<T>`                        | Singleton |
	| `System.Diagnostics.DiagnosticSource`                             | Singleton |
	| `System.Diagnostics.DiagnosticListener`                           | Singleton |

### DI in Views

- In View
	```
	@inject StatisticsService StatsService

	<ul>
	<li>Total Items: @StatsService.GetCount()</li>
	<li>Completed: @StatsService.GetCompletedCount()</li>
	<li>Avg. Priority: @StatsService.GetAveragePriority()</li>
	</ul>
	```
- In `ConfigureServices(IServiceCollection services)`
	```cs
	services.AddTransient<StatisticsService>();
	```
- Class
	```cs
	public class StatisticsService
	{
	  public int GetCount()
	  {
	    return _toDoItemRepository.List().Count();
	  }
	}
	```

## Environments
see Use [multiple environments](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/environments?view=aspnetcore-2.1)
- ASP.NET Core reads the environment variable `ASPNETCORE_ENVIRONMENT` at app startup
- and stores the value in IHostingEnvironment.EnvironmentName
- Builtin values Development, Staging, and Production.
- defaults to Production
- e.g. `<p> ASPNETCORE_ENVIRONMENT = @hostingEnv.EnvironmentName</p>`
- can be set in the `Properties\launchSettings.json` file
- Environment values set in launchSettings.json override values set in the system environment.
**-** When using Visual Studio Code, environment variables can be set in the .vscode/launch.json file.

### Environment-based Startup class and methods
- Startup class conventions
	- app can define separate Startup classes for different environments
	- (for example, StartupDevelopment),
	- and the appropriate Startup class is selected at runtime.
	- If a matching `Startup{EnvironmentName}` class isn't found, the Startup class is used
- Startup method conventions
	- Configure and ConfigureServices support environment-specific versions of the form
	- `Configure<EnvironmentName>` and `Configure<EnvironmentName>Services`

## Configuration
see [Configuration](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/index?view=aspnetcore-2.1)
> TODO: load from web.config or appsettings.json
> 	https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/options?view=aspnetcore-2.1


- ASP.NET Core uses a configuration model based on name-value pairs.
- variety of file formats (XML, JSON, INI)
- Each configuration value maps to a string key
- Access configuration in a Razor Page or MVC view
	- Razor Pages page or MVC view:
	```
	@using Microsoft.Extensions.Configuration
	@inject IConfiguration Configuration
	...
    <h1>Access configuration in an MVC view</h1>
    <p>Configuration[&quot;key&quot;]: @Configuration["key"]</p>
	```
- Dependency Injection (DI) isn't set up until after ConfigureServices is invoked.
- The configuration system isn't DI aware.

### web.config file
- required when hosting the app in IIS or IIS Express
- If the web.config file isn't present
	- and the project file includes <Project Sdk="Microsoft.NET.Sdk.Web">,
	- publishing the project creates a web.config file in the published output


### Configuration by environment
see Configuration by environment section of [Configuration in ASP.NET Core.](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/index?view=aspnetcore-2.1#configuration-by-environment)

## Error handling
see [how to handle errors](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/error-handling?view=aspnetcore-2.1)
- built-in features for handling errors in apps, including a
	- developer exception page
	- custom error pages
	- static status code pages
	- startup exception handling
- app.UseDeveloperExceptionPage()
- app.UseExceptionHandler("/error")
- app.UseStatusCodePages()
- app.UseStatusCodePagesWithRedirects("/error/{0}")
- IHostingEnvironment exposes the app's content root and web root as IFileProvider types.
- Static Files Middleware uses File Providers to locate static files.
- read from the file using the IFileInfo.CreateReadStream method.


## File Providers
see [File Providers](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/file-providers?view=aspnetcore-2.1)
- abstracts file system access through the use of File Providers,
- a common interface for working with files across platforms.

### PhysicalFileProvider
- provides access to the physical file system.
- PhysicalFileProvider uses the System.IO.File type
- scopes all paths to a directory and its children
- The IFileProvider.Watch method provides a scenario to watch one or more files or directories for changes.
- Watch accepts a path string, which can use glob patterns to specify multiple files.
- Watch returns an IChangeToken.

### Static files
see [Static files](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/static-files?view=aspnetcore-2.1)
- Static files middleware serves static files, such as HTML, CSS, image, and JavaScript.
- *Microsoft.AspNetCore.All* metapackage includes this package

- **Content root**
	- The content root is the base path to any content used by the app, such as views, Razor Pages, and static assets.
	- By default, the content root is the same as application base path for the executable hosting the app.

- **Web root**
	- The web root of an app is the directory in the project containing public, static resources, such as CSS, JavaScript, and image files.

- Invoke the UseStaticFiles method within Startup.Configure
- Serve files inside of web root `app.UseStaticFiles();`
- Serve files outside of web root
	```cs
	public void Configure(IApplicationBuilder app)
	{
	    app.UseStaticFiles(); // For the wwwroot folder

	    app.UseStaticFiles(new StaticFileOptions
	    {
	        FileProvider = new PhysicalFileProvider(
	            Path.Combine(Directory.GetCurrentDirectory(), "MyStaticFiles")),
	        RequestPath = "/StaticFiles"
	    });
	}
	```
- Set HTTP response headers
	- A StaticFileOptions object can be used to set HTTP response headers.
	```cs
	public void Configure(IApplicationBuilder app, IHostingEnvironment env)
	{
	    var cachePeriod = env.IsDevelopment() ? "600" : "604800";
	    app.UseStaticFiles(new StaticFileOptions
	    {
	        OnPrepareResponse = ctx =>
	        {
	            // Requires the following import:
	            // using Microsoft.AspNetCore.Http;
	            ctx.Context.Response.Headers.Append("Cache-Control", $"public, max-age={cachePeriod}");
	        }
	    });
	}
	```
- Serve a default document `app.UseDefaultFiles();`

### UseFileServer
- UseFileServer combines the functionality of UseStaticFiles, UseDefaultFiles, and UseDirectoryBrowser.
	```cs
	public void Configure(IApplicationBuilder app)
	{
	    app.UseStaticFiles(); // For the wwwroot folder

	    app.UseFileServer(new FileServerOptions
	    {
	        FileProvider = new PhysicalFileProvider(
	            Path.Combine(Directory.GetCurrentDirectory(), "MyStaticFiles")),
	        RequestPath = "/StaticFiles",
	        EnableDirectoryBrowsing = false
	    });
	}
	```

### FileExtensionContentTypeProvider
- The FileExtensionContentTypeProvider class contains a Mappings property serving as a mapping of file extensions to MIME content types.
	```cs
	public void Configure(IApplicationBuilder app)
	{
	    // Set up custom content types - associating file extension to MIME type
	    var provider = new FileExtensionContentTypeProvider();
	    // Add new mappings
	    provider.Mappings[".myapp"] = "application/x-msdownload";
	    provider.Mappings[".htm3"] = "text/html";
	    provider.Mappings[".image"] = "image/png";
	    // Replace an existing mapping
	    provider.Mappings[".rtf"] = "application/x-msdownload";
	    // Remove MP4 videos.
	    provider.Mappings.Remove(".mp4");
	    // sak - for cert tag
	    provider.Mappings[".cert"] = "text/plain";

	    app.UseStaticFiles(new StaticFileOptions
	    {
	        FileProvider = new PhysicalFileProvider(
	            Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images")),
	        RequestPath = "/MyImages",
	        ContentTypeProvider = provider
	    });
	}
	```

## Hosting
see [Host in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/host/index?view=aspnetcore-2.1)
- ASP.NET Core apps configure and launch a host, which is responsible for app startup and lifetime management.

### Set up a host
- CreateDefaultBuilder performs the following tasks:
	- Configures Kestrel as the web server and configures the server using the app's hosting configuration providers. For the Kestrel default options, see Kestrel web server implementation in ASP.NET Core.
	- Sets the content root to the path returned by Directory.GetCurrentDirectory.
	- Loads host configuration from:
		- Environment variables prefixed with ASPNETCORE_ (for example, ASPNETCORE_ENVIRONMENT).
		- Command-line arguments.
		- Loads app configuration from:
		- appsettings.json.
		- appsettings.{Environment}.json.
		- User secrets when the app runs in the Development environment using the entry assembly.
		- Environment variables.
		- Command-line arguments.
	- Configures logging for console and debug output. Logging includes log filtering rules specified in a Logging configuration section of an appsettings.json or appsettings.{Environment}.json file.
	- When running behind IIS, enables IIS integration. Configures the base path and port the server listens on when using the ASP.NET Core Module. The module creates a reverse proxy between IIS and Kestrel. Also configures the app to capture startup errors. For the IIS default options, see Host ASP.NET Core on Windows with IIS.
	- Sets ServiceProviderOptions.ValidateScopes to true if the app's environment is Development. For more information, see Scope validation.

- Host configuration values - WebHostBuilder relies on the following approaches to set the host configuration values
- The host uses whichever option sets a value last.

### Host configuration values
> TBD
> see also
> [IConfigurationBuilder Extension Methods](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfigurationbuilder?view=aspnetcore-2.1#extension-methods)
> [IWebHostBuilder Extension Methods](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.hosting.iwebhostbuilder?view=aspnetcore-2.1#extension-methods)
- WebHostBuilder Methods
	- UseSetting
	- CaptureStartupErrors
	- UseContentRoot
	- UseSetting
	- UseEnvironment
	- UseShutdownTimeout
	- UseWebRoot

### Override configuration
- Use Configuration to configure the web host.
- In the following example, host configuration is optionally specified in a hostsettings.json file.
- Any configuration loaded from the hostsettings.json file may be overridden by command-line arguments.
	```cs
	public class Program
	{
		public static void Main(string[] args)
		{
			CreateWebHostBuilder(args).Build().Run();
		}

		public static IWebHostBuilder CreateWebHostBuilder(string[] args)
		{
			var config = new ConfigurationBuilder()
				.SetBasePath(Directory.GetCurrentDirectory())
				.AddJsonFile("hostsettings.json", optional: true)
				.AddCommandLine(args)
				.Build();

			return WebHost.CreateDefaultBuilder(args)
				.UseUrls("http://*:5000")
				.UseConfiguration(config)
				.Configure(app =>
				{
					app.Run(context =>
					context.Response.WriteAsync("Hello, World!"));
				})
				.Build();
		}
	}
	```
- hostsettings.json
	```json
	{
	urls: "http://*:5005"
	}
	```


### Manage the host
- **Run()**
	- The Run method starts the web app and blocks the calling thread until the host is shut down:
- **Start()**
	- Run the host in a non-blocking manner by calling its Start method:

### IHostingEnvironment interface
- The IHostingEnvironment interface provides information about the app's web hosting environment.
- Use constructor injection to obtain the IHostingEnvironment in order to use its properties and extension methods:
- extension method that IHostingEnvironment offers
	- IsDevelopment
	- IsStaging
	- IsProduction
	- IsEnvironment(string environmentName)
- The IHostingEnvironment service can also be injected directly into the Configure method for setting up the processing pipeline:
	```cs
	public void Configure(IApplicationBuilder app, IHostingEnvironment env)
	{
	    if (env.IsDevelopment())
	    {
	        // In Development, use the developer exception page
	        app.UseDeveloperExceptionPage();
	    }
	    else
	    {
	        // In Staging/Production, route exceptions to /error
	        app.UseExceptionHandler("/error");
	    }

	    var contentRootPath = env.ContentRootPath;
	}
	```

### IApplicationLifetime interface
- IApplicationLifetime allows for post-startup and shutdown activities.
- `StopApplication()` requests termination of the app.
- Three properties on the interface are cancellation tokens used to register Action methods that define startup and shutdown events.
	```cs
	public class Startup
	{
	    public void Configure(IApplicationBuilder app, IApplicationLifetime appLifetime)
	    {
	        appLifetime.ApplicationStarted.Register(OnStarted);
	        appLifetime.ApplicationStopping.Register(OnStopping);
	        appLifetime.ApplicationStopped.Register(OnStopped);

	        Console.CancelKeyPress += (sender, eventArgs) =>
	        {
	            appLifetime.StopApplication();
	            // Don't terminate the process immediately, wait for the Main thread to exit gracefully.
	            eventArgs.Cancel = true;
	        };
	    }

	    private void OnStarted()
	    {
			// The host has fully started.
	        // Perform post-startup activities here
	    }

	    private void OnStopping()
	    {
			// The host is completing a graceful shutdown.
			// All requests should be processed.
			// Shutdown blocks until this event completes.
	        // Perform on-stopping activities here
	    }

	    private void OnStopped()
	    {
			// The host is performing a graceful shutdown.
			// Requests may still be processing.
			// Shutdown blocks until this event completes.
	        // Perform post-stopped activities here
	    }
	}
	```




> ******************************************************************************
> Done till here
> ******************************************************************************




## Session and app state
see [Session and app state](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/app-state?view=aspnetcore-2.1)
- ASP.NET Core offers several approaches to preserve session and app state while the user browses a web app

## Request Features
see [Request Features](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/request-features?view=aspnetcore-2.1)
- Web server implementation details related to HTTP requests and responses are defined in interfaces.
- These interfaces are used by server implementations and middleware
- to create and modify the app's hosting pipeline.

## Background tasks
see [Background tasks with hosted services](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/host/hosted-services?view=aspnetcore-2.1)
- Background tasks are implemented as hosted services.
- A hosted service is a class with background task logic that implements the IHostedService interface

## Access HttpContext
see [Access HttpContext in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/owin?view=aspnetcore-2.1)
- Access the HttpContext through the IHttpContextAccessor interface
- and its default implementation HttpContextAccessor

## Open Web Interface for .NET (OWIN)
[see Open Web Interface for .NET (OWIN)](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/owin?view=aspnetcore-2.1)
- ASP.NET Core supports the Open Web Interface for .NET (OWIN)
- OWIN allows web apps to be decoupled from web servers
