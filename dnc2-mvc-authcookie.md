# Use cookie authentication without ASP.NET Core Identity

> https://docs.microsoft.com/en-us/aspnet/core/security/authentication/cookie?view=aspnetcore-2.1&tabs=aspnetcore2x
> Applies to ASP.NET Core 2.1
>
> Use cookie-based authentication as a standalone authentication provider without ASP.NET Core Identity.

## Notes - Gen
- Sample
	- https://github.com/aspnet/Docs/tree/master/aspnetcore/security/authentication/cookie/samples/2.x/CookieSample
- Packages
	- If the app doesn't use the Microsoft.AspNetCore.App metapackage
	- reference `Microsoft.AspNetCore.Authentication.Cookies` package v2.1.0 or later


## Configuration
- In the `ConfigureServices` method, create the Authentication Middleware service with the `AddAuthentication` and `AddCookie` methods
	- `services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie();`
	- Setting the `AuthenticationScheme` to `CookieAuthenticationDefaults.AuthenticationScheme` provides a value of "Cookies" for the scheme.
	- You can supply any string value that distinguishes the scheme.
- In the Configure method, use the UseAuthentication method to invoke the Authentication Middleware that sets the HttpContext.User property.
	- Call the UseAuthentication method before calling UseMvcWithDefaultRoute or UseMvc
	- `app.UseAuthentication();`

### AddCookie Options
- The `CookieAuthenticationOptions` class is used to configure the authentication provider options
	- https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.authentication.cookies.cookieauthenticationoptions?view=aspnetcore-2.0
- Set CookieAuthenticationOptions in the service configuration for authentication in the ConfigureServices method
	```cs
	services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
	    .AddCookie(options =>
	    {
	        ...
	    });
	```

## Cookie Policy Middleware
- Cookie Policy Middleware enables cookie policy capabilities in an app.
- Adding the middleware to the app processing pipeline is order sensitive;
- it only affects components registered after it in the pipeline.
	- `app.UseCookiePolicy(cookiePolicyOptions);`
- The CookiePolicyOptions provided to the Cookie Policy Middleware allow you to control global characteristics of cookie processing and hook into cookie processing handlers when cookies are appended or deleted.
	- https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.builder.cookiepolicyoptions



## Create an authentication cookie
- To create a cookie holding user information, you must construct a ClaimsPrincipal.
- The user information is serialized and stored in the cookie.
- Create a ClaimsIdentity with any required Claims and call SignInAsync to sign in the user
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
	    // Refreshing the authentication session should be allowed.

	    //ExpiresUtc = DateTimeOffset.UtcNow.AddMinutes(10),
	    // The time at which the authentication ticket expires. A
	    // value set here overrides the ExpireTimeSpan option of
	    // CookieAuthenticationOptions set with AddCookie.

	    //IsPersistent = true,
	    // Whether the authentication session is persisted across
	    // multiple requests. Required when setting the
	    // ExpireTimeSpan option of CookieAuthenticationOptions
	    // set with AddCookie. Also required when setting
	    // ExpiresUtc.

	    //IssuedUtc = <DateTimeOffset>,
	    // The time at which the authentication ticket was issued.

	    //RedirectUri = <string>
	    // The full path or absolute URI to be used as an http
	    // redirect response value.
	};

	await HttpContext.SignInAsync(
	    CookieAuthenticationDefaults.AuthenticationScheme,
	    new ClaimsPrincipal(claimsIdentity),
	    authProperties);
	```
	- `SignInAsync` creates an encrypted cookie and adds it to the current response.
	- If you don't specify an `AuthenticationScheme`, the default scheme is used.


## Sign out
- To sign out the current user and delete their cookie, call SignOutAsync:
	```cs
	await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
	```




## React to back-end changes
> This approach is triggered on every request. This can result in a large performance penalty for the app.
- The ValidatePrincipal event can be used to intercept and override validation of the cookie identity.
- When any user is updated in the database, the LastChanged value is set to the current time.
- Create the cookie with a LastChanged claim containing the current LastChanged value from the database
	```cs
	// When implemented in IUserRepository
	var claims = new List<Claim>
	{
	    new Claim(ClaimTypes.Name, user.Email),
	    new Claim("LastChanged", {Database Value})
	};

	var claimsIdentity = new ClaimsIdentity(
	    claims,
	    CookieAuthenticationDefaults.AuthenticationScheme);

	await HttpContext.SignInAsync(
	    CookieAuthenticationDefaults.AuthenticationScheme,
	    new ClaimsPrincipal(claimsIdentity));
	```
- To implement an override for the `ValidatePrincipal` event, write a method with the following signature in a class that you derive from CookieAuthenticationEvents
`ValidatePrincipal(CookieValidatePrincipalContext)`

> TODO: Read More...

## Persistent cookies
- To persist across browser sessions.
- The `AuthenticationProperties` class resides in the `Microsoft.AspNetCore.Authentication` namespace.
```cs
await HttpContext.SignInAsync(
    CookieAuthenticationDefaults.AuthenticationScheme,
    new ClaimsPrincipal(claimsIdentity),
    new AuthenticationProperties
    {
        IsPersistent = true
    });
```



## Absolute cookie expiration
- You can set an absolute expiration time with `ExpiresUtc`.
- You must also set `IsPersistent`; otherwise, `ExpiresUtc` is ignored and a single-session cookie is created.
- When `ExpiresUtc` is set on `SignInAsync`, it overrides the value of the `ExpireTimeSpan` option of `CookieAuthenticationOptions`, if set.
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

## Further Reading
- AuthenticationScheme
	- If you don't specify an `AuthenticationScheme`, the default scheme is used.



## Code Sample

### CookieSample/Program.cs
```cs{.numberLines}
	using Microsoft.AspNetCore;
	using Microsoft.AspNetCore.Hosting;

	namespace CookieSample
	{
	    public class Program
	    {
	        public static void Main(string[] args)
	        {
	            CreateWebHostBuilder(args).Build().Run();
	        }

	        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
	            WebHost.CreateDefaultBuilder(args)
	                .UseStartup<Startup>();
	    }
	}
```

### CookieSample/Startup.cs
```cs{.numberLines}
	using Microsoft.AspNetCore.Authentication.Cookies;
	using Microsoft.AspNetCore.Builder;
	using Microsoft.AspNetCore.Hosting;
	using Microsoft.AspNetCore.Http;
	using Microsoft.AspNetCore.Mvc;
	using Microsoft.Extensions.DependencyInjection;

	namespace CookieSample
	{
	    public class Startup
	    {
	        public void ConfigureServices(IServiceCollection services)
	        {
	            services.Configure<CookiePolicyOptions>(options =>
	            {
	                options.CheckConsentNeeded = context => true;
	                options.MinimumSameSitePolicy = SameSiteMode.None;
	            });

	            services.AddMvc()
	                .AddRazorPagesOptions(options =>
	                {
	                    options.Conventions.AuthorizePage("/Contact");
	                })
	                .SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

	            #region snippet1
	            services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
	                .AddCookie();
	            #endregion

	            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
	        }

	        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
	        {
	            if (env.IsDevelopment())
	            {
	                app.UseDeveloperExceptionPage();
	                app.UseDatabaseErrorPage();
	            }
	            else
	            {
	                app.UseExceptionHandler("/Error");
	                app.UseHsts();
	            }

	            app.UseHttpsRedirection();
	            app.UseStaticFiles();
	            app.UseCookiePolicy();

	            // Call UseAuthentication before calling UseMVC.
	            #region snippet2
	            app.UseAuthentication();
	            #endregion

	            app.UseMvc();
	        }
	    }
	}
```

### CookieSample/Pages/Account/Login.cshtml.cs
```cs{.numberLines}
	using System;
	using System.ComponentModel.DataAnnotations;
	using System.Security.Claims;
	using System.Threading.Tasks;
	using Microsoft.AspNetCore.Authentication;
	using Microsoft.AspNetCore.Mvc;
	using Microsoft.AspNetCore.Mvc.RazorPages;
	using Microsoft.Extensions.Logging;
	using CookieSample.Data;

	using Microsoft.AspNetCore.Authentication.Cookies;
	using System.Collections.Generic;

	namespace CookieSample.Pages.Account
	{
	    public class LoginModel : PageModel
	    {
	        private readonly ILogger<LoginModel> _logger;

	        public LoginModel(ILogger<LoginModel> logger)
	        {
	            _logger = logger;
	        }

	        [BindProperty]
	        public InputModel Input { get; set; }

	        public string ReturnUrl { get; set; }

	        [TempData]
	        public string ErrorMessage { get; set; }

	        public class InputModel
	        {
	            [Required]
	            [EmailAddress]
	            public string Email { get; set; }

	            [Required]
	            [DataType(DataType.Password)]
	            public string Password { get; set; }
	        }

	        public async Task OnGetAsync(string returnUrl = null)
	        {
	            if (!string.IsNullOrEmpty(ErrorMessage))
	            {
	                ModelState.AddModelError(string.Empty, ErrorMessage);
	            }

	            // Clear the existing external cookie
	            #region snippet2
	            await HttpContext.SignOutAsync(
	                CookieAuthenticationDefaults.AuthenticationScheme);
	            #endregion

	            ReturnUrl = returnUrl;
	        }

	        public async Task<IActionResult> OnPostAsync(string returnUrl = null)
	        {
	            ReturnUrl = returnUrl;

	            if (ModelState.IsValid)
	            {
	                // Use Input.Email and Input.Password to authenticate the user
	                // with your custom authentication logic.
	                //
	                // For demonstration purposes, the sample validates the user
	                // on the email address maria.rodriguez@contoso.com with
	                // any password that passes model validation.

	                var user = await AuthenticateUser(Input.Email, Input.Password);

	                if (user == null)
	                {
	                    ModelState.AddModelError(string.Empty, "Invalid login attempt.");
	                    return Page();
	                }

	                #region snippet1
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
	                    // Refreshing the authentication session should be allowed.

	                    //ExpiresUtc = DateTimeOffset.UtcNow.AddMinutes(10),
	                    // The time at which the authentication ticket expires. A
	                    // value set here overrides the ExpireTimeSpan option of
	                    // CookieAuthenticationOptions set with AddCookie.

	                    //IsPersistent = true,
	                    // Whether the authentication session is persisted across
	                    // multiple requests. Required when setting the
	                    // ExpireTimeSpan option of CookieAuthenticationOptions
	                    // set with AddCookie. Also required when setting
	                    // ExpiresUtc.

	                    //IssuedUtc = <DateTimeOffset>,
	                    // The time at which the authentication ticket was issued.

	                    //RedirectUri = <string>
	                    // The full path or absolute URI to be used as an http
	                    // redirect response value.
	                };

	                await HttpContext.SignInAsync(
	                    CookieAuthenticationDefaults.AuthenticationScheme,
	                    new ClaimsPrincipal(claimsIdentity),
	                    authProperties);
	                #endregion

	                _logger.LogInformation($"User {user.Email} logged in at {DateTime.UtcNow}.");

	                return LocalRedirect(Url.GetLocalUrl(returnUrl));
	            }

	            // Something failed. Redisplay the form.
	            return Page();
	        }

	        private async Task<ApplicationUser> AuthenticateUser(string email, string password)
	        {
	            // For demonstration purposes, authenticate a user
	            // with a static email address. Ignore the password.
	            // Assume that checking the database takes 500ms

	            await Task.Delay(500);

	            if (Input.Email == "maria.rodriguez@contoso.com")
	            {
	                return new ApplicationUser()
	                {
	                    Email = "maria.rodriguez@contoso.com",
	                    FullName = "Maria Rodriguez"
	                };
	            }
	            else
	            {
	                return null;
	            }
	        }
	    }
	}
```

### CookieSample/Pages/Account/SignedOut.cshtml.cs
```cs{.numberLines}
	using System.Threading.Tasks;
	using Microsoft.AspNetCore.Mvc;
	using Microsoft.AspNetCore.Mvc.RazorPages;

	namespace CookieSample.Pages.Account
	{
	    public class SignedOutModel : PageModel
	    {
	        public IActionResult OnGet()
	        {
	            if (User.Identity.IsAuthenticated)
	            {
	                // Redirect to home page if the user is authenticated.
	                return RedirectToPage("/Index");
	            }

	            return Page();
	        }
	    }
	}
```

### CookieSample/Controllers/AccountController.cs
```cs{.numberLines}
	using System;
	using System.Threading.Tasks;
	using Microsoft.AspNetCore.Mvc;
	using Microsoft.Extensions.Logging;
	using Microsoft.AspNetCore.Authentication;
	using Microsoft.AspNetCore.Authentication.Cookies;

	namespace CookieSample.Controllers
	{
	    [Route("[controller]/[action]")]
	    public class AccountController : Controller
	    {
	        private readonly ILogger _logger;

	        public AccountController(ILogger<AccountController> logger)
	        {
	            _logger = logger;
	        }

	        [HttpPost]
	        public async Task<IActionResult> Logout()
	        {
	            _logger.LogInformation($"User {User.Identity.Name} logged out at {DateTime.UtcNow}.");

	            #region snippet1
	            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
	            #endregion

	            return RedirectToPage("/Account/SignedOut");
	        }
	    }
	}
```
