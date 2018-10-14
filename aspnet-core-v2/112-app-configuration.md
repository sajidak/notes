# Configuration
> https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-2.1

## Links
- https://docs.microsoft.com/en-us/aspnet/core/fundamentals/host/web-host?view=aspnetcore-2.1#set-up-a-host

## features
- Setting the base path of the app with SetBasePath. SetBasePath is made available to an app by referencing the Microsoft.Extensions.Configuration.FileExtensions package.
- Resolving sections of configuration files with GetSection. GetSection is made available to an app by referencing the Microsoft.Extensions.Configuration package.
- Binding configuration to .NET classes with Bind and `Get<T>`. Bind and `Get<T>` are made available to an app by referencing the Microsoft.Extensions.Configuration.Binder package. `Get<T>` is available in ASP.NET Core 1.1 or later.
- These three packages are included in the Microsoft.AspNetCore.App metapackage.
- Host vs. app configuration
	- Before the app is configured and started, a host is configured and launched.

- Hierarchical configuration data
	- sections and keys are flattened with the use of a colon (`:`) to maintain the original structure
- At app startup, configuration sources are read in the order that their configuration providers are specified.
	- File Configuration Providers have the ability to reload configuration when an underlying settings file is changed
	- Keys are case-insensitive.
	- last value set on the key is the value used
	- Values are strings.
	- Null values can't be stored in configuration or bound to objects.
- e.g.
	```cs
	public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
		WebHost.CreateDefaultBuilder(args)
			.ConfigureAppConfiguration((hostingContext, config) =>
			{
				config.SetBasePath(Directory.GetCurrentDirectory());
				config.AddInMemoryCollection(arrayDict);
				config.AddJsonFile("json_array.json", optional: false, reloadOnChange: false);
				config.AddJsonFile("starship.json", optional: false, reloadOnChange: false);
				config.AddXmlFile("tvshow.xml", optional: false, reloadOnChange: false);
				config.AddEFConfiguration(options => options.UseInMemoryDatabase("InMemoryDb"));
				config.AddCommandLine(args);
			})
			.UseStartup<Startup>();
	}
	```

## File Configuration Provider
- FileConfigurationProvider is the base class for loading configuration from the file system. The following configuration providers are dedicated to specific file types:
    - INI Configuration Provider
    - JSON Configuration Provider
    - XML Configuration Provider

### JSON Configuration Provider
- AddJsonFile is automatically called twice when you initialize a new WebHostBuilder with CreateDefaultBuilder. The method is called to load configuration from:
	- `appsettings.json` – This file is read first. The environment version of the file can override the values provided by the appsettings.json file.
	- `appsettings.<Environment>.json` – The environment version of the file is loaded based on the IHostingEnvironment.EnvironmentName.
- e.g.
	```cs
	public static IWebHostBuilder CreateWebHostBuilder(string[] args)
	{
	    var config = new ConfigurationBuilder()
	        .SetBasePath(Directory.GetCurrentDirectory())
	        .AddJsonFile("config.json", optional: true, reloadOnChange: true)
	        .Build();

	    return WebHost.CreateDefaultBuilder(args)
	        .UseConfiguration(config)
	        .UseStartup<Startup>();
	}
	```

## Key-per-file Configuration Provider
- The KeyPerFileConfigurationProvider uses a directory's files as configuration key-value pairs. The key is the file name. The value contains the file's contents.
- The Key-per-file Configuration Provider is used in Docker hosting scenarios.
- To activate key-per-file configuration, call the AddKeyPerFile extension method on an instance of ConfigurationBuilder.
- The directoryPath to the files must be an absolute path.
- e.g.
```cs
public static IWebHostBuilder CreateWebHostBuilder(string[] args)
{
    var path = Path.Combine(Directory.GetCurrentDirectory(), "path/to/files");
    var config = new ConfigurationBuilder()
        .AddKeyPerFile(directoryPath: path, optional: true)
        .Build();

    return WebHost.CreateDefaultBuilder(args)
        .UseConfiguration(config)
        .UseStartup<Startup>();
}
```


# Usage
## GetValue
- `ConfigurationBinder.GetValue<T>` extracts a value from configuration with a specified key and converts it to the specified type.
- An overload permits you to provide a default value if the key isn't found.
- `var intValue = config.GetValue<int>("NumberKey", 99);`

## GetSection
- `IConfiguration.GetSection` extracts a configuration subsection with the specified subsection key.
- GetSection never returns null. If a matching section isn't found, an empty IConfigurationSection is returned.
- e.g.
	```cs
	var configSection = _config.GetSection("section1");
	var configSection = _config.GetSection("section2:subsection0");
	```

## GetChildren
- A call to IConfiguration.GetChildren on section2 obtains an `IEnumerable<IConfigurationSection>`
	```cs
	var configSection = _config.GetSection("section2");
	var children = configSection.GetChildren();
	```

## Exists
- Use ConfigurationExtensions.Exists to determine if a configuration section exists
- `var sectionExists = _config.GetSection("section2:subsection2").Exists();`

## Bind to an object graph
- Bind is capable of binding an entire POCO object graph.
-
