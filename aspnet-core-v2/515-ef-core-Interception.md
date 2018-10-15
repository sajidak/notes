# Command Interception in Entity Framework Core
> similar to IDbCommandInterceptorin ef6

## Links
- https://weblogs.asp.net/ricardoperes/interception-in-entity-framework-core
- See also
	- IQuerySqlGenerator, IQueryCompiler
	- https://weblogs.asp.net/dixin/entity-framework-core-and-linq-to-entities-5-query-translation-implementation


## Using DiagnosticSource
- Diagnostics
	- https://github.com/aspnet/Diagnostics
- need the Microsoft.Extensions.DiagnosticAdapter NuGet package
	- https://www.nuget.org/packages/Microsoft.Extensions.DiagnosticAdapter/
```cs
public class CommandListener
{
    [DiagnosticName("Microsoft.EntityFrameworkCore.Database.Command.CommandExecuting")]
    public void OnCommandExecuting(DbCommand command, DbCommandMethod executeMethod, Guid commandId, Guid connectionId, bool async, DateTimeOffset startTime)
    {
    }

    [DiagnosticName("Microsoft.EntityFrameworkCore.Database.Command.CommandExecuted")]
    public void OnCommandExecuted(object result, bool async)
    {
    }

    [DiagnosticName("Microsoft.EntityFrameworkCore.Database.Command.CommandError")]
    public void OnCommandError(Exception exception, bool async)
    {
    }
}
```
- Hook these methods to EF Core
	```cs
	var listener = ctx.GetService<DiagnosticSource>();
	(listener as DiagnosticListener).SubscribeWithAdapter(new CommandListener());
	```
- OnCommandExecuted method
	- ctx is a DbContext,
	- not registered as DiagnosticSource service
	- need to add a subscriber
	- result parameter will contain either
		- a scalar (in the case of a ExecuteScalar/ExecuteScalarAsync call),
		- a number (for ExecuteNonQuery/ExecuteNonQueryAsync) or
		- a RelationalDataReader object (in the case of a ExecuteReader/ExecuteReaderAsync call)
	- async, will tell what version of the method was executed.
- OnCommandExecuting method
- get access to the DbCommand that is about to execute the SQL command
- and can modify its SQL or parameters.


## Using
- can use this whenever you have a reference to the context,
- but not from inside one of the infrastructure method (OnConfiguring, OnModelCreating).
- You should do this before you actually issue any queries.
- need to add a using declaration for Microsoft.EntityFrameworkCore.Infrastructure.
-


## ASP.NET Core Diagnostics
> https://github.com/aspnet/Diagnostics
- Diagnostics middleware for reporting info and handling exceptions and errors in ASP.NET Core,
- and diagnosing Entity Framework Core migrations errors.
