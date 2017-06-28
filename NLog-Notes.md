
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
`https://github.com/NLog/NLog.Web`
- `${aspnet-MVC-Action}` - ASP.NET MVC action name
- `${aspnet-MVC-Controller}` - ASP.NET MVC controller name
- `${aspnet-Application}` - ASP.NET Application variable.
- `${aspnet-Item}` - ASP.NET HttpContext item variable.
- `${aspnet-Request}` - ASP.NET Request variable.
- `${aspnet-Request-Cookie}` - ASP.NET Request cookie content.
- `${aspnet-Request-Host}` - ASP.NET Request host.
- `${aspnet-Request-Method}` - ASP.NET Request method (GET, POST etc).
- `${aspnet-Request-QueryString}` - ASP.NET Request querystring.
- `${aspnet-Request-Referrer}` - ASP.NET Request referrer.
- `${aspnet-Request-UserAgent}` - ASP.NET Request useragent.
- `${aspnet-Request-Url}` - ASP.NET Request URL.
- `${aspnet-Session}` - ASP.NET Session variable.
- `${aspnet-SessionId}` - ASP.NET Session ID variable.
- `${aspnet-TraceIdentifier}` - ASP.NET trace identifier
- `${aspnet-UserAuthType}` - ASP.NET User auth.
- `${aspnet-UserIdentity}` - ASP.NET User variable.
- `${iis-site-name}` - IIS site name.

For the targets and layout renderers, no additional configuration is needed.
The `NLogHttpModule` needs a registration in `web.config`:
```xml
<system.webServer>
	<modules runAllManagedModulesForAllRequests="true">
		<add name="NLog" type="NLog.Web.NLogHttpModule, NLog.Web" />
	</modules>
</system.webServer>
```
