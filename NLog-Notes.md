
## TODO:
1. get details from `NLog-?-*.mht` files

## Installation:
- install NLog.Config package and this will install also NLog and NLog.Schema packages
	- this will result in a starter config and intellisense.

## Configuration:
NLog.config
- In the `<targets>` section, add:
`<target name="logfile" xsi:type="File" fileName="file.txt" />`
- In the `<rules>` section, add:
`<logger name="*" minlevel="Info" writeTo="logfile" />`




## Layout renderers
### NLog.Web
`https://nlog-project.org/config/?tab=layout-renderers`

- `${cached}` - Applies caching to another layout output.
- `${exception}` - Exception information provided through a call to one of the Logger methods
- `${level}` - The log level (e.g. ERROR, DEBUG) or level ordinal (number)
- `${literal}` - A string literal. (text) - useful to escape brackets
- `${logger}` - The logger name. GetLogger, GetCurrentClassLogger etc
- `${message}` - The (formatted) log message.
- `${newline}` - A newline literal.
- `${onexception}` - Only outputs the inner layout when exception has been defined for log message.
- `${var}` - Render variable

- Callsite and stacktraces
	- `${callsite}` - The call site (class name, method name and source information)
	- `${callsite-linenumber}` - The call site source line number.
	- `${stacktrace}` - Render the Stack trace

- Conditions
	- `${when}` - Only outputs the inner layout when the specified condition has been met.
	- `${whenempty}` - Outputs alternative layout when the inner layout produces empty result.

- Context information
	- `${all-event-properties}` - Log all event context data.
	- `${event-context}` - Log event properties data - replaced with - `${event-properties}
	- `${event-properties}` - Log event properties data - rename of - `${event-context}
	- `${gdc}` - Global Diagnostic Context item. Dictionary structure to hold per-application-instance values.
	- `${install-context}` - Installation parameter (passed to InstallNLogConfig).
	- `${mdc}` - Mapped Diagnostics Context - a thread-local structure.
	- `${mdlc}` - Async Mapped Diagnostics Context - a thread-local structure. Async version of the MDC
	- `${ndc}` - Nested Diagnostics Context - a thread-local structure.
	- `${ndlc}` - Async Nested Diagnostics Context - thread-local structure.

- Counters
	- `${counter}` - A counter value (increases on each layout rendering)
	- `${guid}` - Globally-unique identifier(GUID).
	- `${sequenceid}` - The log sequence id

- Date and time
	- `${date}` - Current date and time.
	- `${longdate}` - The date and time in a long, sortable format `yyyy-MM-dd HH:mm:ss.ffff`.
	- `${shortdate}` - The short date in a sortable format yyyy-MM-dd.
	- `${ticks}` - The Ticks value of current date and time.
	- `${time}` - The time in a 24-hour, sortable format HH:mm:ss.mmm.

- Encoding and string transformations
	- `${wrapline}` - Wraps the result of another layout output at specified line length.
	- `${json-encode}` - Escapes output of another layout using JSON rules.
	- `${lowercase}` - Converts the result of another layout output to lower case.
	- `${pad}` - Applies padding to another layout output.
	- `${replace}` - Replaces a string in the output of another layout with another string. Optional with regex
	- `${replace-newlines}` - Replaces newline characters with another string.
	- `${rot13}` - Decodes text "encrypted"with ROT-13.
	- `${trim-whitespace}` - Trims the whitespace from the result of another layout renderer.
	- `${uppercase}` - Converts the result of another layout output to upper case.
	- `${url-encode}` - Encodes the result of another layout output for use with URLs.
	- `${xml}` - Converts to fixed XML format NLog.XML External
	- `${xml-encode}` - Converts the result of another layout output to be XML-compliant.

- Environment and config files
	- `${appsetting}` - App config setting from .config file NLog.Extended
	- `${configsetting}` - Value from the appsettings.json or other configuration in ASP.NET Core & .NET Core NLog.Extensions.LoggingNLog.Web.AspNetCore
	- `${environment}` - The environment variable. (e.g PATH, OSVersion)
	- `${gc}` - The information about the garbage collector.

- Files and directories
	- `${basedir}` - The current application domain's base directory.
	- `${currentdir}` - The current working directory of the application.
	- `${file-contents}` - Renders contents of the specified file.
	- `${filesystem-normalize}` - Filters characters not allowed in the file names by replacing them with safe character.
	- `${nlogdir}` - The directory where NLog.dll is located.
	- `${specialfolder}` - System special folder path (includes My Documents, My Music, Program Files, Desktop, and more).
	- `${tempdir}` - A temporary directory.

- Identity
	- `${identity}` - Thread identity information (name and authentication information).
	- `${windows-identity}` - Thread Windows identity information (username)

- Integrations
	- `${gelf}` - Converts log to GELF format NLog.GelfLayout External
	- `${log4jxmlevent}` - XML event description compatible with log4j, Chainsaw and NLogViewer.

- Processes, threads and assemblies
	- `${appdomain}` - Current app domain.
	- `${assembly-version}` - The version of the executable in the default application domain.
	- `${machinename}` - The machine name that the process is running on.
	- `${processid}` - The identifier of the current process.
	- `${processinfo}` - The information about the running process. e.g. StartTime, PagedMemorySize
	- `${processname}` - The name of the current process.
	- `${processtime}` - The process time in format HH:mm:ss.mmm.
	- `${threadid}` - The identifier of the current thread.
	- `${threadname}` - The name of the current thread.

- Trace and debugging
	- `${activityid}` - Puts into log a System.Diagnostics trace correlation id.

- Web, ASP.NET and ASP.NET Core
	- `${aspnet-application}` - ASP.NET Application variable. NLog.Web
	- `${aspnet-item}` - ASP.NET `HttpContext` item variable. NLog.WebNLog.Web.AspNetCore
	- `${aspnet-mvc-action}` - ASP.NET MVC action name NLog.WebNLog.Web.AspNetCore
	- `${aspnet-mvc-controller}` - ASP.NET MVC controller name NLog.WebNLog.Web.AspNetCore
	- `${aspnet-request}` - ASP.NET Request variable. NLog.WebNLog.Web.AspNetCore
	- `${aspnet-request-cookie}` - ASP.NET Request cookie content. NLog.WebNLog.Web.AspNetCore
	- `${aspnet-request-form}` - ASP.NET Request form content. NLog.WebNLog.Web.AspNetCore
	- `${aspnet-request-host}` - ASP.NET Request host. NLog.WebNLog.Web.AspNetCore
	- `${aspnet-request-ip}` - Client IP. NLog.WebNLog.Web.AspNetCore
	- `${aspnet-request-method}` - ASP.NET Request method (GET, POST etc). NLog.WebNLog.Web.AspNetCore
	- `${aspnet-request-querystring}` - ASP.NET Request querystring. NLog.WebNLog.Web.AspNetCore
	- `${aspnet-request-referrer}` - ASP.NET Request referrer. NLog.WebNLog.Web.AspNetCore
	- `${aspnet-request-url}` - ASP.NET Request URL. NLog.WebNLog.Web.AspNetCore
	- `${aspnet-request-useragent}` - ASP.NET Request useragent. NLog.WebNLog.Web.AspNetCore
	- `${aspnet-session}` - ASP.NET Session variable. NLog.WebNLog.Web.AspNetCore
	- `${aspnet-sessionid}` - ASP.NET Session ID variable. NLog.WebNLog.Web.AspNetCore
	- `${aspnet-traceidentifier}` - ASP.NET trace identifier NLog.Web
	- `${aspnet-user-authtype}` - ASP.NET User auth. NLog.WebNLog.Web.AspNetCore
	- `${aspnet-user-identity}` - ASP.NET User variable. NLog.WebNLog.Web.AspNetCore
	- `${aspnet-user-isauthenticated}` - ASP.NET User authenticated? NLog.WebNLog.Web.AspNetCore
	- `${iis-site-name}` - IIS site name. NLog.WebNLog.Web.AspNetCore


***
### See if this is still relevent
For the targets and layout renderers, no additional configuration is needed.
The `NLogHttpModule` needs a registration in `web.config`:
```xml
<system.webServer>
	<modules runAllManagedModulesForAllRequests="true">
		<add name="NLog" type="NLog.Web.NLogHttpModule, NLog.Web" />
	</modules>
</system.webServer>
```
***


## Structured Logging
- Examples
```cs
logger.Info("Logon by {user} from {ip_address}", "Kenny", "127.0.0.1"); // Logon by "Kenny" from "127.0.0.1"
logger.Debug("{shopitem} added to basket by {user}", new { Id=6, Name = "Jacket", Color = "Orange" }, "Kenny");


```
- control formatting by preceding @ or $:
    - `@` will format the object as `JSON`
    - `$` forces `ToString()`
