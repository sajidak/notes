# MVC5 Notes (2017-05-20)

[TOC]

# Tutorials to do:
- [ ] [EF Database First with ASP.NET MVC](https://www.asp.net/mvc/overview/getting-started/database-first-development/setting-up-database)
- [ ] http://www.windowsazure.com/en-us/develop/net/tutorials/web-site-with-sql-database/
- [ ] https://docs.microsoft.com/en-us/aspnet/mvc/overview/security/create-an-aspnet-mvc-5-web-app-with-email-confirmation-and-password-reset
- [ ] [Setting up SSL in the Project](https://docs.microsoft.com/en-us/aspnet/mvc/overview/security/create-an-aspnet-mvc-5-app-with-facebook-and-google-oauth2-and-openid-sign-on#ssl)
- [ ] https://www.asp.net/entity-framework/tutorials/creating-an-entity-framework-data-model-for-an-asp-net-mvc-application
- [ ] [two part tutorial on Internationalization](http://afana.me/post/aspnet-mvc-internationalization.aspx)
- [ ] [Security and Membership](https://docs.microsoft.com/en-us/aspnet/web-pages/overview/security/16-adding-security-and-membership)
- [x] [Bundling and Minification](https://www.asp.net/mvc/tutorials/mvc-4/bundling-and-minification)

# Links:
`Move to end before finalize`
## Relevant to `rcw`
- [Customizing Site-Wide Behavior](https://docs.microsoft.com/en-us/aspnet/web-pages/overview/ui-layouts-and-themes/18-customizing-site-wide-behavior#Using__PageStart.cshtml_to_Restrict_Folder_Access)
- [WebSecurity Class](https://msdn.microsoft.com/en-us/library/webmatrix.webdata.websecurity(v=vs.99))
	- [ASP.NET Identity 2.0](https://msdn.microsoft.com/library/mt173608)
	- [Custom MySQL ASP.NET Identity Storage Provider](https://docs.microsoft.com/en-us/aspnet/identity/overview/extensibility/implementing-a-custom-mysql-aspnet-identity-storage-provider)
	- [Forms Authentication in ASP.NET Web API](https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/forms-authentication)
	- [Authentication and Authorization in ASP.NET Web API](https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/authentication-and-authorization-in-aspnet-web-api)
- [Email from ASP.NET](https://docs.microsoft.com/en-us/aspnet/web-pages/overview/getting-started/11-adding-email-to-your-web-site)


## Followup
- [Tutorials](https://docs.microsoft.com/en-us/aspnet/tutorials)
- **[ASP.NET MVC 5](https://docs.microsoft.com/en-us/aspnet/mvc/mvc5)**
- **[ASP.NET WebHooks](https://docs.microsoft.com/en-us/aspnet/webhooks/)**
- [SignalR](https://docs.microsoft.com/en-us/aspnet/signalr/)
- [Logging In Using External Sites](https://docs.microsoft.com/en-us/aspnet/web-pages/overview/security/enabling-login-from-external-sites-in-an-aspnet-web-pages-site)
- [ASP.NET Identity Recommended Resources](https://docs.microsoft.com/en-us/aspnet/identity/overview/getting-started/aspnet-identity-recommended-resources)
- [ASP.NET Best Practices](https://docs.microsoft.com/en-us/aspnet/aspnet/overview/web-development-best-practices/what-not-to-do-in-aspnet-and-what-to-do-instead)
- [Migrating ASP.NET MVC Applications to Windows Containers](https://docs.microsoft.com/en-us/aspnet/mvc/overview/deployment/docker-aspnetmvc)

## Other
- _Thu, 01-Jun-2017_
- **Try** http://fritzing.org/
	- Electronics made easy
	- Parts Library - http://fritzing.org/parts/

## Security and Membership
- [Security and Membership](https://docs.microsoft.com/en-us/aspnet/web-pages/overview/security/16-adding-security-and-membership)
- **WebSecurity Class**
	- `WebSecurty.UserExists`, `WebSecurity.CreateUserAndAccount`. These methods let you determine whether someone is already registered and to register them.
	- `WebSecurty.IsAuthenticated`. This property lets you determine whether the current user is logged in. This is useful to redirect users to a login page if they have not already logged in.
	- `WebSecurity.Login`, `WebSecurity.Logout`. These methods logs a user in or out.
	- `WebSecurity.CurrentUserName`. This property is useful for displaying the current user's logged-in name (if the user is logged in).
	- `WebSecurity.ConfirmAccount`. This method is useful if you set up email confirmation for registration. (Details are described in the [blog post](http://mikepope.com/blog/DisplayBlog.aspx?permalink=2267) Using the confirmation feature for ASP.NET Web Pages security.)
	- `CurrentUserId`,	Gets the ID for the current user.
	- `HasUserId`,	Gets a value that indicates whether the current user has a user ID.
	- `IsAuthenticated`,	Gets the authentication status of the current user.
- To manage roles, you can use the Roles and Membership classes
- Simple Membership,
	- Implement ASP.NET membership features without using the Starter Site template
	- http://mikepope.com/blog/DisplayBlog.aspx?permalink=2240
	- http://mikepope.com/blog/DisplayBlog.aspx?permalink=2267
	- [SimpleRoleProvider Class API reference](https://msdn.microsoft.com/en-us/library/webmatrix.webdata.simpleroleprovider(v=vs.99))
	- [SimpleMembershipProvider Class API reference](https://msdn.microsoft.com/en-us/library/webmatrix.webdata.simplemembershipprovider(v=vs.99))

# XSRF/CSRF
- variant of the synchronizer token pattern to defend against
- two anti-XSRF tokens are submitted to the server with each HTTP POST (In addition to the authentication token)
	- one as a cookie, consisting of a random 128-bit identifier
	- one as a form value aka `field token`, contains the following information
		- logged-in user's username (if authenticated)
		- Any additional data provided by an IAntiForgeryAdditionalDataProvider
- payloads of the anti-XSRF tokens are encrypted and signed
	- cryptographic services are provided by the MachineKey.Protect routine
	- see https://blogs.msdn.com/b/webdev/archive/2012/10/22/cryptographic-improvements-in-asp-net-4-5-pt-1.aspx
- configure the anti-XSRF system from Application_Start
- anti-XSRF routines currently do not defend against clickjacking
	- defend by sending an `X-Frame-Options: SAMEORIGIN` header with each response

## Generating the tokens
- call the @Html.[AntiForgeryToken](https://msdn.microsoft.com/en-us/library/dd470175.aspx)() method from an MVC view
or
- @AntiForgery.GetHtml() from a Razor page

## Validating the tokens
- include a [ValidateAntiForgeryToken](https://msdn.microsoft.com/en-us/library/system.web.mvc.validateantiforgerytokenattribute(VS.108).aspx) attribute on MVC action or controller
or
- call @AntiForgery.Validate() from Razor page

If an [IAntiForgeryAdditionalDataProvider](https://msdn.microsoft.com/en-us/library/system.web.helpers.iantiforgeryadditionaldataprovider(v=vs.111).aspx) is configured, the runtime calls its ValidateAdditionalData method. The method must return the Boolean value true.

If validation succeeds, the request is allowed to proceed. If validation fails, the framework will throw an HttpAntiForgeryException.

## Failure conditions
`HttpAntiForgeryException` that is thrown during validation will contain detailed information about what went wrong.
The currently defined failure conditions are:
- The session token or form token is not present in the request.
- The session token or form token is unreadable. The most likely cause of this is a farm running mismatched versions of The ASP.NET Web Stack Runtime or a farm where the <machineKey> element in Web.config differs between machines. You can use a tool such as Fiddler to force this exception by tampering with either anti-XSRF token.
- The session token and field token were swapped.
- The session token and field token contain mismatched security tokens.
- The username embedded within the field token does not match the current logged-in user's username.
- The `IAntiForgeryAdditionalDataProvider.ValidateAdditionalData` method returned false.

**See Also**
- https://docs.microsoft.com/en-us/aspnet/mvc/overview/security/xsrfcsrf-prevention-in-aspnet-mvc-and-web-pages#_WIF_ACS
- https://docs.microsoft.com/en-us/aspnet/mvc/overview/security/xsrfcsrf-prevention-in-aspnet-mvc-and-web-pages#_Configuration_and_extensibility
- [clickjacking](https://www.owasp.org/index.php/Clickjacking)

**Lookup in Library**
- `Html.ActionLink`
- `FormCollection`
- `Html.ValidationMessageFor`
- `Html.DropDownList`
- `ViewBag`
- `SelectList`


***
# OWASP Top 10
The OWASP Top 10 provides a list of the 10 Most Critical Web Application Security Risks

For each Risk it provides:
- A description
- Example vulnerabilities
- Example attacks
- Guidance on how to avoid
- References to OWASP and other related resources

## OWASP Top 10 Proactive Controls 2016
A list of security techniques that should be included in every software development project, ordered by order of importance.
1. Verify for Security Early and Often
2. Parameterize Queries
3. Encode Data
4. Validate All Inputs
5. Implement Identity and Authentication Controls
6. Implement Appropriate Access Controls
7. Protect Data
8. Implement Logging and Intrusion Detection
9. Leverage Security Frameworks and Libraries
10. Error and Exception Handling

- [ ] Get as [PDF](https://www.owasp.org/images/9/9b/OWASP_Top_10_Proactive_Controls_V2.pdf)
- [ ] Get as [DOCX](https://www.owasp.org/images/8/8b/OWASP_Top_10_Proactive_Controls_-_V2.0.docx)

## Links
- [Top 10 - 2017 RC](https://github.com/OWASP/Top10/raw/master/2017/OWASP%20Top%2010%20-%202017%20RC1-English.pdf)
- [Mobile Top 10 - 2016](https://www.owasp.org/index.php/Mobile_Top_10_2016-Top_10)
- [Mobile Top 10 2016](https://www.owasp.org/index.php/OWASP_Top_Ten_Cheat_Sheet)
	- make printable


***
# jquery/globalize
`https://github.com/globalizejs/globalize`
JavaScript library for internationalization and localization that leverages the official Unicode CLDR JSON data
Globalize provides
- number formatting and parsing
- date and time formatting and parsing
- currency formatting
- message formatting (ICU message format pattern)
- plural support

based on the Unicode Consortium's Common Locale Data Repository (CLDR),
needs CLDR content to function properly

**See Also**
- http://rxaviers.github.io/javascript-globalization/
	- http://sourceforge.net/projects/i18nlib/

## CLDR - Unicode Common Locale Data Repository
provides key building blocks for software to support the world's languages. It includes:
- Locale-specific patterns for formatting and parsing: dates, times, timezones, numbers and currency values
- Translations of names: languages, scripts, countries and regions, currencies, eras, months, weekdays, day periods, timezones, cities, and time units
- Language & script information: characters used; plural cases; gender of lists; capitalization; rules for sorting & searching; writing direction; transliteration rules; rules for spelling out numbers; rules for segmenting text into graphemes, words, and sentences
- Country information: language usage, currency information, calendar preference and week conventions, and telephone codes
- Other: ISO & BCP 47 code support (cross mappings, etc.), keyboard layouts

- Uses
	- XML format provided by UTS #35: Unicode Locale Data Markup Language (LDML)
	- XML (not JSON) is the "official" format for all CLDR data. JSON data is provided as a convenience for the development community.


**See Also:**
- http://www.unicode.org/reports/tr35/


***
# Bundling and Minification
`https://www.asp.net/mvc/tutorials/mvc-4/bundling-and-minification`

- **Bundling** - A new feature in ASP.NET 4.5 that makes it easy to combine or bundle multiple files into a single file.
Can create CSS, JavaScript and other bundles
- **Minification** - a variety of different code optimizations to scripts or css, such as removing unnecessary white space and comments and shortening variable names to one character

## How
- Bundling and minification is enabled or disabled by setting the value of the debug attribute in the compilation Element in the Web.config file.
- To enable bundling and minification,
	- in *Web.config*, Set the debug value to "false".
	- or, set `EnableOptimizations` property on the BundleTable class.

**NOTE:**
- Unless `EnableOptimizations` is true or the `debug` attribute in the compilation Element in the `Web.config` file is set to `false`, files will not be bundled or minified
- `EnableOptimizations` overrides the debug attribute in the compilation Element in the Web.config file
	```cs
	public static void RegisterBundles(BundleCollection bundles)
	{
	    bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
	                 "~/Scripts/jquery-{version}.js"));

	    // Code removed for clarity.
	    BundleTable.EnableOptimizations = true;
	}
	```
- The `{version}` wild card matching shown above is used to automatically create a jQuery bundle with the appropriate version of jQuery in your Scripts folder.
- provides the following benefits:
	Allows you to use NuGet to update to a newer jQuery version without changing the preceding bundling code or jQuery references in your view pages.
	Automatically selects the full version for debug configurations and the ".min" version for release builds.

## Bundle Class
https://msdn.microsoft.com/en-us/library/system.web.optimization.bundle(v=VS.110).aspx
https://www.asp.net/mvc/tutorials/mvc-4/bundling-and-minification

- Include method takes an array of strings, where each string is a virtual path to resource
- IncludeDirectory method is provided to add all the files in a directory (and optionally all subdirectories) which match a search pattern
- Bundles are referenced in views using the `Render` method,
	- `Styles.Render` for CSS
	- `Scripts.Render` for JavaScript
- The virtual path specified in the Include method and the search pattern in the IncludeDirectory method can accept one "*" wildcard character as a prefix or suffix to in the last path segment. The search string is case insensitive. The `IncludeDirectory` method has the option of searching subdirectories.

- **Async**
`<script src='@Scripts.Url("~/bundles/modernizr")' async> </script>`

## Bundle Caching
- Bundles set the HTTP Expires Header one year from when the bundle is created
- You can force IE to make a conditional request for each bundle with the `F5` key (resulting in a HTTP 304 response for each bundle).
- You can force a full refresh by using ^F5 (resulting in a HTTP 200 response for each bundle.)
- The `System.Web.Optimization` namespace is implemented in `System.Web.Optimization.DLL`. It leverages the `WebGrease` library (`WebGrease.dll`) for minification capabilities, which in turn uses `Antlr3.Runtime.dll`.

## Adding Bundling and Minification to Web Forms
- Create a new ASP.NET Web Forms application which targets the .Net 4.5 framework.
- Add jQuery, jQuery.UI and jQuery validation to the  BundleConfig class in the App_Start folder
```cs
public class BundleConfig
{
    public static void RegisterBundles(BundleCollection bundles)
    {
        bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                    "~/Scripts/jquery-{version}.js"));

        bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                    "~/Scripts/jquery-ui-{version}.js"));

        bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                    "~/Scripts/jquery.unobtrusive*",
                    "~/Scripts/jquery.validate*"));

        bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include(
              "~/Scripts/WebForms/WebForms.js",
              "~/Scripts/WebForms/WebUIValidation.js",
              "~/Scripts/WebForms/MenuStandards.js",
              "~/Scripts/WebForms/Focus.js",
              "~/Scripts/WebForms/GridView.js",
              "~/Scripts/WebForms/DetailsView.js",
              "~/Scripts/WebForms/TreeView.js",
              "~/Scripts/WebForms/WebParts.js"));

        bundles.Add(new ScriptBundle("~/bundles/MsAjaxJs").Include(
            "~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
            "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
            "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
            "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"));

        bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
            "~/Scripts/modernizr-*"));
    }
}
```
- Register the Bundles
```cs
void Application_Start(object sender, EventArgs e)
{
    BundleConfig.RegisterBundles(BundleTable.Bundles);
}
```
- Reference the Bundles - Add the jQuery bundles to the `<asp:PlaceHolder >` markup
```cs
    <asp:PlaceHolder runat="server">
         <%: Scripts.Render("~/bundles/modernizr") %>
         <%: Scripts.Render("~/bundles/jquery") %>
         <%: Scripts.Render("~/bundles/jqueryui") %>
    </asp:PlaceHolder>
```

### CSS Bundles
- add your own style bundles to the Bundle.config file
	```xml
	<?xml version="1.0" encoding="utf-8" ?>
	<bundles version="1.0">
	  <styleBundle path="~/Content/css">
	    <include path="~/Content/Site.css" />
	  </styleBundle>
	  <styleBundle path="~/Content/themes/base/css">
	    <include path="~/Content/themes/base/jquery.ui.core.css" />
	    <include path="~/Content/themes/base/jquery.ui.resizable.css" />
	    <include path="~/Content/themes/base/jquery.ui.selectable.css" />
	    <include path="~/Content/themes/base/jquery.ui.accordion.css" />
	    <include path="~/Content/themes/base/jquery.ui.autocomplete.css" />
	    <include path="~/Content/themes/base/jquery.ui.button.css" />
	    <include path="~/Content/themes/base/jquery.ui.dialog.css" />
	    <include path="~/Content/themes/base/jquery.ui.slider.css" />
	    <include path="~/Content/themes/base/jquery.ui.tabs.css" />
	    <include path="~/Content/themes/base/jquery.ui.datepicker.css" />
	    <include path="~/Content/themes/base/jquery.ui.progressbar.css" />
	    <include path="~/Content/themes/base/jquery.ui.theme.css" />
	  </styleBundle>
	</bundles>
	```
- you can do multiple bundles in one call to the Render method.
	```xml
	<%: Styles.Render("~/Content/themes/base/css", "~/Content/css") %>
	```
