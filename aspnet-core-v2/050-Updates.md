# [aspnet/Announcements] Announcements

## #287 Microsoft.AspNetCore.App metapackage
> Friday 10 August 2018
- https://github.com/aspnet/Announcements/issues/287
- The existing Microsoft.AspNetCore.All meta-package will continue to be made available throughout the 2.x lifecycle,
- but we recommend customers move to the new Microsoft.AspNetCore.App meta-package
- and then add individual references to any of the removed packages if their app requires it.
- Questions or comments at [aspnet/Home#3418](https://github.com/aspnet/Home/issues/3418)

## To Read
- ASP.NET Core 2.2 Roadmap [#307](https://github.com/aspnet/Announcements/issues/307)

```
The ServiceProviderServiceExtensions class in the Microsoft.Extensions.DependencyInjection.Abstractions library implements the generic version of both GetService<T>() and GetRequiredService<T>()

provided in Microsoft.Extensions.DependencyInjection

var provider = HttpContext.ApplicationServices;
var someService = provider.GetService(typeof(ISomeService));

    [FromServices]
    public IAmACustomService CustomService { get; set; }


```

## Introduction to ASP.NET Core MVC
- Tutorial
	- https://docs.microsoft.com/en-us/aspnet/core/tutorials/first-mvc-app-xplat/start-mvc?view=aspnetcore-2.1
