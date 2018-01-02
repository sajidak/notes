# HTML Helpers
Sun, 31-Dec-2017 16:16:39.008 +0530

## Tutorial 1:
`https://www.codeproject.com/Articles/1095293/How-To-Create-Custom-HTML-Helper-in-ASP-NET-MVC-He`
- We have to create a static method in static class.
- First parameter has to be the type to which we are adding the extension method. In our case, it is HtmlHelper Class.
- Return type should be IHtmlString, as these strings are excluded from html encoding.
- To create HTML tag, we have to use TagBuilder class
- Include the namespace of the helper method in view or web.config
```cs
namespace MyMVCApp.CustomHtmlHelpers
{
    public static class CustomHtmlHelpers
    {
        public static IHtmlString MyImageHelper(this HtmlHelper helper, string src, string alt)
        {
            TagBuilder tb = new TagBuilder("img");
            tb.Attributes.Add("src", VirtualPathUtility.ToAbsolute(src));
            tb.Attributes.Add("alt", alt);

            return new MvcHtmlString(tb.ToString(TagRenderMode.SelfClosing));
        }
    }
}
// @Html.MyImage("~/Images/mayur.jpg", "Mayur Lohite")
```

## Example
http://www.c-sharpcorner.com/UploadFile/3194c4/custom-html-helpers-in-mvc/
- extension method for HtmlHelper class
	```cs
	using System;
	using System.Collections.Generic;
	using System.Linq;
	using System.Web;
	using System.Web.Mvc;

	namespace CustomeHelper.CustomHelper
	{
	    public static class CustomHelpers
	    {
	        public static IHtmlString File(this HtmlHelper helper, string id)
	      {
	            TagBuilder tb = new TagBuilder("input");
	            tb.Attributes.Add("type", "file");
	            tb.Attributes.Add("id", id);
	            return new MvcHtmlString(tb.ToString());
	        }
	    }
	}
	```
- static method
	```cs
	using System;
	using System.Collections.Generic;
	using System.Linq;
	using System.Web;
	using System.Web.Mvc;

	namespace CustomeHelper.CustomHelper
	{
	    public class CustomHelper
	    {
	        public static IHtmlString File(string id)
	      {
	            TagBuilder tb = new TagBuilder("input");
	            tb.Attributes.Add("type", "file");
	            tb.Attributes.Add("id", id);
	            return new MvcHtmlString(tb.ToString());
	        }
	    }
	}
	```

## A
`https://docs.microsoft.com/en-us/aspnet/mvc/overview/older-versions-1/views/creating-custom-html-helpers-cs`
### with Static Methods
- The easiest way to create a new HTML Helper is to create a static method that returns a string.
	```cs
	using System;
	namespace MvcApplication1.Helpers
	{
		public class LabelHelper
		{
			public static string Label(string target, string text)
			{
				return String.Format("<label for='{0}'>{1}</label>", target, text);
			}
		}
	}
	```

### with Extension Methods
- If you want to create HTML Helpers that work just like the standard HTML Helpers included in the ASP.NET MVC framework then you need to create extension methods. Extension methods enable you to add new methods to an existing class. When creating an HTML Helper method, you add new methods to the HtmlHelper class represented by a view's Html property.
- You must define an extension method with a static class.
	```cs
	using System;
	using System.Web.Mvc;

	namespace MvcApplication1.Helpers
	{
	     public static class LabelExtensions
	     {
	          public static string Label(this HtmlHelper helper, string target, string text)
	          {
	               return String.Format("<label for='{0}'>{1}</label>", target, text);
	          }
	     }
	}
	```



## Other
http://www.c-sharpcorner.com/article/top-10-web-application-security-risks-in-2017/
