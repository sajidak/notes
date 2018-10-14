# Dependency injection into views
> https://docs.microsoft.com/en-us/aspnet/core/mvc/views/dependency-injection?view=aspnetcore-2.1

**Interesting Reads**

1. https://blog.simontimms.com/2015/06/09/getting-lookup-data-into-you-view/


***

- useful for view-specific services, such as localization or data required only for populating view elements
- Try to maintain separation of concerns between your controllers and views
- inject a service into a view using the `@inject` directive.
- The syntax for `@inject`:
	- `@inject <type> <name>`
- e.g. with lines redacted for brevity
	```aspx-csharp
	@model IEnumerable<ToDoItem>
	@inject StatisticsService StatsService
	<!DOCTYPE html>
	<html>
	<head>
	    <title>To Do Items</title>
	</head>
	<body>
	    <div>
	        <h1>To Do Items</h1>
	        <ul>
	            <li>Total Items: @StatsService.GetCount()</li>
	            <li>Completed: @StatsService.GetCompletedCount()</li>
	            <li>Avg. Priority: @StatsService.GetAveragePriority()</li>
	        </ul>
	        <table>
	            <tr>
	                <th>Name</th>
	                <th>Priority</th>
	                <th>Is Done?</th>
	            </tr>
	            @foreach (var item in Model)
	            {
	                <tr>
	                    <td>@item.Name</td>
	                    <td>@item.Priority</td>
	                    <td>@item.IsDone</td>
	                </tr>
	            }
	        </table>
	    </div>
	</body>
	</html>
	```

- service is registered for dependency injection in ConfigureServices in Startup.cs:
	```cs
	// For more information on how to configure your application, visit http://go.microsoft.com/fwlink/?LinkID=398940
	public void ConfigureServices(IServiceCollection services)
	{
	    services.AddMvc();

	    services.AddTransient<IToDoItemRepository, ToDoItemRepository>();
	    services.AddTransient<StatisticsService>();
	}
	```


## Populating Lookup Data
> https://docs.microsoft.com/en-us/aspnet/core/mvc/views/dependency-injection?view=aspnetcore-2.1#populating-lookup-data
- raw Code samples, till notes are done better
- cshtml
	```
	@using System.Threading.Tasks
	@using ViewInjectSample.Model.Services
	@model ViewInjectSample.Model.Profile
	@inject ProfileOptionsService Options
	<!DOCTYPE html>
	<html>
	<head>
	    <title>Update Profile</title>
	</head>
	<body>
	<div>
	    <h1>Update Profile</h1>
	    Name: @Html.TextBoxFor(m => m.Name)
	    <br/>
	    Gender: @Html.DropDownList("Gender",
	           Options.ListGenders().Select(g =>
	                new SelectListItem() { Text = g, Value = g }))
	    <br/>

	    State: @Html.DropDownListFor(m => m.State.Code,
	           Options.ListStates().Select(s =>
	                new SelectListItem() { Text = s.Name, Value = s.Code}))
	    <br />

	    Fav. Color: @Html.DropDownList("FavColor",
	           Options.ListColors().Select(c =>
	                new SelectListItem() { Text = c, Value = c }))
	    </div>
	</body>
	</html>
	```
	- Part of interest
		```
		@Html.DropDownList("Gender",
		  Options.ListGenders().Select(g =>
		    new SelectListItem() { Text = g, Value = g }))
		```
- ProfileOptionsService
	```cs
	using System.Collections.Generic;

	namespace ViewInjectSample.Model.Services
	{
	    public class ProfileOptionsService
	    {
	        public List<string> ListGenders()
	        {
	            // keeping this simple
	            return new List<string>() {"Female", "Male"};
	        }

	        public List<State> ListStates()
	        {
	            // a few states from USA
	            return new List<State>()
	            {
	                new State("Alabama", "AL"),
	                new State("Alaska", "AK"),
	                new State("Ohio", "OH")
	            };
	        }

	        public List<string> ListColors()
	        {
	            return new List<string>() { "Blue","Green","Red","Yellow" };
	        }
	    }
	}
	```
- register types you request through dependency injection in Startup.ConfigureServices
- un unregistered type throws an exception at runtime because the service provider is internally queried via GetRequiredService.

> If you want to extend existing services,
>   you can simply use this technique while inheriting from
>   or wrapping the existing implementation with your own.
