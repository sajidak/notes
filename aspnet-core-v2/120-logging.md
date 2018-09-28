---
title: ASP.NET Core 2.1 logging

subject:
- ASP.NET Core 2.1 logging
- Builtin and Third party

subtitle:
- https://docs.microsoft.com/en-us/aspnet/core/fundamentals/logging/index?view=aspnetcore-2.1

author:
- sak

date: 2018 Aug 24
...

# Buffer

## Debug provider
- The Microsoft.Extensions.Logging.Debug provider package writes log output by using the System.Diagnostics.Debug class (Debug.WriteLine method calls).
- On Linux, this provider writes logs to /var/log/message.

## Third-party logging providers - NLog
- [NLog](http://nlog-project.org/)
- [NLog GitHub repo](https://github.com/NLog/NLog.Extensions.Logging)
- ASP.NET Core users should install NLog.Web.AspNetCore
	- https://www.nuget.org/packages/NLog.web.aspnetcore
	- `dotnet add package NLog.Web.AspNetCore --version 4.6.0`
- https://github.com/NLog/NLog.Web/wiki/Getting-started-with-ASP.NET-Core-2



## High-performance logging with LoggerMessage in ASP.NET Core
> https://docs.microsoft.com/en-us/aspnet/core/fundamentals/logging/loggermessage?view=aspnetcore-2.1

- LoggerMessage features create cacheable delegates that require fewer object allocations and reduced computational overhead compared to logger extension methods, such as LogInformation, LogDebug, and LogError. For high-performance logging scenarios, use the LoggerMessage pattern.
- LoggerMessage provides the following performance advantages over Logger extension methods:
- Logger extension methods require "boxing" (converting) value types, such as int, into object. The LoggerMessage pattern avoids boxing by using static Action fields and extension methods with strongly-typed parameters.
- Logger extension methods must parse the message template (named format string) every time a log message is written. LoggerMessage only requires parsing a template once when the message is defined.

## 
- `TelemetryDebugWriter.IsTracingDisabled = true;`
- 
