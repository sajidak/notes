# NLog with SQL CE 4.0
- https://github.com/nlog/NLog/wiki/Database-target
	```xml
	<target name="database" xsi:type="Database">
	   <commandText>INSERT INTO [tblException] (ExceptionDateTime, Message) GETDATE(), @message FROM tblDbVersion</commandText>

	   <parameter name="@message" layout="${message}" />

	   <dbProvider>System.Data.SqlServerCe.4.0</dbProvider>
	   <connectionString>Data Source=${basedir}\Database.sdf</connectionString>
	</target>
	```
- https://www.myasp.net/support/kb/a253/how-do-i-use-sql-ce-4_0-database-with-myasp_net-hosting-account_.aspx?KBSearchID=485269
- https://www.myasp.net/support/kb/a258/asp-and-asp_net-connection-strings-for-access-and-mssql-databases.aspx?KBSearchID=485269
- https://www.microsoft.com/en-us/download/details.aspx?id=30709
- Also
	- https://www.myasp.net/support/kb/a1930/html-to-pdf-conversion-using-syncfusion-pdf.aspx?KBSearchID=485269
	- https://www.myasp.net/support/kb/a1702/sample-process-to-generate-pdf-with-rotativa-in-asp_net-mvc.aspx
	- https://blogs.msdn.microsoft.com/dotnet/2016/11/09/net-core-data-access/


## SQL CE 4.0 in asp.net core 2.0
- https://github.com/ErikEJ/EntityFramework.SqlServerCompact/wiki/Using-EF-Core-with-SQL-Server-Compact-in-Traditional-.NET-Applications
	- https://github.com/ErikEJ/EntityFramework.SqlServerCompact/wiki/Limitations
- dotnet add package EntityFrameworkCore.SqlServerCompact40 --version 2.1.2.1
	- dotnet add package Microsoft.EntityFrameworkCore.Relational --version 2.1.4
	- dotnet add package Microsoft.SqlServer.Compact --version 4.0.8876.1

## NLog Installing tarhets
> https://github.com/NLog/NLog/wiki/Installing-targets
```xml
<target xsi:type="Database" name="db"
        connectionStringName="LoggingDatabase">
    <install-command>
        <text>
            <!--
            NOTE: call LogManager.Configuration.Install(new InstallationContext());
                  to execute this query.
            -->
            CREATE TABLE ${var:logTableName} (
            Id bigint primary key not null identity(1,1),
            Logged datetime2,
            Level nvarchar(10),
            LogMessage nvarchar(max),
            MessageUid uniqueidentifier,
            MessagePartUid uniqueidentifier,
            MessagePartDataUid uniqueidentifier,
            )
        </text>
        <ignoreFailures>false</ignoreFailures>
    </install-command>
</target>
```
