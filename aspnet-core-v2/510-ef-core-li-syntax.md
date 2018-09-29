# Cli Command Syntax
> Captured from terminal with `--help` option.

## Samples
- Sample 0
	- This will be the updated code that can be run directly for the project.


- Sample 1 - MS SQL
	```sh
	# from https://www.learnentityframeworkcore.com/walkthroughs/existing-database

	## Add dependencies
	#
	# from project root
	cd 'project-root'
	# Add packages
	dotnet add package Microsoft.EntityFrameworkCore.SqlServer;
	dotnet add package Microsoft.EntityFrameworkCore.Tools;
	dotnet add package Microsoft.EntityFrameworkCore.SqlServer.Design;

	# Entity Framework Core .NET Command Line Tools. Includes dotnet-ef.
	dotnet add package Microsoft.EntityFrameworkCore.Tools.DotNet;
	dotnet add package MySql.Data.EntityFrameworkCore;
	# dotnet add package MySql.Data.EntityFrameworkCore.Design; # See if this needed

	## Verify reference in .csproj
	#	get Version from
	#	https://www.nuget.org/packages/Microsoft.EntityFrameworkCore.Tools.DotNet/
	#
	#	<ItemGroup>
	#	    <DotNetCliToolReference
	#	        Include="Microsoft.EntityFrameworkCore.Tools.DotNet"
	#	        Version="2.0.3" />
	#	</ItemGroup>
	dotnet restore;

	## Scaffold from database
	dotnet ef dbcontext scaffold \
	  "Server=.\;Database=AdventureWorksLT2012;Trusted_Connection=True;" \
	  Microsoft.EntityFrameworkCore.SqlServer \
	  -o Model
	```
- Sample 2 - MySQL
	```sh
	# from https://docs.oracle.com/cd/E17952_01/connector-net-en/connector-net-entityframework-core-scaffold-example.html

	## Add dependencies
	# Entity Framework Core .NET Command Line Tools. Includes dotnet-ef.
	dotnet add package Microsoft.EntityFrameworkCore.Tools.DotNet;
	dotnet add package MySql.Data.EntityFrameworkCore;
	# dotnet add package MySql.Data.EntityFrameworkCore.Design; # See if this needed

	## Scaffold from database
	dotnet ef dbcontext scaffold \
	  "server=localhost;port=3306;user=root;password=mypass;database=sakila" \
	  MySql.Data.EntityFrameworkCore \
	  -o sakila
	```



***

## `dotnet ef --help`
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


## `dotnet ef dbcontext --help`
```text
Usage: dotnet ef dbcontext [options] [command]

Options:
  -h|--help        Show help information
  -v|--verbose     Show verbose output.
  --no-color       Don't colorize output.
  --prefix-output  Prefix output with level.

Commands:
  info      Gets information about a DbContext type.
  list      Lists available DbContext types.
  scaffold  Scaffolds a DbContext and entity types for a database.

Use "dbcontext [command] --help" for more information about a command.
```

## `dotnet ef dbcontext info --help`
```text
Usage: dotnet ef dbcontext info [options]

Options:
  --json                                 Show JSON output.
  -c|--context <DBCONTEXT>               The DbContext to use.
  -p|--project <PROJECT>                 The project to use.
  -s|--startup-project <PROJECT>         The startup project to use.
  --framework <FRAMEWORK>                The target framework.
  --configuration <CONFIGURATION>        The configuration to use.
  --runtime <RUNTIME_IDENTIFIER>         The runtime to use.
  --msbuildprojectextensionspath <PATH>  The MSBuild project extensions path. Defaults to "obj".
  --no-build                             Don't build the project. Only use this when the build is up-to-date.
  -h|--help                              Show help information
  -v|--verbose                           Show verbose output.
  --no-color                             Don't colorize output.
  --prefix-output                        Prefix output with level.
```

## `dotnet ef dbcontext list --help`
```text
Usage: dotnet ef dbcontext list [options]

Options:
  --json                                 Show JSON output.
  -p|--project <PROJECT>                 The project to use.
  -s|--startup-project <PROJECT>         The startup project to use.
  --framework <FRAMEWORK>                The target framework.
  --configuration <CONFIGURATION>        The configuration to use.
  --runtime <RUNTIME_IDENTIFIER>         The runtime to use.
  --msbuildprojectextensionspath <PATH>  The MSBuild project extensions path. Defaults to "obj".
  --no-build                             Don't build the project. Only use this when the build is up-to-date.
  -h|--help                              Show help information
  -v|--verbose                           Show verbose output.
  --no-color                             Don't colorize output.
  --prefix-output                        Prefix output with level.
```

## `dotnet ef dbcontext scaffold --help`
```text
Usage: dotnet ef dbcontext scaffold [arguments] [options]

Arguments:
  <CONNECTION>  The connection string to the database.
  <PROVIDER>    The provider to use. (E.g. Microsoft.EntityFrameworkCore.SqlServer)

Options:
  -d|--data-annotations                  Use attributes to configure the model (where possible). If omitted, only the fluent API is used.
  -c|--context <NAME>                    The name of the DbContext.
  --context-dir <PATH>                   The directory to put DbContext file in. Paths are relative to the project directory.
  -f|--force                             Overwrite existing files.
  -o|--output-dir <PATH>                 The directory to put files in. Paths are relative to the project directory.
  --schema <SCHEMA_NAME>...              The schemas of tables to generate entity types for.
  -t|--table <TABLE_NAME>...             The tables to generate entity types for.
  --use-database-names                   Use table and column names directly from the database.
  --json                                 Show JSON output.
  -p|--project <PROJECT>                 The project to use.
  -s|--startup-project <PROJECT>         The startup project to use.
  --framework <FRAMEWORK>                The target framework.
  --configuration <CONFIGURATION>        The configuration to use.
  --runtime <RUNTIME_IDENTIFIER>         The runtime to use.
  --msbuildprojectextensionspath <PATH>  The MSBuild project extensions path. Defaults to "obj".
  --no-build                             Don't build the project. Only use this when the build is up-to-date.
  -h|--help                              Show help information
  -v|--verbose                           Show verbose output.
  --no-color                             Don't colorize output.
  --prefix-output                        Prefix output with level.
```

## `dotnet ef database --help`
```text
Usage: dotnet ef database [options] [command]

Options:
  -h|--help        Show help information
  -v|--verbose     Show verbose output.
  --no-color       Don't colorize output.
  --prefix-output  Prefix output with level.

Commands:
  drop    Drops the database.
  update  Updates the database to a specified migration.

Use "database [command] --help" for more information about a command.
```


## `dotnet ef migrations --help`
```text
Usage: dotnet ef migrations [options] [command]

Options:
  -h|--help        Show help information
  -v|--verbose     Show verbose output.
  --no-color       Don't colorize output.
  --prefix-output  Prefix output with level.

Commands:
  add     Adds a new migration.
  list    Lists available migrations.
  remove  Removes the last migration.
  script  Generates a SQL script from migrations.

Use "migrations [command] --help" for more information about a command.
```


## Outputs
- from `dotnet add package Microsoft.EntityFrameworkCore.Tools.DotNet`
	```text
	info : Adding PackageReference for package 'Microsoft.EntityFrameworkCore.Tools.DotNet' into project '/70_Current/Work/RamzanV2/src/r2.act/r2.act.csproj'.
	log  : Restoring packages for /70_Current/Work/RamzanV2/src/r2.act/r2.act.csproj...
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.entityframeworkcore.tools.dotnet/index.json
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.entityframeworkcore.tools.dotnet/index.json 1004ms
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.entityframeworkcore.tools.dotnet/2.0.3/microsoft.entityframeworkcore.tools.dotnet.2.0.3.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.entityframeworkcore.tools.dotnet/2.0.3/microsoft.entityframeworkcore.tools.dotnet.2.0.3.nupkg 959ms
	log  : Installing Microsoft.EntityFrameworkCore.Tools.DotNet 2.0.3.
	info : Package 'Microsoft.EntityFrameworkCore.Tools.DotNet' is compatible with all the specified frameworks in project '/70_Current/Work/RamzanV2/src/r2.act/r2.act.csproj'.
	info : PackageReference for package 'Microsoft.EntityFrameworkCore.Tools.DotNet' version '2.0.3' added to file '/70_Current/Work/RamzanV2/src/r2.act/r2.act.csproj'.
	```
- From `dotnet add package MySql.Data.EntityFrameworkCore`
	```text
	info : Adding PackageReference for package 'MySql.Data.EntityFrameworkCore' into project '/media/sak/70_Current/Work/RamzanV2/src/r2.act/r2.act.csproj'.
	log  : Restoring packages for /media/sak/70_Current/Work/RamzanV2/src/r2.act/r2.act.csproj...
	info :   GET https://api.nuget.org/v3-flatcontainer/mysql.data.entityframeworkcore/index.json
	info :   OK https://api.nuget.org/v3-flatcontainer/mysql.data.entityframeworkcore/index.json 18201ms
	info :   GET https://api.nuget.org/v3-flatcontainer/mysql.data.entityframeworkcore/8.0.12/mysql.data.entityframeworkcore.8.0.12.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/mysql.data.entityframeworkcore/8.0.12/mysql.data.entityframeworkcore.8.0.12.nupkg 2014ms
	info :   GET https://api.nuget.org/v3-flatcontainer/mysql.data/index.json
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.entityframeworkcore.relational/index.json
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.entityframeworkcore.relational/index.json 1042ms
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.entityframeworkcore.relational/2.0.3/microsoft.entityframeworkcore.relational.2.0.3.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/mysql.data/index.json 1095ms
	info :   GET https://api.nuget.org/v3-flatcontainer/mysql.data/8.0.12/mysql.data.8.0.12.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.entityframeworkcore.relational/2.0.3/microsoft.entityframeworkcore.relational.2.0.3.nupkg 968ms
	info :   OK https://api.nuget.org/v3-flatcontainer/mysql.data/8.0.12/mysql.data.8.0.12.nupkg 969ms
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.entityframeworkcore/index.json
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.csharp/index.json
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.extensions.configuration.abstractions/index.json
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.entityframeworkcore/index.json 4776ms
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.entityframeworkcore/2.0.3/microsoft.entityframeworkcore.2.0.3.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.csharp/index.json 5818ms
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.csharp/4.4.0/microsoft.csharp.4.4.0.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.extensions.configuration.abstractions/index.json 5862ms
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.extensions.configuration.abstractions/2.0.2/microsoft.extensions.configuration.abstractions.2.0.2.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.entityframeworkcore/2.0.3/microsoft.entityframeworkcore.2.0.3.nupkg 4290ms
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.extensions.configuration.abstractions/2.0.2/microsoft.extensions.configuration.abstractions.2.0.2.nupkg 3706ms
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.csharp/4.4.0/microsoft.csharp.4.4.0.nupkg 3793ms
	info :   GET https://api.nuget.org/v3-flatcontainer/google.protobuf/index.json
	info :   GET https://api.nuget.org/v3-flatcontainer/system.configuration.configurationmanager/index.json
	info :   GET https://api.nuget.org/v3-flatcontainer/system.security.permissions/index.json
	info :   GET https://api.nuget.org/v3-flatcontainer/system.text.encoding.codepages/index.json
	info :   OK https://api.nuget.org/v3-flatcontainer/system.configuration.configurationmanager/index.json 3319ms
	info :   OK https://api.nuget.org/v3-flatcontainer/google.protobuf/index.json 3320ms
	info :   GET https://api.nuget.org/v3-flatcontainer/google.protobuf/3.5.1/google.protobuf.3.5.1.nupkg
	info :   GET https://api.nuget.org/v3-flatcontainer/system.configuration.configurationmanager/4.4.1/system.configuration.configurationmanager.4.4.1.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/google.protobuf/3.5.1/google.protobuf.3.5.1.nupkg 5869ms
	info :   OK https://api.nuget.org/v3-flatcontainer/system.configuration.configurationmanager/4.4.1/system.configuration.configurationmanager.4.4.1.nupkg 5872ms
	info :   GET https://api.nuget.org/v3-flatcontainer/system.security.cryptography.protecteddata/index.json
	info :   OK https://api.nuget.org/v3-flatcontainer/system.security.permissions/index.json 11012ms
	info :   OK https://api.nuget.org/v3-flatcontainer/system.text.encoding.codepages/index.json 11012ms
	info :   GET https://api.nuget.org/v3-flatcontainer/system.security.permissions/4.4.1/system.security.permissions.4.4.1.nupkg
	info :   GET https://api.nuget.org/v3-flatcontainer/system.text.encoding.codepages/4.4.0/system.text.encoding.codepages.4.4.0.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/system.security.cryptography.protecteddata/index.json 1890ms
	info :   GET https://api.nuget.org/v3-flatcontainer/system.security.cryptography.protecteddata/4.4.0/system.security.cryptography.protecteddata.4.4.0.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/system.security.permissions/4.4.1/system.security.permissions.4.4.1.nupkg 1875ms
	info :   OK https://api.nuget.org/v3-flatcontainer/system.text.encoding.codepages/4.4.0/system.text.encoding.codepages.4.4.0.nupkg 1881ms
	info :   OK https://api.nuget.org/v3-flatcontainer/system.security.cryptography.protecteddata/4.4.0/system.security.cryptography.protecteddata.4.4.0.nupkg 1038ms
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.extensions.caching.memory/index.json
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.extensions.dependencyinjection/index.json
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.extensions.logging/index.json
	info :   GET https://api.nuget.org/v3-flatcontainer/remotion.linq/index.json
	info :   GET https://api.nuget.org/v3-flatcontainer/system.collections.immutable/index.json
	info :   GET https://api.nuget.org/v3-flatcontainer/system.componentmodel.annotations/index.json
	info :   GET https://api.nuget.org/v3-flatcontainer/system.diagnostics.diagnosticsource/index.json
	info :   GET https://api.nuget.org/v3-flatcontainer/system.security.accesscontrol/index.json
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.extensions.dependencyinjection/index.json 1101ms
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.extensions.logging/index.json 1100ms
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.extensions.caching.memory/index.json 1102ms
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.extensions.dependencyinjection/2.0.0/microsoft.extensions.dependencyinjection.2.0.0.nupkg
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.extensions.caching.memory/2.0.2/microsoft.extensions.caching.memory.2.0.2.nupkg
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.extensions.logging/2.0.2/microsoft.extensions.logging.2.0.2.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/system.security.accesscontrol/index.json 976ms
	info :   GET https://api.nuget.org/v3-flatcontainer/system.security.accesscontrol/4.4.0/system.security.accesscontrol.4.4.0.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.extensions.caching.memory/2.0.2/microsoft.extensions.caching.memory.2.0.2.nupkg 985ms
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.extensions.logging/2.0.2/microsoft.extensions.logging.2.0.2.nupkg 997ms
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.extensions.caching.abstractions/index.json
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.extensions.dependencyinjection/2.0.0/microsoft.extensions.dependencyinjection.2.0.0.nupkg 1037ms
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.extensions.options/index.json
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.extensions.logging.abstractions/index.json
	info :   OK https://api.nuget.org/v3-flatcontainer/system.collections.immutable/index.json 2185ms
	info :   GET https://api.nuget.org/v3-flatcontainer/system.collections.immutable/1.4.0/system.collections.immutable.1.4.0.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/system.componentmodel.annotations/index.json 2191ms
	info :   GET https://api.nuget.org/v3-flatcontainer/system.componentmodel.annotations/4.4.0/system.componentmodel.annotations.4.4.0.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/system.diagnostics.diagnosticsource/index.json 2199ms
	info :   GET https://api.nuget.org/v3-flatcontainer/system.diagnostics.diagnosticsource/4.4.1/system.diagnostics.diagnosticsource.4.4.1.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/remotion.linq/index.json 2225ms
	info :   GET https://api.nuget.org/v3-flatcontainer/remotion.linq/2.1.1/remotion.linq.2.1.1.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/system.security.accesscontrol/4.4.0/system.security.accesscontrol.4.4.0.nupkg 975ms
	info :   GET https://api.nuget.org/v3-flatcontainer/system.security.principal.windows/index.json
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.extensions.caching.abstractions/index.json 971ms
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.extensions.caching.abstractions/2.0.2/microsoft.extensions.caching.abstractions.2.0.2.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.extensions.logging.abstractions/index.json 959ms
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.extensions.options/index.json 982ms
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.extensions.logging.abstractions/2.0.2/microsoft.extensions.logging.abstractions.2.0.2.nupkg
	info :   GET https://api.nuget.org/v3-flatcontainer/microsoft.extensions.options/2.0.2/microsoft.extensions.options.2.0.2.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/system.diagnostics.diagnosticsource/4.4.1/system.diagnostics.diagnosticsource.4.4.1.nupkg 954ms
	info :   OK https://api.nuget.org/v3-flatcontainer/system.componentmodel.annotations/4.4.0/system.componentmodel.annotations.4.4.0.nupkg 976ms
	info :   OK https://api.nuget.org/v3-flatcontainer/system.collections.immutable/1.4.0/system.collections.immutable.1.4.0.nupkg 1006ms
	info :   OK https://api.nuget.org/v3-flatcontainer/remotion.linq/2.1.1/remotion.linq.2.1.1.nupkg 1006ms
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.extensions.caching.abstractions/2.0.2/microsoft.extensions.caching.abstractions.2.0.2.nupkg 325ms
	info :   OK https://api.nuget.org/v3-flatcontainer/system.security.principal.windows/index.json 968ms
	info :   GET https://api.nuget.org/v3-flatcontainer/system.security.principal.windows/4.4.0/system.security.principal.windows.4.4.0.nupkg
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.extensions.options/2.0.2/microsoft.extensions.options.2.0.2.nupkg 962ms
	info :   OK https://api.nuget.org/v3-flatcontainer/microsoft.extensions.logging.abstractions/2.0.2/microsoft.extensions.logging.abstractions.2.0.2.nupkg 1002ms
	info :   OK https://api.nuget.org/v3-flatcontainer/system.security.principal.windows/4.4.0/system.security.principal.windows.4.4.0.nupkg 427ms
	log  : Installing System.Security.Principal.Windows 4.4.0.
	log  : Installing Microsoft.Extensions.Logging.Abstractions 2.0.2.
	log  : Installing Microsoft.Extensions.Options 2.0.2.
	log  : Installing Microsoft.Extensions.Caching.Abstractions 2.0.2.
	log  : Installing System.Security.AccessControl 4.4.0.
	log  : Installing System.Security.Cryptography.ProtectedData 4.4.0.
	log  : Installing Microsoft.Extensions.Logging 2.0.2.
	log  : Installing Microsoft.Extensions.Caching.Memory 2.0.2.
	log  : Installing Remotion.Linq 2.1.1.
	log  : Installing System.ComponentModel.Annotations 4.4.0.
	log  : Installing System.Collections.Immutable 1.4.0.
	log  : Installing MySql.Data.EntityFrameworkCore 8.0.12.
	log  : Installing MySql.Data 8.0.12.
	log  : Installing Microsoft.EntityFrameworkCore.Relational 2.0.3.
	log  : Installing Microsoft.Extensions.Configuration.Abstractions 2.0.2.
	log  : Installing Microsoft.CSharp 4.4.0.
	log  : Installing Microsoft.EntityFrameworkCore 2.0.3.
	log  : Installing System.Configuration.ConfigurationManager 4.4.1.
	log  : Installing Google.Protobuf 3.5.1.
	log  : Installing System.Diagnostics.DiagnosticSource 4.4.1.
	log  : Installing Microsoft.Extensions.DependencyInjection 2.0.0.
	log  : Installing System.Security.Permissions 4.4.1.
	log  : Installing System.Text.Encoding.CodePages 4.4.0.
	info : Package 'MySql.Data.EntityFrameworkCore' is compatible with all the specified frameworks in project '/media/sak/70_Current/Work/RamzanV2/src/r2.act/r2.act.csproj'.
	info : PackageReference for package 'MySql.Data.EntityFrameworkCore' version '8.0.12' added to file '/media/sak/70_Current/Work/RamzanV2/src/r2.act/r2.act.csproj'.
	```
- From .csproj file
	```xml
	<Project Sdk="Microsoft.NET.Sdk.Web">

	  <PropertyGroup>
	    <TargetFramework>netcoreapp2.1</TargetFramework>
	  </PropertyGroup>

	  <ItemGroup>
	    <PackageReference Include="Microsoft.AspNetCore.App" />
	    <PackageReference Include="Microsoft.EntityFrameworkCore.Tools.DotNet" Version="2.0.3" />
	    <PackageReference Include="MySql.Data.EntityFrameworkCore" Version="8.0.12" />
	  </ItemGroup>

	</Project>
	```
