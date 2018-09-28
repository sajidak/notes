# Filters
> https://docs.microsoft.com/en-us/aspnet/core/mvc/controllers/filters?view=aspnetcore-2.1

- Filters in ASP.NET Core MVC allow you to run code before or after specific stages in the request processing pipeline.
- Built-in filters handle tasks such as:
    - Authorization (preventing access to resources a user isn't authorized for).
    - Ensuring that all requests use HTTPS.
    - Response caching (short-circuiting the request pipeline to return a cached response).
- Filters run within the MVC action invocation pipeline, sometimes referred to as the filter pipeline. 
- The filter pipeline runs after MVC selects the action to execute.
- 

## Filter types
Each filter type is executed at a different stage in the filter pipeline.

- **Authorization filters** 
	- run first and are used to determine whether the current user is authorized for the current request. 
	- They can short-circuit the pipeline if a request is unauthorized.

- **Resource filters** 
	- are the first to handle a request after authorization. 
	- They can run code before the rest of the filter pipeline, and after the rest of the pipeline has completed. 
	- They're useful to implement caching or otherwise short-circuit the filter pipeline for performance reasons. 
	- They run before model binding, so they can influence model binding.
	- Implement either the `IResourceFilter` or `IAsyncResourceFilter` interface,
	- Their execution wraps most of the filter pipeline.

- **Action filters** 
	- can run code immediately before and after an individual action method is called. 
	- They can be used to manipulate the arguments passed into an action and the result returned from the action.
	- Implement either the `IActionFilter` or `IAsyncActionFilter` interface.
	- Their execution surrounds the execution of action methods.

- **Exception filters** 
	- are used to apply global policies to unhandled exceptions that occur before anything has been written to the response body.
	- Exception filters implement either the `IExceptionFilter` or `IAsyncExceptionFilter` interface. 
	- They can be used to implement common error handling policies for an app.

- **Result filters** 
	- can run code immediately before and after the execution of individual action results. 
	- They run only when the action method has executed successfully. 
	- They are useful for logic that must surround view or formatter execution.
	- Implement either the `IResultFilter` or `IAsyncResultFilter` interface.
	- Their execution surrounds the execution of action results.



## Implementation
- support both synchronous and asynchronous implementations through different interface definitions.
- Synchronous filters that can run code both before and after their pipeline stage define OnStageExecuting and OnStageExecuted methods.
	- OnActionExecuting is called before the action method is called, and OnActionExecuted is called after the action method returns.
		```cs
		using FiltersSample.Helper;
		using Microsoft.AspNetCore.Mvc.Filters;

		namespace FiltersSample.Filters
		{
			public class SampleActionFilter : IActionFilter
			{
				public void OnActionExecuting(ActionExecutingContext context)
				{
					// do something before the action executes
				}

				public void OnActionExecuted(ActionExecutedContext context)
				{
					// do something after the action executes
				}
			}
		}	
		```
- Asynchronous filters define a single OnStageExecutionAsync method. 
	- This method takes a FilterTypeExecutionDelegate delegate which executes the filter's pipeline stage. 
	- For example, ActionExecutionDelegate calls the action method or next action filter, and you can execute code before and after you call it.

### IFilterFactory


### Cancellation and short circuiting
You can short-circuit the filter pipeline at any point by setting the Result property on the context parameter provided to the filter method.
