# Buffer Notes to be organized

[TOC]

## Links
- ASP.NET Core Razor Pages in Visual Studio Code
	- https://docs.microsoft.com/en-us/aspnet/core/tutorials/razor-pages-vsc/razor-pages-start?view=aspnetcore-2.1
	- Razor Pages is the recommended way to build UI for web applications in ASP.NET Core.
- ASP.NET Core MVC app with Visual Studio Code
	- https://docs.microsoft.com/en-us/aspnet/core/tutorials/first-mvc-app-xplat/?view=aspnetcore-2.1
- Web API with ASP.NET Core and Visual Studio Code
	- https://docs.microsoft.com/en-us/aspnet/core/tutorials/web-api-vsc?view=aspnetcore-2.1


## Notes
- Use multiple environments
	-  https://docs.microsoft.com/en-us/aspnet/core/fundamentals/environments?view=aspnetcore-2.1#environment-based-startup-class-and-methods
	- https://docs.microsoft.com/en-us/aspnet/core/fundamentals/environments?view=aspnetcore-2.1
	- reads the environment variable ASPNETCORE_ENVIRONMENT at app startup and stores the value in IHostingEnvironment.EnvironmentName
	- Defaults are Development, Staging, and Production
	- Not set defaults to Production
	- `<p> ASPNETCORE_ENVIRONMENT = @hostingEnv.EnvironmentName</p>`
	- environmentVariables settings in launchSettings.json override environment variables
***

- app.UseFileServer();
	- combines the functionality of UseStaticFiles, UseDefaultFiles, and UseDirectoryBrowser
***

- The developer exception page
	```c
	public void Configure(IApplicationBuilder app, IHostingEnvironment env)
	{
	    env.EnvironmentName = EnvironmentName.Production;

	    if (env.IsDevelopment())
	    {
	        app.UseDeveloperExceptionPage();
	    }
	    else
	    {
	        app.UseExceptionHandler("/error");
	    }
	```
***

- In a Razor Pages app, the dotnet new Razor Pages template provides an Error page and ErrorModel page model class in the Pages folder
***

- Startup exception handling
	- Using the Web Host, you can configure how the host behaves in response to errors during startup with the captureStartupErrors and detailedErrors keys
***

- File Provider implementations
	| Implementation               | Description                                                                                                          |
	| ---------------------------- | -------------------------------------------------------------------------------------------------------------------- |
	| PhysicalFileProvider         | The physical provider is used to access the system's physical files.                                                 |
	| ManifestEmbeddedFileProvider | The manifest embedded provider is used to access files embedded in assemblies.                                       |
	| CompositeFileProvider        | The composite provider is used to provide combined access to files and directories from one or more other providers. |
***

- Microsoft.AspNetCore.App metapackage for ASP.NET Core 2.1
	- Does not include third-party dependencies except for 
		- [Json.NET](https://www.nuget.org/packages/Newtonsoft.Json/)
		- [Remotion.Linq](https://www.nuget.org/packages/Remotion.Linq/)
		- [IX-Async](https://www.nuget.org/packages/System.Interactive.Async/)
	```xml
	<Project Sdk="Microsoft.NET.Sdk.Web">
		<PropertyGroup>
			<TargetFramework>netcoreapp2.1</TargetFramework>
		</PropertyGroup>
		<ItemGroup>
			<PackageReference 
				Include="Microsoft.AspNetCore.App" 
				Version="2.1.1" 
				/>
		</ItemGroup>
	</Project>
	```

### Model Binding
- Customize model binding behavior with attributes
	- [BindRequired]: This attribute adds a model state error if binding cannot occur.
	- [BindNever]: Tells the model binder to never bind to this parameter.
	- [FromHeader], [FromQuery], [FromRoute], [FromForm]: Use these to specify the exact binding source you want to apply.
	- [FromServices]: This attribute uses dependency injection to bind parameters from services.
	- [FromBody]: Use the configured formatters to bind data from the request body. The formatter is selected based on content type of the request.
	- [ModelBinder]: Used to override the default model binder, binding source and name.

### Attribute routing
- Attribute routing uses a set of attributes to map actions directly to route templates.
- with Http[Verb] attributes
- Route Name
- Multiple Routes
- optional parameters, default values, and constraints
- URL Generation
- Generating URLs by action name
***


> Last Read:
> https://docs.microsoft.com/en-us/aspnet/core/security/anti-request-forgery?view=aspnetcore-2.1
