# MVC5 Buffer
Temporary container to hold notes till they can be organized

[TOC]
## Local Doc Copy - Items of Interest
**Root:** `/70_Current/Learning/aspnet-Docs-master/aspnet/web-pages/overview`
- /api-reference/asp-net-web-pages-api-reference.md
- /getting-started/introducing-razor-syntax-c.md
- /ui-layouts-and-themes
- /security/16-adding-security-and-membership.md


## Data Annotations
Annotation `[Display(Name = "VALUE")]` will be used as Label for the feild, by MVC5 template. Other tags appear to be ignored, but needs to be investigated.
## DataAnnotations - Get more Information
- System.ComponentModel.DataAnnotations
	- EnumDataTypeAttribute
	- `[Required(ErrorMessage="{0} is required")]`
	- StringLength
	- `[MinLength(3,ErrorMessage="{0} should have three or more letters")]`
	- RegularExpression
	- `[Range(100, 10000, ErrorMessage = "Units in stock should be between {1} and {2}.")]`
	- `[DataType(DataType.Password)]`
	- `[Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]`
	- `[UIHint("UnitsInStock")]`
- see
	- http://msdn.microsoft.com/en-us/library/system.componentmodel.dataannotations.aspx

### Using UIHint
 [UIHintAttribute](https://msdn.microsoft.com/en-us/library/system.componentmodel.dataannotations.uihintattribute(v=vs.98).aspx)
`System.ComponentModel.DataAnnotations.UIHintAttribute`
```cs
	[UIHint("UnitsInStock")]
	[Range(100, 10000,
	ErrorMessage = "Units in stock should be between {1} and {2}.")]
	public object UnitsInStock;
```
- https://msdn.microsoft.com/en-us/library/cc488522(v=vs.110).aspx


### Using Metadata Class
http://www.ozkary.com/2015/01/add-data-annotations-to-entity.html
**Note:** Ensure namespace is same as in EF6 generated classes.
```cs
/* EF6 Generated Class */
[Table("rcw.A_DB_INFO")]
public partial class A_DB_INFO
{
	[Key]
	public int DB_INFO_ID { get; set; }
	[Required]
	[StringLength(24)]
	public string DB_REL_VER { get; set; }
	public int? NOTE { get; set; }
	public long EDIT_BY { get; set; }
	[Column(TypeName = "datetime2")]
	public DateTime EDIT_ON { get; set; }
}

/*
	Classes to implement refresh-proof Annotations - BEGIN
*/

/// <summary>
/// Partial Class definition to hoist Metadata on EF6 generated class
/// </summary>
[MetadataType(typeof(Annotations.A_DB_INFO_Metadata))]
public partial class A_DB_INFO
{	/* No need for any code in this class */	}
}

namespace Annotations
{
	/// <summary>
	/// Data Annotation class.
	/// Copied As-Is from generated code, and add suffix '_Metadata' to class name
	/// Add required Annotations on properties in this class
	/// Remove Properties for which Metadata is not required
	/// </summary>
	public abstract class A_DB_INFO_Metadata
	{
		[Display(Name = "Entry ID")]
		public int DB_INFO_ID { get; set; }
		[Display(Name = "Database Version")]
		public string DB_REL_VER { get; set; }
		[Display(Name = "Note:")]
		public int? NOTE { get; set; }
		public long EDIT_BY { get; set; }
		public DateTime EDIT_ON { get; set; }
	}
}

/*
	Classes to implement refresh-proof Annotations - END
*/
```

### Template to use in code generator
Parameners to use:
| S#  |            Name            |                                   Note                                   |
| --- | -------------------------- | ------------------------------------------------------------------------ |
| 1   | `${ENTITY_NAME_SPACE}`     | Namespace that is to be used, should be the same as that of the entities |
|     |                            | `TODO:` Get from Entity source file                                      |
| 2   | `${ANNOTATION_NAME_SPACE}` | Additional namespace segment to be applied on the Metadata class         |
|     |                            | , to avoid polluting the Entity name space                               |
|     |                            | **Default** = `${ENTITY_NAME_SPACE}_Annotations`                         |
|     |                            | **Note:** Expansion will NOT be done, value will be replaced AS-IS       |
| 3   | `${METADATA_CLASS_SUFFIX}` | Suffix to be added to Entity class name, to get the Metadata class name  |
|     |                            | **Default** = `${ENTITY_CLASS_NAME}_Metadata`                            |
| 4   | `${ENTITY_CLASS_NAME}`     | Place holder for use by Code Generator                                   |
| 5   | `${ENTITY_BODY}`           | Place holder for use by Code Generator                                   |
| 6   | `${SOURCE_ROOT_DIR}`       | Root folder from which Entity source files are to be generated           |
| 7   | `${OUTPUT_DIR}`            | Folder where generated files will be written                             |
|     |                            | , source folder tree will be recreated                                   |
|     |                            | , if any generatable files exist in the folder                           |

**Planned Enhancements**
- Get entity namespace from entity source itself
	- should support multiple namespaces
- Remove existing attributes from Entity code
- Use reflection to get details needed

**Keywords:** `namespace `, `    public partial class `, `        public `
```cs
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;

// Namespace matching is IMPORTANT
namespace ${ENTITY_NAME_SPACE}
{
	/// <summary>
	/// Additional namespace segment to avoid polluting Entity Namespace.
	/// Intellisense will show both classes if they are in same namespace.
	/// </summary>
	namespace ${ANNOTATION_NAME_SPACE}
	{
		/// <summary>
		/// Data Annotation class.
		/// Copied As-Is from generated code, and add suffix '${METADATA_CLASS_SUFFIX}' to class name
		/// Add required Annotations on properties in this class
		/// Remove Properties for which Metadata is not required
		/// </summary>
		public sealed class ${ENTITY_CLASS_NAME}${METADATA_CLASS_SUFFIX}
		{
			${ENTITY_BODY}
		}
	}

	/// <summary>
	/// Partial Class definition to hoist Metadata on EF6 generated class
	/// </summary>
	[MetadataType(typeof(${ANNOTATION_NAME_SPACE}.${ENTITY_CLASS_NAME}${METADATA_CLASS_SUFFIX}))]
	public partial class ${ENTITY_CLASS_NAME}
	{	/* No need for any code in this class */	}
}
```

## Partial Views
- partial views do not run `_ViewStart.cshtml`
- Partial views can be chained
- gets a copy of the parent view''s ViewData dictionary.
- Updates made to the data within the partial view are not persisted to the parent view
- e.g.
```html
<body>
    @{ Html.RenderPartial("_Header"); }
    @Html.Partial("_Sidebar")
    <div class="container body-content">
       @RenderBody()
    </div>
    @{ Html.RenderPartial("_Footer"); }
</body>
```
-  Partial
	- returns an IHtmlString and can be referenced by prefixing the call with `@`
	- to render the static data
-  RenderPartial
	- streams the rendered output directly to the response
	- to render the static data
	- Because it doesn't return a result, it must be called within a Razor code block
	-  in most cases it's recommended you use Partial
- Passing data to partial views
	- the view engine passes each partial view as a reference to the same view model object it received from the controller
	- to pass an explicit parameter to the partial view
	- `@Html.Partial("_CustomerBox", customer)`
	- can access the global ViewData and ViewBag collections from within a partial view
	- Any value stored in such dictionaries by the controller can still be read from the partial view even when the Model property is overridden in the parent view
	- can use ViewData and ViewBag to pass additional info
- Action
	- returns the markup as a string
	-  to implement the dynamic data
- RenderAction
	- writes directly to the output stream
	-  to implement the dynamic data
```html
@Html.Action(“_PartialView”);
@{Html.RenderAction(“_PartialView”);}
```

### What is difference between ViewData and ViewBag
- TODO:


### global.asax
- **TODO:** Understand more of this.
```cs
ViewEngines.Engines.Clear();
var customEngine = new RazorViewEngine();
customEngine.PartialViewLocationFormats = new string[]
{
    "~/Views/{1}/{0}.cshtml",
    "~/Views/Shared/{0}.cshtml",
    "~/Views/Partial/{0}.cshtml",
    "~/Views/Partial/{1}/{0}.cshtml"
};

this.ViewLocationFormats = new string[]
{
    "~/Views/{1}/{0}.cshtml",
    "~/Views/Shared/{0}.cshtml",
    "~/Views/Controller/{1}/{0}.cshtml"
};

this.MasterLocationFormats = new string[]
{
    "~/Views/Shared/{0}.cshtml",
    "~/Views/Layout/{0}.cshtml"
};

ViewEngines.Engines.Add(customEngine);
```

### Also See
- [view component](https://docs.microsoft.com/en-us/aspnet/core/mvc/views/view-components)
	- [**core**] If your views need to execute code, the recommended pattern is to use a view component instead of a partial view


## HTML Helpers - MVC
- Inline Html Helpers
	- can be reused only on the same view
	```html
		<!-- Definition -->
	    @helper ListingItems(string[] items)
	     {
		     <ol>
		     @foreach (string item in items)
			     {
			     	<li>@item</li>
			     }
		     </ol>
	     }

		 <!-- Usage -->
	     <h3>Programming Languages:</h3>
	     @ListingItems(new string[] { "C", "C++", "C#" })

	     <h3>Book List:</h3>
	     @ListingItems(new string[] { "How to C", "how to C++", "how to C#" })
	 ```
- Built-In Html Helpers
	- Standard Html Helpers
		- `@Html.TextBox("Textbox1", "val") `
		- Html.ActionLink, Html.Beginform, Html.EndForm, Html.Label, Html.TextBox, Html.TextArea, Html.Password, Html.DropDownList, Html.CheckBox, Html.RedioButton, Html.ListBox, Html.Hidden
	- Strongly Typed HTML Helpers
		- work on lambda expression,
		- `@Html.TextBoxFor(m=>m.Name)`
		- Html.LabelFor, Html.TextBoxFor, Html.TextAreaFor, Html.DropDownListFor, Html.CheckBoxFor, Html.RadioButtonFor, Html.ListBoxFor, Html.HiddenFor
	- Templated HTML Helpers
		- render based on properties of your model class
		- requires some initial care and attention to set up
		- selects an appropriate HTML element based on property’s data type and metadata
		- Display, DisplayFor, Editor, EditorFor
- Custom Html Helpers
	- can also create your own custom helper methods by creating an extension method on the HtmlHelper class or by creating static methods with in a utility class
	```cs
    public static class CustomHelpers
    {
     //Submit Button Helper
     public static MvcHtmlString SubmitButton(this HtmlHelper helper, string
     buttonText)
     {
     string str = "<input type=\"submit\" value=\"" + buttonText + "\" />";
     return new MvcHtmlString(str);
     }
     //Readonly Strongly-Typed TextBox Helper
     public static MvcHtmlString TextBoxFor<TModel, TValue>(this
     HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TValue>>
     expression, bool isReadonly)
     {
     MvcHtmlString html = default(MvcHtmlString);

     if (isReadonly)
     {
     html = System.Web.Mvc.Html.InputExtensions.TextBoxFor(htmlHelper,
     expression, new { @class = "readOnly",
     @readonly = "read-only" });
     }
     else
     {
     html = System.Web.Mvc.Html.InputExtensions.TextBoxFor(htmlHelper,
     expression);
     }
     return html;
     }
    }
	```

## Enums as datatypes
