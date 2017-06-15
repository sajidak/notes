Offline Resources:

*	MVC6-Ttr-Getting-started
	https://docs.microsoft.com/en-us/aspnet/core/tutorials/first-mvc-app/start-mvc

*	MVC5-Ttr-Getting-started
	https://www.asp.net/mvc/overview/getting-started/mvc-learning-sequence
	
MVC6-REF-Getting_Started-A-Overview
	https://www.asp.net/mvc/overview/getting-started/mvc-learning-sequence
	https://www.asp.net/mvc/overview/getting-started/recommended-resources-for-mvc
MVC6-REF-Getting_Started-B-Models
MVC6-REF-Getting_Started-C-Views
MVC6-REF-Getting_Started-D-Controllers

*	MVC6-REF-Docs-0-Fundamentals
*	MVC6-REF-Docs-0-Introduction
*	MVC6-REF-Docs-A
		https://docs.microsoft.com/en-us/aspnet/core/mvc/
		https://docs.microsoft.com/en-us/aspnet/core/mvc/overview
		https://github.com/aspnet/home/releases
*	MVC6-REF-Docs-B-Models
*	MVC6-REF-Docs-C-Views
*	MVC6-REF-Docs-D-Controllers
*	MVC6-REF-Docs-E-Extras
		unobtrusive validation
		http://jqueryvalidation.org/documentation/
		Lookup Data into MVC6 View
		http://blog.simontimms.com/2015/06/09/getting-lookup-data-into-you-view/
		Explicit Dependencies Principle 
		http://deviq.com/explicit-dependencies-principle

*	MVC6-Cookie-Middleware-Authentication

*	MVC5-Web-API-2
*	MVC6-Web-API-2

MVC5-GEN-A-
	https://www.asp.net/mvc/overview/getting-started/mvc-learning-sequence
	http://www.dotnettricks.com/learn/mvc/understanding-model-view-controller-in-aspnet-mvc
	http://astutelogic.com/nesting-layouts-in-mvc/
	https://msdn.microsoft.com/en-us/library/bb398933.aspx
	
*	MSDN-aspnet-core-conceptual-live.pdf

EF6
Department deletedDepartment = new Department();
TryUpdateModel(deletedDepartment, fieldsToBind);
ModelState.AddModelError(string.Empty,
	"Unable to save changes. The department was deleted by another user.");


NuGet Packages:
Microsoft.AspNetCore.Authentication.Cookies

	
	

http://afana.me/post/aspnet-mvc-internationalization.aspx
int value = 5600;
 
Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("es-CL");
Console.WriteLine(DateTime.Now.ToShortDateString());
Console.WriteLine(value.ToString("c"));
 
Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("es-MX");
Console.WriteLine(DateTime.Now.ToShortDateString());
Console.WriteLine(value.ToString("c"));
 
// Output
26-07-2011 // Date in es-CL, Spanish (Chile)
$5.600,00 // Currency in es-CL, Spanish (Chile)
 
26/07/2011 // Date in es-MX, Spanish (Mexico)
$5,600.00 // Currency in es-MX, Spanish (Mexi
