# Authentication in ASP.NET Core

> https://docs.microsoft.com/en-us/aspnet/core/security/authentication/?view=aspnetcore-2.1
> **Root:** https://docs.microsoft.com/en-us/aspnet/core/index?view=aspnetcore-2.1

## Notes
- Overview of Custom Storage Providers for ASP.NET Identity
	- https://docs.microsoft.com/en-us/aspnet/identity/overview/extensibility/overview-of-custom-storage-providers-for-aspnet-identity
- Implementing a Custom MySQL ASP.NET Identity Storage Provider
	- https://docs.microsoft.com/en-us/aspnet/identity/overview/extensibility/implementing-a-custom-mysql-aspnet-identity-storage-provider
- `UserStore<TUser>` Class
	- Namespace: Microsoft.AspNetCore.Identity.EntityFrameworkCore
	- Assembly: Microsoft.AspNetCore.Identity.EntityFrameworkCore.dll
	- Creates a new instance of a persistence store for the specified user type.
- `IUserStore<TUser>` Interface
	- Namespace: Microsoft.AspNetCore.Identity
	- Assemblies: Microsoft.AspNetCore.Identity.dll, Microsoft.Extensions.Identity.Core.dll
	- Provides an abstraction for a store which manages user accounts.
- `UpperInvariantLookupNormalizer` Class
	- Namespace: Microsoft.AspNetCore.Identity
	- Assemblies: Microsoft.AspNetCore.Identity.dll, Microsoft.Extensions.Identity.Core.dll
	- Implements ILookupNormalizer by converting keys to their upper cased invariant culture representation.
- Create an ASP.NET Core app with user data protected by authorization
	- https://docs.microsoft.com/en-us/aspnet/core/security/authorization/secure-data?view=aspnetcore-2.1
- [AllowAnonymous] attribute
	- Add AllowAnonymous to the Index, About, and Contact pages so anonymous users can get information about the site before they register.
	```cs
	// requires using Microsoft.AspNetCore.Mvc.RazorPages;
	[AllowAnonymous]
	public class IndexModel : PageModel
	{
	    public void OnGet()
	    {

	    }
	}
	```

## Identity model customization
> https://docs.microsoft.com/en-us/aspnet/core/security/authentication/customize_identity_model?view=aspnetcore-2.1

### Customizing the model
- When using Identity with support for roles, an `IdentityDbContext` class should be used
- The starting point for customizing the model is to derive from the appropriate context type
	- Identity defines default CLR types for each of the entity types listed above.
	- These types are all prefixed with "Identity": IdentityUser, IdentityRole, IdentityUserClaim, IdentityUserToken, IdentityUserLogin, IdentityRoleClaim, and IdentityUserRole.
	- Rather than using these types directly, the types can be used as base classes for the application's own types.
- When using Identity with support for roles, an `IdentityDbContext` class should be used
- * Changing the key type
- * Adding navigation properties
- * Adding all User navigation properties
- * Adding User and Role navigation properties
- * Adding all navigation properties
- * Changing table/column names and facets
- * Lazy loading (Microsoft.EntityFrameworkCore.Proxies)

***

## Custom storage providers
> https://docs.microsoft.com/en-us/aspnet/core/security/authentication/identity-custom-storage-providers?view=aspnetcore-2.1

### User Class `IdentityUser<TKey, TUserClaim, TUserRole, TUserLogin, TUserToken>`
- create a user class which is equivalent to the `IdentityUser` class.
- At a minimum, your user class must include an Id and a UserName property.

### User Store `IUserStore<TUser>`
- In your `UserStore` class, implement `IUserStore<TUser>` and the optional interfaces required

#### Interfaces to implement, Optional
- IUserStore
	- The `IUserStore<TUser>` interface is the only interface you must implement in the user store. It defines methods for creating, updating, deleting, and retrieving users.
- IUserClaimStore
	- The `IUserClaimStore<TUser>` interface defines the methods you implement to enable user claims. It contains methods for adding, removing and retrieving user claims.
- IUserLoginStore
	- The `IUserLoginStore<TUser>` defines the methods you implement to enable external authentication providers. It contains methods for adding, removing and retrieving user logins, and a method for retrieving a user based on the login information.
- IUserRoleStore
	- The `IUserRoleStore<TUser>` interface defines the methods you implement to map a user to a role. It contains methods to add, remove, and retrieve a user's roles, and a method to check if a user is assigned to a role.
- IUserPasswordStore
	- The `IUserPasswordStore<TUser>` interface defines the methods you implement to persist hashed passwords. It contains methods for getting and setting the hashed password, and a method that indicates whether the user has set a password.
- IUserSecurityStampStore
	- The `IUserSecurityStampStore<TUser>` interface defines the methods you implement to use a security stamp for indicating whether the user's account information has changed. This stamp is updated when a user changes the password, or adds or removes logins. It contains methods for getting and setting the security stamp.
- IUserTwoFactorStore
	- The `IUserTwoFactorStore<TUser>` interface defines the methods you implement to support two factor authentication. It contains methods for getting and setting whether two factor authentication is enabled for a user.
- IUserPhoneNumberStore
	- The `IUserPhoneNumberStore<TUser>` interface defines the methods you implement to store user phone numbers. It contains methods for getting and setting the phone number and whether the phone number is confirmed.
- IUserEmailStore
	- The `IUserEmailStore<TUser>` interface defines the methods you implement to store user email addresses. It contains methods for getting and setting the email address and whether the email is confirmed.
- IUserLockoutStore
	- The `IUserLockoutStore<TUser>` interface defines the methods you implement to store information about locking an account. It contains methods for tracking failed access attempts and lockouts.
- IQueryableUserStore
	- The `IQueryableUserStore<TUser>` interface defines the members you implement to provide a queryable user store.
- You implement only the interfaces that are needed in your app.
	```cs
	public class UserStore : IUserStore<IdentityUser>,
	                         IUserClaimStore<IdentityUser>,
	                         IUserLoginStore<IdentityUser>,
	                         IUserRoleStore<IdentityUser>,
	                         IUserPasswordStore<IdentityUser>,
	                         IUserSecurityStampStore<IdentityUser>
	{
	    // interface implementations not shown
	}
	```

### IdentityUserClaim, IdentityUserLogin, and IdentityUserRole
- https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.identity.entityframeworkcore.identityuserclaim-1
- https://docs.microsoft.com/en-us/aspnet/core/api/microsoft.aspnet.identity.corecompat.identityuserlogin
- https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.identity.entityframeworkcore.identityuserrole-1



### Role Class
- must have an Id and typically it will have a Name property

### Role Store `IRoleStore<TRole>`
- RoleStore class that provides the methods for all data operations on roles
- https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.identity.entityframeworkcore.rolestore-1
- To customize RoleStore, create a class that implements the IRoleStore interface.


### Reconfigure app to use new storage provider
#### Steps
- Remove the Microsoft.AspNetCore.EntityFramework.Identity NuGet package.
- If the storage provider resides in a separate project or package, add a reference to it.
- Replace all references to Microsoft.AspNetCore.EntityFramework.Identity with a using statement for the namespace of your storage provider.
- In the ConfigureServices method, change the AddIdentity method to use your custom types. You can create your own extension methods for this purpose. See IdentityServiceCollectionExtensions for an example.
- If you are using Roles, update the RoleManager to use your RoleStore class.
- Update the connection string and credentials to your app's configuration.

#### Example
````cs
public void ConfigureServices(IServiceCollection services)
{
    // Add identity types
    services.AddIdentity<ApplicationUser, ApplicationRole>()
        .AddDefaultTokenProviders();

    // Identity Services
    services.AddTransient<IUserStore<ApplicationUser>, CustomUserStore>();
    services.AddTransient<IRoleStore<ApplicationRole>, CustomRoleStore>();
    string connectionString = Configuration.GetConnectionString("DefaultConnection");
    services.AddTransient<SqlConnection>(e => new SqlConnection(connectionString));
    services.AddTransient<DapperUsersTable>();

    // additional configuration
}
````



## Enforce HTTPS
> https://docs.microsoft.com/en-us/aspnet/core/security/enforcing-ssl?view=aspnetcore-2.1&tabs=visual-studio

## Prevent Cross-Site Request Forgery (XSRF/CSRF)
> https://docs.microsoft.com/en-us/aspnet/core/security/anti-request-forgery?view=aspnetcore-2.1

## Enable Cross-Origin Requests
> https://docs.microsoft.com/en-us/aspnet/core/security/cors?view=aspnetcore-2.1

## Share cookies among apps
> https://docs.microsoft.com/en-us/aspnet/core/security/cookie-sharing?view=aspnetcore-2.1&tabs=aspnetcore2x
