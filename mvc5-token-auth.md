# MVC5 Token based authentication
15 Nov 2017

> - Basically you need to create the tokens on the server and you can save those inside database, by mapping with the userid. Each token should have a lifetime and that also should be kept inside the table.
> - The token should be given to the client perhaps after authentication. At the client end, you can keep this tokens inside the session storage or local storage. You can use cookies as well, but I will suggest you to use session storage so that it can work on any devices.
> - While sending any request to the server, you have to include the token inside header and match the token and the life time at the server. You can have the logic to increase the token life time or keep it fixed as per your need..
> - You can you use OWin authentication for this.
>
> - create a token server which is responsible for authentication of both your API and you MVC project - an external provider - like Google or Facebook for example
> - hash-based message authentication code [HMAC](http://en.wikipedia.org/wiki/Hash-based_message_authentication_code)
>
> - The  package “Microsoft.Owin.Host.SystemWeb” is used to enable our Owin server to run our API on IIS using ASP.NET request pipeline

**Links:**

- `Learning/Notes+Downloads/MVC5-Token-Based-Auth.mht`
- http://www.primaryobjects.com/2015/05/08/token-based-authentication-for-web-service-apis-in-c-mvc-net/
	- `TokenAuthMVC-master.zip`
- http://bitoftech.net/2014/06/01/token-based-authentication-asp-net-web-api-2-owin-asp-net-identity/
	- `AspNetIdentity.WebApi-master.zip`,
	- ASP.NET Identity 2.1 with ASP.NET Web API 2.2, in 5 Parts
	1. Accounts Management
	2. Accounts Confirmation, and Password Policy Configuration
	3. OAuth JSON Web Tokens Authentication
	4. Roles Based Authorization
	5. Claims Authorization
- http://www.dotnetcurry.com/aspnet/1223/secure-aspnet-web-api-using-tokens-owin-angularjs
- https://github.com/primaryobjects/TokenAuthMVC
- http://www.primaryobjects.com/CMS/Article165
- http://bitoftech.net/2015/01/21/asp-net-identity-2-with-asp-net-web-api-2-accounts-management/
	- Has multiple sub-links


**Other links of interest**

- http://bitoftech.net/2015/03/31/asp-net-web-api-claims-authorization-with-asp-net-identity-2-1/
- http://www.jerriepelser.com/blog/advanced-configuration-in-the-aspnet5-generic-oauth-provider
	- An introduction to the ASP.NET 5 Generic OAuth Provider Client
- https://www.red-gate.com/simple-talk/dotnet/net-framework/creating-custom-oauth-middleware-for-mvc-5/
	- Creating Custom OAuth Middleware for MVC 5
- https://docs.microsoft.com/en-us/aspnet/aspnet/overview/owin-and-katana/owin-oauth-20-authorization-server
	- **OWIN OAuth 2.0 Authorization Server**
- See Also [MVC5-Identity.md](MVC5-Identity.md)


## Notes

### http://www.primaryobjects.com/2015/05/08/token-based-authentication-for-web-service-apis-in-c-mvc-net/
- Token-based authentication involves providing a token or key in the url or HTTP request header, which contains all necessary information to validate a user’s request. Some examples of information included in the token are username, timestamp, ip address, and any other information pertinent towards checking if a request should be honored.
- `RESTAuthorizeAttribute`
- `[assembly: OwinStartup(typeof(AngularJSAuthentication.API.Startup))]`
	- the “assembly” attribute which states which class to fire on start-up
	- Delete `Global.asax` Class, No need to use this class and fire up the Application_Start event after we’ve configured our “Startup” class
