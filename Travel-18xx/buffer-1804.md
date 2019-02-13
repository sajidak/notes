# Buffer 1804

22.59455,72.98532
22.59832,72.98086

- https://gps-coordinates.org/distance-between-coordinates.php
- https://www.purplemath.com/modules/distform.htm
- darbuka drums
- Sajan Sajna O Sajna, Tere Pyaar
- jokes ka dada hindi

## Base colors
- CAF1F3
- DBEFF0
- AED5D7
- 190000 door
  - FFC0C0
- A1367E pillar

firament
8A019D
A975B0
E5B3EC
  http://paletton.com/#uid=74S1m0k7UUa00++3jZwczLkh8zi
  
  
https://www.asianpaints.com/pro/colourCompendium.aspx
Microsoft.AspNetCore.Http.Extensions.UriHelper.Encode(Uri) Method
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers

## Fixed footer - html
- `.outerHeight( [includeMargin ] )Returns: Number`
- `.offset()Returns: Object`

## streaming
- netcat tool
- vlc libraries


## Response Caching
```cs
public void ConfigureServices(IServiceCollection services)
{
    services.AddMvc(options =>
    {
        options.CacheProfiles.Add("Default",
            new CacheProfile()
            {
                Duration = 60
            });
        options.CacheProfiles.Add("Never",
            new CacheProfile()
            {
                Location = ResponseCacheLocation.None,
                NoStore = true
            });
    }).SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
}
```

- Apply
```cs
[ResponseCache(CacheProfileName = "Default")]
    public IActionResult Index()
    {
        return View();
    }
```
- static file cache
	```cs
	app.UseStaticFiles(new StaticFileOptions
	{
		OnPrepareResponse = (context) =>
		{
		    var headers = context.Context.Response.GetTypedHeaders();

		    headers.CacheControl = new CacheControlHeaderValue
		    {
		        Public = true,
		        MaxAge = TimeSpan.FromDays(365)
		    };
		}
	});
	```

- see
  - https://docs.microsoft.com/en-us/aspnet/core/fundamentals/app-state?view=aspnetcore-2.1#tempdata
  - see 'Dependency Injection'


- DI in pages
	```cs
	// Define
	public class MyAppData
	{
		// Declare properties and methods
	}

	// Configure
	public void ConfigureServices(IServiceCollection services)
	{
		services.AddSingleton<MyAppData>();
	}

	// Consume
	public class IndexModel : PageModel
	{
		public IndexModel(MyAppData myService)
		{
		    // Do something with the service
		    //    Examples: Read data, store in a field or property
		}
	}

	```

## HTML Font size, cookied
- document.body.style.fontSize = "1.0em";
  - specify font-size on the <html> element
- `var cookie_name = $.cookie('cookie_name');`
- `$.cookie("cookie_name", "value");`
- JSON.parse() and JSON.stringify() in Javascript


## Quotes
- Thankfulness means that one should not disobey God by means of the favour which he has bestowed upon you nor make of His favour a source of disobedience.

## Wireless display protocols:
- Miracast
- DNLA
- Airplay
- Screen Mirroring

## Snippets
### Attributes
- https://www.tutorialspoint.com/csharp/csharp_attributes.htm
- https://www.tutorialspoint.com/csharp/csharp_reflection.htm
	```cs
	[AttributeUsage(
		  AttributeTargets.Class |
		  AttributeTargets.Constructor |
		  AttributeTargets.Field |
		  AttributeTargets.Method |
		  AttributeTargets.Property,
		  AllowMultiple = true)]

	System.Reflection.MemberInfo info = typeof(MyClass);

	object[] attributes = info.GetCustomAttributes(true);
	// or
	object[ ] laAttributes =
	  loType.GetCustomAttributes(
		typeof( DefectTrackAttribute ),
		false ) ;

	MethodInfo[ ] laMethods =
	  loType.GetMethods(
		BindingFlags.Public |
		BindingFlags.Instance |
		BindingFlags.DeclaredOnly ) ;
	```

### js byte array
```js
// conversion of number from/to ByteArray:

longToByteArray = function(/*long*/long) {
    // we want to represent the input as a 8-bytes array
    var byteArray = [0, 0, 0, 0, 0, 0, 0, 0];

    for ( var index = 0; index < byteArray.length; index ++ ) {
        var byte = long & 0xff;
        byteArray [ index ] = byte;
        long = (long - byte) / 256 ;
    }

    return byteArray;
};

byteArrayToLong = function(/*byte[]*/byteArray) {
    var value = 0;
    for ( var i = byteArray.length - 1; i >= 0; i--) {
        value = (value * 256) + byteArray[i];
    }

    return value;
};

```


### taghelpers
- https://docs.microsoft.com/en-us/aspnet/core/mvc/views/tag-helpers/authoring?view=aspnetcore-2.1


## scrollbar
- https://harvesthq.github.io/chosen/
- https://www.w3schools.com/howto/howto_css_custom_scrollbar.asp
- https://codepen.io/ericrasch/pen/zjDBx
- http://blog.dynamicdrive.com/top-7-custom-scrollbar-javascript-and-jquery-plugins/
- https://www.jqwidgets.com/asp.net-core-mvc-tag-helpers-documentation/
- https://select2.org
- https://gromo.github.io/jquery.scrollbar/demo/basic.html
- https://grsmto.github.io/simplebar/


## dropdowns
https://getbootstrap.com/docs/4.1/components/dropdowns/


## Data binding in winforms
- https://docs.microsoft.com/en-us/dotnet/framework/winforms/windows-forms-data-binding



## hotspot pwd
`vddx3047x`

## gotomeeting 
```
ID : 710 016 301 #
VOICE CODE : 181#
```

- http://inontv.net/watch-video-mere-sai-5th-april-2018-full-hd-episode-138/
- http://www.youtube.com/watch?v=Z-sXNXA7LJI&feature=player_embedded

- youtube
    - 001 - sXNXA7LJI


```
<-strobe  // wait until clock pulse and discard received value
https://golang.org/ref/spec#Passing_arguments_to_..._parameters

https://programming.guide/go/recover-from-panic.html
https://googleweblight.com/i?u=https://dave.cheney.net/2016/06/12/stack-traces-and-the-errors-package&hl=en-IN


runtime.Caller(4) // this skips the first 4 that are called under log.Panic()

import "runtime/debug"
github.com/go-errors/errors
https://github.com/palantir/stacktrace
GOTRACEBACK=all adds stack traces for all user-created goroutines.

"net/http/pprof"
runtime.Stack
buf := make([]byte, 1<<16)
func Stack(buf []byte, all bool) int

https://googleweblight.com/i?u=https://blog.bugsnag.com/go-errors/&hl=en-IN
https://github.com/go-errors/errors/

github.com/pkg/errors
```

### Address
```
1/560 Raja mohalla, Vankar vas, Borsad 388540, GJ
```

