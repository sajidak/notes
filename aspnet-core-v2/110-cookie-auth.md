---
	title: ASP.NET Core 2.1 Cookie authentication 

	subject:
	- ASP.NET Core 2.1 Cookie authentication 
	- without ASP.NET Core Identity

	subtitle:
	- Source URL: https://docs.microsoft.com/en-us/aspnet/core/security/authentication/cookie?view=aspnetcore-2.1&tabs=aspnetcore2x
	- https://docs.microsoft.com/en-us/aspnet/core/security/authentication/identity-custom-storage-providers?view=aspnetcore-2.1
	- Custom authentication logic with cookie-based authentication
	- as a standalone authentication provider without ASP.NET Core Identity
	- Also see **Custom storage providers for ASP.NET Core Identity**
	- https://docs.microsoft.com/en-us/aspnet/core/security/authentication/identity-custom-storage-providers?view=aspnetcore-2.1

	author:
	- sak

	date: 2018 Aug 24
...

## Notes
- Required Imports
	```cs
	using System.Security.Claims;
	using Microsoft.AspNetCore.Authentication;
	using Microsoft.AspNetCore.Authentication.Cookies;
	```

## Configuration
- If the app doesn't use the Microsoft.AspNetCore.App metapackage, create a package reference in the project file for the Microsoft.AspNetCore.Authentication.Cookies package
- In the ConfigureServices method, create the Authentication Middleware service with the AddAuthentication and AddCookie methods:
	```cs
	services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
		.AddCookie();
	```
- AuthenticationScheme passed to AddAuthentication sets the default authentication scheme for the app. AuthenticationScheme is useful when there are multiple instances of cookie authentication and you want to authorize with a specific scheme. 
- Setting the AuthenticationScheme to CookieAuthenticationDefaults.AuthenticationScheme provides a value of "Cookies" for the scheme. You can supply any string value that distinguishes the scheme.

- In the Configure method, use the UseAuthentication method to invoke the Authentication Middleware that sets the HttpContext.User property. Call the UseAuthentication method before calling UseMvcWithDefaultRoute or UseMvc
- `app.UseAuthentication();`

### AddCookie Options
- The CookieAuthenticationOptions class is used to configure the authentication provider options.
- Set CookieAuthenticationOptions in the service configuration for authentication in the ConfigureServices method:
	```cs
	services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
		.AddCookie(options =>
		{
			...
		});
	```

| Option                 | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| AccessDeniedPath       | Provides the path to supply with a 302 Found (URL redirect) when triggered by HttpContext.ForbidAsync. The default value is /Account/AccessDenied.                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ClaimsIssuer           | The issuer to use for the Issuer property on any claims created by the cookie authentication service.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| Cookie.Domain          | The domain name where the cookie is served. By default, this is the host name of the request. The browser only sends the cookie in requests to a matching host name. You may wish to adjust this to have cookies available to any host in your domain. For example, setting the cookie domain to .contoso.com makes it available to contoso.com, www.contoso.com, and staging.www.contoso.com.                                                                                                                                                                                       |
| Cookie.Expiration      | Gets or sets the lifespan of a cookie. Currently, this option no-ops and will become obsolete in ASP.NET Core 2.1+. Use the ExpireTimeSpan option to set cookie expiration. For more information, see Clarify behavior of CookieAuthenticationOptions.Cookie.Expiration.                                                                                                                                                                                                                                                                                                             |
| Cookie.HttpOnly        | A flag indicating if the cookie should be accessible only to servers. Changing this value to false permits client-side scripts to access the cookie and may open your app to cookie theft should your app have a Cross-site scripting (XSS) vulnerability. The default value is true.                                                                                                                                                                                                                                                                                                |
| Cookie.Name            | Sets the name of the cookie.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Cookie.Path            | Used to isolate apps running on the same host name. If you have an app running at /app1 and want to restrict cookies to that app, set the CookiePath property to /app1. By doing so, the cookie is only available on requests to /app1 and any app underneath it.                                                                                                                                                                                                                                                                                                                    |
| Cookie.SameSite        | Indicates whether the browser should allow the cookie to be attached to same-site requests only (SameSiteMode.Strict) or cross-site requests using safe HTTP methods and same-site requests (SameSiteMode.Lax). When set to SameSiteMode.None, the cookie header value isn't set. Note that Cookie Policy Middleware might overwrite the value that you provide. To support OAuth authentication, the default value is SameSiteMode.Lax. For more information, see OAuth authentication broken due to SameSite cookie policy.                                                        |
| Cookie.SecurePolicy    | A flag indicating if the cookie created should be limited to HTTPS (CookieSecurePolicy.Always), HTTP or HTTPS (CookieSecurePolicy.None), or the same protocol as the request (CookieSecurePolicy.SameAsRequest). The default value is CookieSecurePolicy.SameAsRequest.                                                                                                                                                                                                                                                                                                              |
| DataProtectionProvider | Sets the DataProtectionProvider that's used to create the default TicketDataFormat. If the TicketDataFormat property is set, the DataProtectionProvider option isn't used. If not provided, the app's default data protection provider is used.                                                                                                                                                                                                                                                                                                                                      |
| Events                 | The handler calls methods on the provider that give the app control at certain processing points. If Events aren't provided, a default instance is supplied that does nothing when the methods are called.                                                                                                                                                                                                                                                                                                                                                                           |
| EventsType             | Used as the service type to get the Events instance instead of the property.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ExpireTimeSpan         | The TimeSpan after which the authentication ticket stored inside the cookie expires. ExpireTimeSpan is added to the current time to create the expiration time for the ticket. The ExpiredTimeSpan value always goes into the encrypted AuthTicket verified by the server. It may also go into the Set-Cookie header, but only if IsPersistent is set. To set IsPersistent to true, configure the AuthenticationProperties passed to SignInAsync. The default value of ExpireTimeSpan is 14 days.                                                                                    |
| LoginPath              | Provides the path to supply with a 302 Found (URL redirect) when triggered by HttpContext.ChallengeAsync. The current URL that generated the 401 is added to the LoginPath as a query string parameter named by the ReturnUrlParameter. Once a request to the LoginPath grants a new sign-in identity, the ReturnUrlParameter value is used to redirect the browser back to the URL that caused the original unauthorized status code. The default value is /Account/Login.                                                                                                          |
| LogoutPath             | If the LogoutPath is provided to the handler, then a request to that path redirects based on the value of the ReturnUrlParameter. The default value is /Account/Logout.                                                                                                                                                                                                                                                                                                                                                                                                              |
| ReturnUrlParameter     | Determines the name of the query string parameter that's appended by the handler for a 302 Found (URL redirect) response. ReturnUrlParameter is used when a request arrives on the LoginPath or LogoutPath to return the browser to the original URL after the login or logout action is performed. The default value is ReturnUrl.                                                                                                                                                                                                                                                  |
| SessionStore           | An optional container used to store identity across requests. When used, only a session identifier is sent to the client. SessionStore can be used to mitigate potential problems with large identities.                                                                                                                                                                                                                                                                                                                                                                             |
| SlidingExpiration      | A flag indicating if a new cookie with an updated expiration time should be issued dynamically. This can happen on any request where the current cookie expiration period is more than 50% expired. The new expiration date is moved forward to be the current date plus the ExpireTimespan. An absolute cookie expiration time can be set by using the AuthenticationProperties class when calling SignInAsync. An absolute expiration time can improve the security of your app by limiting the amount of time that the authentication cookie is valid. The default value is true. |
| TicketDataFormat       | The TicketDataFormat is used to protect and unprotect the identity and other properties that are stored in the cookie value. If not provided, a TicketDataFormat is created using the DataProtectionProvider.                                                                                                                                                                                                                                                                                                                                                                        |
| Validate               | Method that checks that the options are valid.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
> TBD, get table

## Create an authentication cookie
- To create a cookie holding user information, you must construct a ClaimsPrincipal. 
- The user information is serialized and stored in the cookie.
- Create a ClaimsIdentity with any required Claims and call SignInAsync to sign in the user:
	```cs
	var claims = new List<Claim>
	{
		new Claim(ClaimTypes.Name, user.Email),
		new Claim("FullName", user.FullName),
		new Claim(ClaimTypes.Role, "Administrator"),
	};

	var claimsIdentity = new ClaimsIdentity(
		claims, CookieAuthenticationDefaults.AuthenticationScheme);

	var authProperties = new AuthenticationProperties
	{
		//AllowRefresh = <bool>,
		//ExpiresUtc = DateTimeOffset.UtcNow.AddMinutes(10),
		//IsPersistent = true,
		//IssuedUtc = <DateTimeOffset>,
		//RedirectUri = <string>
	};

	await HttpContext.SignInAsync(
		CookieAuthenticationDefaults.AuthenticationScheme, 
		new ClaimsPrincipal(claimsIdentity), 
		authProperties);
	```
- SignInAsync creates an encrypted cookie and adds it to the current response. If you don't specify an AuthenticationScheme, the default scheme is used.
- Under the covers, the encryption used is ASP.NET Core's Data Protection system. 
- AuthenticationProperties

| Property     | Desc                                                                                                                                                                      |
|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| AllowRefresh | Gets or sets if refreshing the authentication session should be allowed                                                                                                   |
| ExpiresUtc   | Gets or sets the time at which the authentication ticket expires                                                                                                          |
| IsPersistent | Gets or sets whether the authentication session is persisted across multiple requests                                                                                     |
| IssuedUtc    | Gets or sets the time at which the authentication ticket was issued                                                                                                       |
| Items        | State values about the authentication session                                                                                                                             |
| Parameters   | Collection of parameters that are passed to the authentication handler. These are not intended for serialization or persistence, only for flowing data between call sites |
| RedirectUri  | Gets or sets the full path or absolute URI to be used as an http redirect response value                                                                                  |

## Sign out
- To sign out the current user and delete their cookie, call SignOutAsync:
```cs
await HttpContext.SignOutAsync(
    CookieAuthenticationDefaults.AuthenticationScheme);
```
- If you aren't using CookieAuthenticationDefaults.AuthenticationScheme (or "Cookies") as the scheme (for example, "ContosoCookie"), 
- supply the scheme you used when configuring the authentication provider. Otherwise, the default scheme is used.

## Persistent cookies
- Any sliding expiration settings previously configured are honored. 
- If the cookie expires while the browser is closed, the browser clears the cookie once it's restarted.
- This persistence should only be enabled with explicit user consent with a "Remember Me" checkbox on login or a similar mechanism.
```cs
await HttpContext.SignInAsync(
    CookieAuthenticationDefaults.AuthenticationScheme,
    new ClaimsPrincipal(claimsIdentity),
    new AuthenticationProperties
    {
        IsPersistent = true
    });
```
The AuthenticationProperties class resides in the Microsoft.AspNetCore.Authentication namespace

## Absolute cookie expiration
- Also set IsPersistent; otherwise, ExpiresUtc is ignored and a single-session cookie is created. 
- When ExpiresUtc is set on SignInAsync, it overrides the value of the ExpireTimeSpan option of CookieAuthenticationOptions, if set.
```cs
await HttpContext.SignInAsync(
    CookieAuthenticationDefaults.AuthenticationScheme,
    new ClaimsPrincipal(claimsIdentity),
    new AuthenticationProperties
    {
        IsPersistent = true,
        ExpiresUtc = DateTime.UtcNow.AddMinutes(20)
    });
```
