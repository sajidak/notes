# Tutorials - Introduction to ASP.NET Core MVC

[TOC]

## Create an ASP.NET Core MVC app with Visual Studio Code
> https://docs.microsoft.com/en-us/aspnet/core/tutorials/first-mvc-app-xplat/start-mvc?view=aspnetcore-2.1

### Create web app
```sh
mkdir MvcMovie
cd MvcMovie
dotnet new mvc
code MvcMovie
```

- The MvcMovie folder opens in Visual Studio Code (VS Code).
	- Select the Startup.cs file.
    - Select **Yes** to the Warn message "Required assets to build and debug are missing from 'TodoApi'. Add them?"
    - Select **Restore** to the Info message "There are unresolved dependencies".


### Output
- Information on configuring HTTPS see
	- https://go.microsoft.com/fwlink/?linkid=848054

- Inspect these files
	```
	Restoring packages for /70_Current/Work/RamzanV2/r2.act/r2.act.csproj...
	Generating MSBuild file /70_Current/Work/RamzanV2/r2.act/obj/r2.act.csproj.nuget.g.props.
	Generating MSBuild file /70_Current/Work/RamzanV2/r2.act/obj/r2.act.csproj.nuget.g.targets.
	Restore completed in 620.09 ms for /70_Current/Work/RamzanV2/r2.act/r2.act.csproj.
	```

- Full raw output
```
Welcome to .NET Core!
---------------------
Learn more about .NET Core: https://aka.ms/dotnet-docs
Use 'dotnet --help' to see available commands or visit: https://aka.ms/dotnet-cli-docs

Telemetry
---------
The .NET Core tools collect usage data in order to help us improve your experience. The data is anonymous and doesn't include command-line arguments. The data is collected by Microsoft and shared with the community. You can opt-out of telemetry by setting the DOTNET_CLI_TELEMETRY_OPTOUT environment variable to '1' or 'true' using your favorite shell.

Read more about .NET Core CLI Tools telemetry: https://aka.ms/dotnet-cli-telemetry

Configuring...
--------------
A command is running to populate your local package cache to improve restore speed and enable offline access. This command takes up to one minute to complete and only runs once.
Decompressing 100% 6693 ms
Expanding 100% 8464 ms

ASP.NET Core
------------
Successfully installed the ASP.NET Core HTTPS Development Certificate.
To trust the certificate run 'dotnet dev-certs https --trust' (Windows and macOS only). For establishing trust on other platforms refer to the platform specific documentation.
For more information on configuring HTTPS see https://go.microsoft.com/fwlink/?linkid=848054.
Getting ready...
The template "ASP.NET Core Web App (Model-View-Controller)" was created successfully.
This template contains technologies from parties other than Microsoft, see https://aka.ms/aspnetcore-template-3pn-210 for details.

Processing post-creation actions...
Running 'dotnet restore' on /70_Current/Work/RamzanV2/r2.act/r2.act.csproj...
  Restoring packages for /70_Current/Work/RamzanV2/r2.act/r2.act.csproj...
  Generating MSBuild file /70_Current/Work/RamzanV2/r2.act/obj/r2.act.csproj.nuget.g.props.
  Generating MSBuild file /70_Current/Work/RamzanV2/r2.act/obj/r2.act.csproj.nuget.g.targets.
  Restore completed in 620.09 ms for /70_Current/Work/RamzanV2/r2.act/r2.act.csproj.

Restore succeeded.

```


## Create a Web API with ASP.NET Core and Visual Studio Code
> https://docs.microsoft.com/en-us/aspnet/core/tutorials/web-api-vsc?view=aspnetcore-2.1


### Create web app
```sh
mkdir TodoApi
cd TodoApi
dotnet new webapi -o TodoApi
code TodoApi
```

- The TodoApi folder opens in Visual Studio Code (VS Code).
	- Select the Startup.cs file.
    - Select **Yes** to the Warn message "Required assets to build and debug are missing from 'TodoApi'. Add them?"
    - Select **Restore** to the Info message "There are unresolved dependencies".
