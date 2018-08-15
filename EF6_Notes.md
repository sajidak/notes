# Entity Framework Core 2.1
## Links
- https://docs.microsoft.com/en-us/ef/core/get-started/install/
- https://www.learnentityframeworkcore.com/walkthroughs/existing-database
- https://docs.microsoft.com/en-us/ef/core/get-started/aspnetcore/existing-db
- http://www.entityframeworktutorial.net/efcore/create-model-for-existing-database-in-ef-core.aspx
- https://ef.readthedocs.io/en/staging/platforms/aspnetcore/existing-db.html

### Other
- https://docs.microsoft.com/en-us/aspnet/core/data/ef-mvc/intro?view=aspnetcore-2.1
- https://docs.microsoft.com/en-us/aspnet/core/tutorials/web-api-vsc?view=aspnetcore-2.1
- https://msdn.microsoft.com/en-us/magazine/mt767698.aspx
-
- https://blog.couchbase.com/net-core-with-visual-studio-code/
	- ext install net-core-project-manager or ext install csharp
- https://blogs.msdn.microsoft.com/benjaminperkins/2017/10/18/how-to-install-nuget-package-in-visual-studio-code-linux-ubuntu/
- https://docs.microsoft.com/en-us/ef/core/extensions/
	- https://github.com/ErikEJ/SqlCeToolbox/wiki/EF-Core-Power-Tools
	- https://github.com/Arch/AutoHistory/
	- https://github.com/riezebosch/efcore-practices/tree/master/src/EFCore.Practices/

### MySQL
- https://dev.mysql.com/doc/connector-net/en/connector-net-entityframework-core.html
- https://www.nuget.org/packages/MySql.Data.EntityFrameworkCore/
	- https://www.nuget.org/packages/MySql.Data/
	- https://www.nuget.org/packages/Microsoft.EntityFrameworkCore.Relational/
	- https://www.nuget.org/packages/Microsoft.EntityFrameworkCore/
	- https://dev.mysql.com/doc/connector-net/en/connector-net-entityframework-core-scaffold-example.html
	- **[Sample DB - Sakila](https://dev.mysql.com/doc/sakila/en/)**
	- - **[Sample DB - World](https://dev.mysql.com/doc/world-setup/en/)**

### vscode extensions
- CSharp2TS [ rafaelsalguero.csharp2ts ]
- C# XML Documentation Comments [ k--kato.docomment ]
- XML Tools [ qub.qub-xml-vscode ]
- XML Tools [ dotjoshjohnson.xml ]

# Entity Framework 6.1.3

## Further Reading
- [T4 Templates](https://www.exceptionnotfound.net/using-t4-templates-to-generate-enums-from-database-lookup-tables/)
	- its a code generator and anything not surround by <# #> is standard text
- EntityFramework.CodeTemplates
- http://msftdbprodsamples.codeplex.com/releases/view/55330
- https://gist.github.com/gabehesse/1002735

## System.Data.Entity
### DbFunctions
- `public static string Left(string stringArgument, long? length)`
- `public static string Right(string stringArgument, long? length)`
- `public static System.DateTime? AddDays(System.DateTime? dateValue, int? addValue)`
- `public static int? DiffDays(System.DateTime? dateValue1, System.DateTime? dateValue2)`


## Enum as Data Type
- https://visualstudiomagazine.com/articles/2017/02/01/enumerated-values.aspx
- http://eliot-jones.com/2015/03/entity-framework-enum
- https://www.codeproject.com/Articles/417283/Creating-Enums-from-Database-Lookup-Tables
- **DO:** Set manually in designer, and look are generated code
- **Tip:** in C# code, can use `[Display(Name="Light Brown")]`


## Lookup Tables
- lookup tables are more flexible than enumerations
- You can usually bind lookup tables to UI features (like dropdown lists) more easily than you can bind enumerated values;
- lookup tables can be integrated into SQL statements where Enums can not;


## DBEntityEntry Class
- useful in retrieving various information about an entity
- `DBEntityEntry studentEntry = dbcontext.Entry(StudentEntity);`

## Local Data
- The Local property of DBSet provides simple access to the entities that are currently being tracked by the context
- , and have not been marked as Deleted.
- Local keeps track of entities whose entity state is added, modified and unchanged.
- `foreach (var student in ctx.Students.Local)`

## Loading
Reference() method and Collection() method of DbEntityEntry
- Use the Collection() method instead of Reference() method to load collection navigation property.
- `context.Entry(student).Reference(s => s.Standard).Load();`
	- loads student but not standard
- `context.Entry(student).Collection(s => s.Courses).Load();`
	- loads the courses of student.
	- The Load extension method works just like ToList, except that it avoids the creation of the list altogether.


## DataAnnotations
**System.ComponentModel.DataAnnotations**
- `ConcurrencyCheck`
	- ConcurrencyCheck attribute can be applied to a property of a domain class. Code First takes the value of a column in "where" clause when EF executes update command for the table. You can use ConcurrencyCheck attribute when you want to use existing column for concurrency check and not a separate timestamp column for concurrency.
- `Timestamp`
	- It's more common to use rowversion or timestamp fields for concurrency checking. But rather than using the ConcurrencyCheck annotation, you can use the more specific TimeStamp annotation as long as the type of the property is byte array. Code first will treat Timestamp properties the same as ConcurrencyCheck properties, but it will also ensure that the database field that code first generates is non-nullable. You can only have one timestamp property in a given class.
- `MinLength` & `MaxLength`

**System.ComponentModel.DataAnnotations.Schema**
- `NotMapped`
	- apply NotMapped attribute to a property which you do NOT want to create a column in a database table for
- `ForeignKey`
- `InverseProperty`
	- The InverseProperty is used when you have multiple relationships between classes.
- `DatabaseGenerated`
	- `[DatabaseGenerated(DatabaseGenerationOption.Computed)]`
	- An important database features is the ability to have computed properties. If you're mapping your Code First classes to tables that contain computed columns, you don't want Entity Framework to try to update those columns. But you do want EF to return those values from the database after you've inserted or updated data. You can use the DatabaseGenerated annotation to flag those properties in your class along with the Computed enum. Other enums are None and Identity.

### Other Annotations


## MSSQL Sequence
- https://surilpatel.wordpress.com/2012/11/02/entity-framework-with-sequence-for-inserts/
- `select NEXT VALUE FOR  dbo.Student_Sequence`
- http://www.proficiencyconsulting.com/ShowArticle.aspx?ID=23
