# EF Core .NET Command-line Tools
> https://docs.microsoft.com/en-us/ef/core/miscellaneous/cli/dotnet

The .NET Core SDK version 2.1.300 and newer includes dotnet ef commands that are compatible with EF Core 2.0 and later versions.

## dotnet ef --help
```text
Entity Framework Core .NET Command-line Tools 2.1.3-rtm-32065

Usage: dotnet ef [options] [command]

Options:
  --version        Show version information
  -h|--help        Show help information
  -v|--verbose     Show verbose output.
  --no-color       Don't colorize output.
  --prefix-output  Prefix output with level.

Commands:
  database    Commands to manage the database.
  dbcontext   Commands to manage DbContext types.
  migrations  Commands to manage migrations.

Use "dotnet ef [command] --help" for more information about a command.
```

## Interesting commands
- dotnet ef dbcontext scaffold `[arguments]` `[options]`
- dotnet ef dbcontext info
	- Gets information about a DbContext type.
- dotnet ef dbcontext list
	- Lists available DbContext types.

## Database Providers
> Entity Framework Core can access many different databases through plug-in libraries called database providers.

- MySQL
	- **Pomelo.EntityFrameworkCore.MySql**
		- https://github.com/PomeloFoundation/Pomelo.EntityFrameworkCore.MySql/blob/master/README.md
	- MySql.Data.EntityFrameworkCore
	- Devart.Data.MySql.EFCore
- Microsoft Access files
	- EntityFrameworkCore.Jet
- SQLite 3.7 +
	- Microsoft.EntityFrameworkCore.Sqlite
- EF Core in-memory database
	- Microsoft.EntityFrameworkCore.InMemory

## EF Core Tools & Extensions
> Evaluate and list interesting

- Prefilter
	- https://github.com/ErikEJ/SqlCeToolbox/wiki/EF-Core-Power-Tools
		- VS 2017 extension
	- https://marketplace.visualstudio.com/items?itemName=michaelsawczyn.EFDesigner
		- VS 2017 extension
		- Entity Framework visual editor for EF6, EFCore and beyond.
	- https://github.com/Arch/AutoHistory/
		- A plugin for Microsoft.EntityFrameworkCore to support automatically recording data changes history.
		- AutoHistory will record all data change history in one Table named AutoHistories, this table will recording data UPDATE, DELETE history.
		- Install AutoHistory Package
			- `Install-Package Microsoft.EntityFrameworkCore.AutoHistory`
		- Enable AutoHistory
		- Ensure AutoHistory in DbContext
		- extending the Microsoft.EntityFrameworkCore.AutoHistory class
	- https://github.com/NickStrupat/EntityFramework.Triggers/
		- Adds events for entity inserting, inserted, updating, updated, deleting, and deleted
		- supports both the EntityFramework and EntityFrameworkCore projects
		-
	- https://github.com/iQuarc/Geco
		- Geco, (Ge)nerator (Co)nsole
		- installed as a Visual Studio Project Template or as dotnet new template.
		- Entity Framework Core Reverse model generator
