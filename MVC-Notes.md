# Add Title
Wed, 07-Jun-2017 20:20:57 +0530

**Contents:**

pL_PRODUCTS.en

[TOC]
## TODO:
- Seperate MVC5 and MVC Core information
	- _AppStart.cshtml
	- Dependency Injection
- EF6 with MVC5
	- https://docs.microsoft.com/en-us/aspnet/mvc/overview/getting-started/getting-started-with-ef-using-mvc/
	
## See:
- MVC documentation
	- https://www.asp.net/mvc
	- https://docs.microsoft.com/en-us/aspnet/mvc/mvc5
	- https://docs.microsoft.com/en-us/aspnet/mvc/overview/getting-started/introduction/getting-started
	- https://docs.microsoft.com/en-us/aspnet/mvc/overview/views/using-page-inspector-in-aspnet-mvc
- [Accessing Settings from a Controller](https://docs.microsoft.com/en-us/aspnet/core/mvc/controllers/dependency-injection#accessing-settings-from-a-controller)
- [Getting Started with ASP.NET MVC 5](https://docs.microsoft.com/en-gb/aspnet/mvc/overview/getting-started/introduction/getting-started)


## File Upload
- View
	```
	@using (Html.BeginForm("Create", "Student", null, FormMethod.Post, new {enctype = "multipart/form-data"}))
	```
	```html
	<input type="submit" value="Create" class="btn btn-default" />
	```
- Controller
	```cs
	public ActionResult Create(
		[Bind(Include = "LastName, FirstMidName, EnrollmentDate")]Student student
			, HttpPostedFileBase upload
			)
	```
	- Parameter name **upload** should matche the name attribute's value of the input type="file", so that the MVC model binder can bind the uploaded file to the parameter
	- To save to file system
	```cs
	// TODO: use same extension as uploaded file

	/* Using HttpPostedFileBase  upload */
	if (upload != null)
	{
		string path = Path.Combine(
							  Server.MapPath("~/UploadedFiles")
							, Path.GetFileName(upload.FileName)
							);
		upload.SaveAs(path);
	}
	ViewBag.FileStatus = "File uploaded successfully.";

	/* Using HttpPostedFileBase upload */
	var Inputfile = Request.Files[0];
	if (Inputfile != null && Inputfile.ContentLength > 0)
	{
		var filename = Path.GetFileName(Inputfile.FileName);
		var path = Path.Combine(Server.MapPath("~/uploadedfile/"), filename);
		Inputfile.SaveAs(path);
		ViewBag.FileStatus = "File uploaded successfully.";
	}
	```
- Links
	- https://www.mikesdotnetting.com/article/259/asp-net-mvc-5-with-ef-6-working-with-files
	- http://www.c-sharpcorner.com/article/uploading-files-using-strongly-typed-fileuploader-in-Asp-Net/
	- both in `File-upload-MVC5.mht`

## Page.User
	- System.Web.WebPages.HelperPage
	- System.Security.Principal.IPrincipal
		- System.Security.Principal.GenericPrincipal
	- System.Security.Principal.IIdentity
		- System.Security.Principal.GenericIdentity
		- System.Security.Claims.Claim (see http://schemas.microsoft.com/ws/2008/06/identity/claims/version)

## Razor
- `@inject SignInManager Manager` usage
	- https://docs.microsoft.com/en-us/aspnet/core/mvc/views/dependency-injection
	- **http://blog.simontimms.com/2015/06/09/getting-lookup-data-into-you-view/**
- `RunPage()`
	- run the requested page explicitly by calling the RunPage method
	- [ ] get short note for this
- **Authentication**
	```cs
	@{
    if (!WebSecurity.IsAuthenticated) {
        Response.Redirect("~/Account/Login?returnUrl=" + Request.Url.LocalPath);
    }
    Layout = "~/_SiteLayout.cshtml";
    Page.Title = "Members Information";
	}
	```

	```cs
	@if ( Roles.IsUserInRole("admin")) {
	    <span> Welcome <b>@WebSecurity.CurrentUserName</b>! </span>
	}
	else {
	     Response.Redirect("~/AdminError");
	}
	```

## Layout
- The leading underscore ( _ ) character is significant. If a page's name starts with an underscore, ASP.NET won't directly send that page to the browser
- Look Up
	- `@RenderBody()`
	- `@RenderSection()`
- [MVC3+] The `@RenderSection` syntax goes into the Shared View, such as:
```
<div id="sidebar">
    @RenderSection("Sidebar", required: false)
</div>
```
This would then be placed in your view with `@Section` syntax:
```
@section Sidebar{
    <!-- Content Here -->
}
```
- Link Layout by
	- `Layout = "~/_Layout.cshtml";` in xyz.cshtml page
- The `Page` object is available on all .cshtml pages
	- to share information between a page and its layout.
		- in xyz.cshtml `Page.Title = "List Movies";`
		- in _layout.cshtml `<title>@Page.Title</title>`
	- is a dynamic object
	-  can pass any number of values by using the Page object
- **xyz.cshtml**
	- C# Code block withins `@{ ... }`
	- Inline code within HTML `@(technology + " " + product)` or `@Request.Url`
	- The `@` character tells ASP.NET that what follows is Razor code, not HTML.
		- ASP.NET will treat everything after the @ character as code until it runs into some HTML again.
- Test for POST
	```cs
	@if(IsPost){
	  <p>You submitted the page at @DateTime.Now</p>
	}
	```
- `WebGrid` helper
	- produces a display in a grid or table
	- `var grid = new WebGrid(source: selectedData);`
	```js
	<div>
	    @grid.GetHtml()
	</div>
	```
	- can specify only certain columns to display, by default all are displayed
	``` js
	@grid.GetHtml(
	    columns: grid.Columns(
	        grid.Column("Title"),
	        grid.Column("Genre"),
	        grid.Column("Year")
	    )
	)
	```
	- Add paging `var grid = new WebGrid(source: selectedData, rowsPerPage: 3);`

## _AppStart.cshtml
**Is this relevent to MVC5?**
- `_AppStart.cshtml` file, which is a special file that's used to contain global settings
	- **ATTN** If any errors occur in code in the _AppStart.cshtml file, the website won't start.
	- can set values for helpers that you use in your site and that have to be initialized
	```
	@{
		AppState["customAppName"] = "Application Name";

		// Initialize WebMail helper
		WebMail.SmtpServer = "your-SMTP-host";
		WebMail.SmtpPort = 25;
		WebMail.UserName = "your-user-name-here";
		WebMail.Password = "your-account-password";
		WebMail.From = "your-email-address-here";
		WebMail.EnableSsl=true; // To enable ssl connection to webmail
	}
	```
	- can write code that runs before (and after) any page in a particular folder run
	- If you don't include `RunPage`, all the code in _PageStart.cshtml runs, and then the requested page runs automatically
	- can put a _PageStart.cshtml file in the root of the site and in any subfolder.
	- When a page is requested,
		- the _PageStart.cshtml file at the top-most level (nearest to the site root) runs,
		- followed by the _PageStart.cshtml file in the next subfolder,
		- and so on down the subfolder structure
		- until the request reaches the folder that contains the requested page.
	- After all the applicable _PageStart.cshtml files have run, the requested page runs.
	- to Handle Errors
	```cs
	@{
	    try
	    {
	        RunPage();
	    }
	    catch (Exception ex)
	    {
	        Response.Redirect("~/Error.cshtml?source=" +
	            HttpUtility.UrlEncode(Request.AppRelativeCurrentExecutionFilePath));
	    }
	}
	```
	- to Restrict Folder Access
	```cs
	@{
	    Response.CacheControl = "no-cache";
	    if (!WebSecurity.IsAuthenticated) {
	        var returnUrl = "~/Account/Login?ReturnUrl=" + Request.Url.LocalPath;
	        Response.Redirect(returnUrl);
	    }
	}
	```

## Dependency Injection
- Appears to be for **MVC Core**, for MVC5 see
	- http://sarangasl.blogspot.in/2015/04/mvc-5-with-unity-for-dependency.html
	- http://www.c-sharpcorner.com/UploadFile/dacca2/implement-ioc-using-unity-in-mvc-5/
- The ConfigureServices method in the Startup class is responsible for defining the services the application will use, including platform features like Entity Framework
- register our dependencies in our Startup object so that ASP.NET knows about them
	- in `ConfigureServices` method of `Startup.cs`
	- e.g.
	```cs
	public void ConfigureServices(IServiceCollection services)
	{
		services.AddInstance<IGreetingService>(new GreetingService());
		services.AddSingleton<IGreetingService, GreetingService>();
		services.AddTransient<IGreetingService, GreetingService>();
		services.AddScoped<IGreetingService, GreetingService>();
	}
	```
	- `AddInstance` any time a component asks for IGreetingService, this specific instance should be given
	- `AddSingleton` create one and only one instance of IGreetingService, and any components wanting an IGreetingService will use the same shared instance
	- `AddTransient` indicates that the given dependency should be constructed afresh every time it is needed
	- `AddScoped` the exact same instance will be returned, even from different components like our Controller and View
	- The only material difference between `AddInstance` and `AddSingleton` is that we dont have to construct it explicitly, it will be handled by ASP.NET instead
- declare the dependency we need in the constructor, and the ASP.NET 5 framework will pass it in
- Constructor injection requires that the constructor in question be public. Otherwise, your app will throw an InvalidOperationException
- `Request` Services
	- The services available within an ASP.NET request from HttpContext are exposed through the RequestServices collection.
	- Request Services represent the services you configure and request as part of your application. When your objects specify dependencies, these are satisfied by the types found in RequestServices, not ApplicationServices

## Logging
https://docs.microsoft.com/en-us/aspnet/core/fundamentals/logging

## Routing
https://blogs.msdn.microsoft.com/webdev/2013/10/17/attribute-routing-in-asp-net-mvc-5/

## AppSettings from web.config
- [Example 1](https://www.codeproject.com/Articles/1012286/Read-web-config-Settings)
	```cs
	public static string GetAppSettingUsingConfigurationManager(string customField)
	{
	    return System.Configuration.ConfigurationManager.AppSettings[customField];
	}

	public static string GetAppSetting(string customField)
	{
	    System.Configuration.Configuration config =
	        System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(null);
	    if (config.AppSettings.Settings.Count > 0)
	    {
	        var customSetting = config.AppSettings.Settings[customField].ToString();
	        if (!string.IsNullOrEmpty(customSetting))
	        {
	            return customSetting;
	        }
	    }
	    return null;
	}
	```
	```xml
	<appSettings>
	    <add key="webpages:Version" value="3.0.0.0" />
	    <add key="webpages:Enabled" value="false" />
	    <add key="ClientValidationEnabled" value="true" />
	    <add key="UnobtrusiveJavaScriptEnabled" value="true" />
	    <add key="DatabaseINILocation" value="C:\config\config.ini" />
	    <add key="testPort" value="49610" />
	</appSettings>
	```
- Links
	- [MVC6](https://neelbhatt40.wordpress.com/2015/12/15/getting-a-configuration-value-in-asp-net-5-vnext-and-mvc-6/)
	- http://www.jwc3.net/2014/06/tidy-up-your-webconfig.html
