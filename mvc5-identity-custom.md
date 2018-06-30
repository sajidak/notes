# MVC5 Custom user management

## Notes:
- In case you want to have your custom solution to any of these components then define your solution so that it implements the appropriate interface and then you can plug it into the UserManager class.
- E.g. if you want to store your users in MongoDb then implement IUserStore, define your logic there and pass it in as the IUserStore parameter to the UserManager object.
- It’s a good idea to implement as many sub-interfaces such as IUserClaimsStore and IUserRoleStore as possible so that your custom UserStore that you pass into UserManager will be very “clever”: it will be able to handle a lot of aspects around user management. And then when you call upon e.g. UserManager.CreateAsync then UserManager will pick up your custom solution to create a user.
- However, if you’re happy with an SQL server solution governed by EntityFramework then you may consider the default setup and implementations inserted by the MVC5 template
- You implement only the interfaces that are needed in your app. For example:
	```cs
	// Microsoft.AspNet.Identity
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
## Steps (draft)
http://danderson.io/posts/using-your-own-database-schema-and-classes-with-asp-net-core-identity-and-entity-framework-core/
- Create and implement UserStore
- Create and implement RoleStore
- Plug in our functionality into Startup.ConfigureServices
	- Register our context as a service
	- Tell identity to use our custom classes for users and roles
	- Tell identity to use our custom storage provider for users
	- Tell identity to use our custom storage provider for roles
- Context class ??
	- https://docs.microsoft.com/en-us/aspnet/core/api/microsoft.aspnet.identity.corecompat.identitydbcontext-1
	- Encapsulates the information to connect to your persistence mechanism and execute queries.
	- Several data classes require an instance of this class,
	- typically provided through dependency injection.
	-



## links
- http://danderson.io/posts/using-your-own-database-schema-and-classes-with-asp-net-core-identity-and-entity-framework-core/
- https://github.com/aspnet/Docs/blob/master/aspnetcore/security/authentication/identity-custom-storage-providers.md
- https://docs.microsoft.com/en-us/aspnet/core/security/authentication/identity?view=aspnetcore-2.1&tabs=visual-studio%2Caspnetcore2x
- http://future-shock.net/blog/post/creating-a-simple-login-in-asp.net-core-2-using-authentication-and-authorization-not-identity
- https://docs.microsoft.com/en-us/aspnet/core/security/authentication/identity-configuration?view=aspnetcore-2.1
-
