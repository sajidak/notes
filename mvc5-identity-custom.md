# MVC5 Custom user management

## Notes:
- In case you want to have your custom solution to any of these components then define your solution so that it implements the appropriate interface and then you can plug it into the UserManager class.
- E.g. if you want to store your users in MongoDb then implement IUserStore, define your logic there and pass it in as the IUserStore parameter to the UserManager object.
- It’s a good idea to implement as many sub-interfaces such as IUserClaimsStore and IUserRoleStore as possible so that your custom UserStore that you pass into UserManager will be very “clever”: it will be able to handle a lot of aspects around user management. And then when you call upon e.g. UserManager.CreateAsync then UserManager will pick up your custom solution to create a user.
- However, if you’re happy with an SQL server solution governed by EntityFramework then you may consider the default setup and implementations inserted by the MVC5 template
