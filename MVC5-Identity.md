# MVC5 Identity
see
- https://docs.microsoft.com/en-us/aspnet/identity/
- /media/sak/70_Current/Learning/Notes+Downloads/Notes-171023.md
-


- https://docs.microsoft.com/en-us/aspnet/identity/overview/getting-started/introduction-to-aspnet-identity
- ** https://www.tektutorialshub.com/asp-net-identity-tutorial-basics/
	- The Managers uses the `UseStore` to talk to the Stores.
	- The stores define how the users, roles are persisted to the database.
	- The User Manager is decoupled from the UserStore.
	- This decoupling enables us to create our own implementation of User Store
- https://www.tektutorialshub.com/asp-net-identity-tutorial-owin-setup/

## Other Links
- https://www.codeproject.com/Articles/1183421/Simple-OAuth-Authorization-Server-with-Identity-Se
- https://github.com/IdentityServer/IdentityServer4.Samples/tree/release/Quickstarts/1_ClientCredentials
-

## Sample 1
http://sourcebrowser.io/Browse/aspnet/AspNetKatana/src/Microsoft.Owin/Security/AuthenticationManager.cs
> Read more and get MVC differential code.

### Add Needed Packages
- Microsoft.AspNet.Mvc (this is addition to MVC)
- Microsoft.Owin.Security
- Microsoft.Owin.Host.SystemWeb
- Microsoft.AspNet.Identity.Core
- Microsoft.Owin.Security.Cookies

### Add OWIN Startup file
- Add a new item to the project and select (OWIN Start up class)
- This class is the OWIN set up class that should run first to set OWIN up.

```cs

public class AuthConfig
   {
       public void Configuration(IAppBuilder app)
       {
           System.Web.Helpers.AntiForgeryConfig.UniqueClaimTypeIdentifier = ClaimTypes.Email;
           app.UseCookieAuthentication(new CookieAuthenticationOptions
           {
               AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
               LoginPath = new PathString("/Account/Login"),
               CookieSecure = CookieSecureOption.SameAsRequest
           });
       }
   }
```

```cs
private void SignIn(List<Claim> claims)//Mind!!! This is System.Security.Claims not WIF claims
       {
           var claimsIdentity = new DemoIdentity(claims,
           DefaultAuthenticationTypes.ApplicationCookie);

           //This uses OWIN authentication

           AuthenticationManager.SignOut(DefaultAuthenticationTypes.ExternalCookie);
           AuthenticationManager.SignIn(new AuthenticationProperties()
				{ IsPersistent = true }, claimsIdentity);

           HttpContext.User = new DemoPrincipal
			(AuthenticationManager.AuthenticationResponseGrant.Principal);
       }
```

- To mark an action or controller as needs authorization/authentication' you add this attribute `[Authorize]`
