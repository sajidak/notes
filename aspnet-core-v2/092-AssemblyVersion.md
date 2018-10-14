# AssemblyVersion, FileVersion and Version

## Sample
> https://edi.wang/post/2018/9/27/get-app-version-net-core

```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>netcoreapp2.1</TargetFramework>
    <AssemblyVersion>1.1.1.1</AssemblyVersion>
    <FileVersion>2.2.2.2</FileVersion>
    <Version>3.3.3.3-xyz</Version>
  </PropertyGroup>
</Project>
```

1. AssemblyVersion
	```cs
	class Foo
	{
	    public static string GetAssemblyVersion()
	    {
	        return GetType().Assembly.GetName().Version.ToString();
	    }
	}

	// OR
	Assembly.GetEntryAssembly().GetName().Version
	```
	- Both of these two methods will return 1.1.1.1

2. FileVersion
	`Assembly.GetEntryAssembly().GetCustomAttribute<AssemblyFileVersionAttribute>().Version`
	- will return 2.2.2.2
3. Version
	`Assembly.GetEntryAssembly().GetCustomAttribute<AssemblyInformationalVersionAttribute>().InformationalVersion`
	- will return 3.3.3.3
