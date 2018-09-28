# EF Core

## Links
- Docs at https://docs.microsoft.com/en-us/ef/core/
- `dotnet ef dbcontext scaffold`
	```
	dotnet add package Microsoft.EntityFrameworkCore.Design
	dotnet restore
	```

- vSCode at
	- https://docs.microsoft.com/en-us/aspnet/core/tutorials/web-api-vsc?view=aspnetcore-2.1
	- https://www.learnentityframeworkcore.com/walkthroughs/aspnetcore-application
	-


## with an Existing Database

- Install Entity Framework Core
	- install the package for the EF Core database provider
	- Microsoft.EntityFrameworkCore.SqlServer
	- Microsoft.EntityFrameworkCore.InMemory
	- Pomelo.EntityFrameworkCore.MySql
	- MySql.Data.EntityFrameworkCore
	- EntityFrameworkCore.Jet
	- Microsoft.EntityFrameworkCore.Sqlite
- Reverse engineer model
	- Tools –> NuGet Package Manager –> Package Manager Console
	```powershell
	Scaffold-DbContext "Server=(localdb)\mssqllocaldb;Database=Blogging;Trusted_Connection=True;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models
	```
	- specify which tables you want to generate entities for by adding the -Tables argument
		- `-Tables Blog,Post`
- Register your context with dependency injection
	- In Startup.cs
	```cs
	using EFGetStarted.AspNetCore.ExistingDb.Models;
	using Microsoft.EntityFrameworkCore;

	// This method gets called by the runtime. Use this method to add services to the container.
	public void ConfigureServices(IServiceCollection services)
	{
	/*	services.Configure<CookiePolicyOptions>(options =>
		{
		});	*/

		services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

		var connection = @"Server=(localdb)\mssqllocaldb;Database=Blogging;Trusted_Connection=True;ConnectRetryCount=0";
		services.AddDbContext<BloggingContext>(options => options.UseSqlServer(connection));
	}
	```
