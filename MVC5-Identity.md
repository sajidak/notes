# MVC5 Identity

## Followup
- 1
	```cs
	LogoutPath = new PathString("/Account/LogOff"),
	ExpireTimeSpan = TimeSpan.FromMinutes(5.0)
	```
- 2
	- Global.asax.cs
	- at the end of "Application_Start"
	- `AntiForgeryConfig.UniqueClaimTypeIdentifier = ClaimTypes.Name;`
- 3
	- `<p class="lead">Login from "@User.Identity.Name" Account.</p>`
- 4
	```cs
	var ctx = Request.GetOwinContext();
	var authenticationManager = ctx.Authentication;
	```
- 5
	- Attribute routing
	- https://blogs.msdn.com/b/webdev/archive/2013/10/17/attribute-routing-in-asp-net-mvc-5.as- px
- 6
	- Authentication filters
	- http://www.dotnetcurry.com/showarticle.aspx?ID=957
	- http://theshravan.net/blog/authentication-filters-in-asp-net-mvc-5/

***

> Implemented 2018 Jul 22

**see**
- https://docs.microsoft.com/en-us/aspnet/identity/
- /media/sak/70_Current/Learning/Notes+Downloads/Notes-171023.md
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


## Sample 1
- https://www.codeproject.com/tips/849113/four-easy-steps-to-set-up-owin-for-form-authentica
- http://sourcebrowser.io/Browse/aspnet/AspNetKatana/src/Microsoft.Owin/Security/AuthenticationManager.cs
- /media/sak/70_Current/Learning/Notes+Downloads/ccc55e1cda0a.html
> Read more and get MVC differential code.

### Add Needed Packages4
- Microsoft.AspNet.Mvc (this is addition to MVC)
- Microsoft.Owin.Security
- Microsoft.Owin.Host.SystemWeb
- Microsoft.AspNet.Identity.Core
- Microsoft.Owin.Security.Cookies

### Add OWIN Startup file
- Add a new item to the project and select (OWIN Start up class)
- This class is the OWIN set up class that should run first to set OWIN up.
- `[assembly: OwinStartup(typeof(Demo.Security.Startup))]`
-
```cs {.numberLines}

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

```cs {.numberLines}
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


## Sample 2, with minimal code summary
- https://weblog.west-wind.com/posts/2015/Apr/29/Adding-minimal-OWIN-Identity-Authentication-to-an-Existing-ASPNET-MVC-Application
	- HttpContext.GetOwinContext().Authentication;
	- MVC4 ??

### Startup Configuration Class

```cs {.numberLines}
public partial class Startup
{
    public void Configuration(IAppBuilder app)
    {
        ConfigureAuth(app);
    }

    // For more information on configuring authentication, please visit http://go.microsoft.com/fwlink/?LinkId=301864
    public void ConfigureAuth(IAppBuilder app)
    {
        app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

        // Enable the application to use a cookie to store information for the signed in user
        app.UseCookieAuthentication(new CookieAuthenticationOptions
        {
            AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
            LoginPath = new PathString("/Account/LogOn")
        });

        // these values are stored in CodePasteKeys.json
        // and are NOT included in repro - autocreated on first load
        if (!string.IsNullOrEmpty(App.Secrets.GoogleClientId))
        {
            app.UseGoogleAuthentication(
                clientId: App.Secrets.GoogleClientId,
                clientSecret: App.Secrets.GoogleClientSecret);
        }

        if (!string.IsNullOrEmpty(App.Secrets.TwitterConsumerKey))
        {
            app.UseTwitterAuthentication(
                consumerKey: App.Secrets.TwitterConsumerKey,
                consumerSecret: App.Secrets.TwitterConsumerSecret);
        }

        if (!string.IsNullOrEmpty(App.Secrets.GitHubClientId))
        {
            app.UseGitHubAuthentication(
                clientId: App.Secrets.GitHubClientId,
                clientSecret: App.Secrets.GitHubClientSecret);
        }

        AntiForgeryConfig.UniqueClaimTypeIdentifier = ClaimTypes.NameIdentifier;
    }
}
```

### IdentitySignIn/SignOut
The key methods are SignIn() and SignOut() on the AuthenticationManager, which create or delete the application cookies on the executing request. SignIn() takes an Identity object that includes any claims you have assigned to it. This identity is what you also get back once the user is logged in and you look at Context.User.Identity later to check for authorization.

```cs {.numberLines}
public void IdentitySignin(string userId, string name, string providerKey = null, bool isPersistent = false)
{
    var claims = new List<Claim>();

    // create *required* claims
    claims.Add(new Claim(ClaimTypes.NameIdentifier, userId));
    claims.Add(new Claim(ClaimTypes.Name, name));

    var identity = new ClaimsIdentity(claims, DefaultAuthenticationTypes.ApplicationCookie);

    // add to user here!
    AuthenticationManager.SignIn(new AuthenticationProperties()
    {
        AllowRefresh = true,
        IsPersistent = isPersistent,
        ExpiresUtc = DateTime.UtcNow.AddDays(7)
    }, identity);
}

public void IdentitySignout()
{
    AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie,
                                  DefaultAuthenticationTypes.ExternalCookie);
}

private IAuthenticationManager AuthenticationManager
{
    get
    {
        return HttpContext.GetOwinContext().Authentication;
    }
}
```

### Local Account Login
```cs {.numberLines}
[AcceptVerbs(HttpVerbs.Post)]
public ActionResult LogOn(string email, string password, bool rememberMe, string returnUrl, bool emailPassword)
{
    // validate your user

    // if all OK sign in
    IdentitySignin(userId, name, user.OpenId, rememberMe);

    return RedirectToAction("New", "Snippet", null);
}

public ActionResult LogOff()
{
    IdentitySignout();
    return RedirectToAction("LogOn");
}
```
