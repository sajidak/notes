# .NET Core command-line interface (CLI) tools
> https://aka.ms/dotnet-cli-docs


## Links
- .NET Core additional tools
	- https://docs.microsoft.com/en-us/dotnet/core/additional-tools/

## Run Appln from terminal
- https://docs.microsoft.com/en-us/aspnet/core/fundamentals/host/web-host?view=aspnetcore-2.2
	```
	dotnet run --urls "http://*:8080"
	dotnet <yours>.dll --urls="http://localhost:5001,https://localhost:5002"
	```

- Override configuration
	- https://docs.microsoft.com/en-us/aspnet/core/fundamentals/host/web-host?view=aspnetcore-2.2#override-configuration
	- hostsettings.json
	- host.Start()

- https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-run?tabs=netcore20
- Syntax
```sh
dotnet run [-c|--configuration] [-f|--framework] [--force] [--launch-profile] [--no-build] [--no-dependencies]
    [--no-launch-profile] [--no-restore] [-p|--project] [--runtime] [[--] [application arguments]]

	-c|--configuration {Debug|Release}

```

## appsettings.json
- https://github.com/aspnet/Hosting/blob/master/src/Microsoft.AspNetCore.Hosting.Abstractions/WebHostDefaults.cs
