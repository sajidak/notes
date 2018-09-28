# ASP.NET Core Notes

| Key | Section       | Link                                                   |
| --- | ------------- | ------------------------------------------------------ |
| 100 | Fundamentals  | https://docs.microsoft.com/aspnet/core/fundamentals/   |
| 110 | Cookie Auth  |    |
| 200 | ASP.NET Intro | https://docs.microsoft.com/aspnet/core/                |
| 300 | MVC Overview  | https://docs.microsoft.com/aspnet/core/mvc/overview    |
| 400 | Sample App    | https://docs.microsoft.com/aspnet/core/getting-started |
|     |               |                                                        |

## Items of Interest
- SetBasePath
- https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.fileconfigurationextensions.setbasepath
- Bind
- https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.configurationbinder.bind
- WebHost.CreateDefaultBuilder(args).CaptureStartupErrors(true)
- WebHost.CreateDefaultBuilder(args).UseSetting(WebHostDefaults.DetailedErrorsKey, "true")
- [Background tasks](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/host/hosted-services?view=aspnetcore-2.1)
- [Custom storage providers for ASP.NET Core Identity](https://docs.microsoft.com/en-us/aspnet/core/security/authentication/identity-custom-storage-providers?view=aspnetcore-2.1)
	- How to create a customized storage provider for ASP.NET Core Identity
	- Covers the important concepts for creating your own storage provider
	
	
## Notes

### Community Standup:
http://live.asp.net/

The community standup is held every week and streamed live to YouTube.
You can view past standups in the linked playlist.

### Roadmap:
https://github.com/aspnet/Home/wiki/Roadmap

The schedule and milestone themes for ASP.NET Core.

### https://www.asp.net/
- https://www.asp.net/community/articles
- https://www.c-sharpcorner.com/article/overview-of-identity-in-asp-net-core-2-0/
