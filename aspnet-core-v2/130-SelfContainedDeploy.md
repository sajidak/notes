---
	title: ASP.NET Core 2.1 SCD 

	subject:
	- ASP.NET Core 2.1 (SCD) 
	- Self-Contained Deployments

	subtitle:
	- https://docs.microsoft.com/en-us/dotnet/core/deploying/index
	- deploy your app and any required third-party dependencies along with the version of .NET Core

	author:
	- sak

	date: 2018 Aug 24
...

# .NET Core application deployment
> https://docs.microsoft.com/en-us/dotnet/core/deploying/index

- Two types of deployments for .NET Core applications
	- Framework-dependent deployment. As the name implies, framework-dependent deployment (FDD) relies on the presence of a shared system-wide version of .NET Core on the target system. Because .NET Core is already present, your app is also portable between installations of .NET Core. Your app contains only its own code and any third-party dependencies that are outside of the .NET Core libraries. FDDs contain .dll files that can be launched by using the dotnet utility from the command line. For example, dotnet app.dll runs an application named app.
	- Self-contained deployment. Unlike FDD, a self-contained deployment (SCD) doesn't rely on the presence of shared components on the target system. All components, including both the .NET Core libraries and the .NET Core runtime, are included with the application and are isolated from other .NET Core applications. SCDs include an executable (such as app.exe on Windows platforms for an application named app), which is a renamed version of the platform-specific .NET Core host, and a .dll file (such as app.dll), which is the actual application.


# .NET Core version selection
> https://docs.microsoft.com/en-us/dotnet/core/versions/selection

# Deploying .NET Core apps with Visual Studio
> https://docs.microsoft.com/en-us/dotnet/core/deploying/deploy-with-vs

# Deploying .NET Core Apps with CLI Tools.
> https://docs.microsoft.com/en-us/dotnet/core/deploying/deploy-with-cli

# Runtime package store
> https://docs.microsoft.com/en-us/dotnet/core/deploying/runtime-store

# Notes - To organize
- Create a `<RuntimeIdentifiers>` tag in the `<PropertyGroup>` section of your csproj file
```xml
<PropertyGroup>
    <RuntimeIdentifiers>win10-x64;osx.10.11-x64</RuntimeIdentifiers>
</PropertyGroup>
```
- Add references to any third-party libraries to the `<ItemGroup>` section of your csproj file. 
```xml
<ItemGroup>
  <PackageReference Include="Newtonsoft.Json" Version="10.0.2" />
</ItemGroup>
```

