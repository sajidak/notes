# SessionStore
> Microsoft.AspNetCore.Authentication.Cookies.CookieAuthenticationOptions.SessionStore
> Microsoft.AspNetCore.Authentication.Cookies.ITicketStore

**Note:** Check cookie size and then follow up on this.

## Links
- https://hajekj.net/2017/03/20/cookie-size-and-cookie-authentication-in-asp-net-core/
- https://docs.microsoft.com/en-us/aspnet/core/performance/caching/memory?view=aspnetcore-2.1
- https://rhastastudio.wordpress.com/
- https://github.com/bymyslf/Bymyslf.AuthenticationSessionStore
-

## How
- need an instance of a class that implements IAuthenticationSessionStore
	- also need to create a TicketDataFormat instance
