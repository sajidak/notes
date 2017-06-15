# MVC5 Razor Snippets

## System.Web.Mvc.Html
### **EnumHelper**
`System.Collections.Generic.IList<System.Web.Mvc.SelectListItem> GetSelectList(System.Type type)`
Gets a list of System.Web.Mvc.SelectListItem objects corresponding to enum constants defined in the given type.

### **EditorExtensions**

### **InputExtensions**
See other overloads also.
- `CheckBox(this System.Web.Mvc.HtmlHelper htmlHelper, string name)`
- **Summary:**
	- Returns a hidden input element by using the specified HTML helper and the name of the form field.
- **Parameters:**
	- htmlHelper: The HTML helper instance that this method extends.
	- name: The name of the form field and the System.Web.Mvc.ViewDataDictionary key that is used to look up the value.
- **Returns:**
	- An input element whose type attribute is set to "checkbox".
- `CheckBoxFor<TModel>(System.Web.Mvc.HtmlHelper<TModel>, System.Linq.Expressions.Expression<System.Func<TModel, bool>>)`
- **Summary:**
	- Returns a check box input element for each property in the object that is represented by the specified expression.
- **Type Parameters:**
	- TModel: The type of the model.
- **Parameters:**
	- htmlHelper: The HTML helper instance that this method extends.
	- expression: An expression that identifies the object that contains the properties to render.
- **Returns:**
	- An HTML input element whose type attribute is set to "checkbox" for each property in the object that is represented by the specified expression.
- `Hidden(this System.Web.Mvc.HtmlHelper htmlHelper, string name)`
- `HiddenFor<TModel, TProperty>(this System.Web.Mvc.HtmlHelper<TModel> htmlHelper, System.Linq.Expressions.Expression<System.Func<TModel, TProperty>> expression, `System.Collections.Generic.IDictionary<string, object> htmlAttributes)`
- `Password(this System.Web.Mvc.HtmlHelper htmlHelper, string name)`
- `PasswordFor<TModel, TProperty>(this System.Web.Mvc.HtmlHelper<TModel> htmlHelper, System.Linq.Expressions.Expression<System.Func<TModel, TProperty>> expression)`
- `InputExtensions.RadioButtonFor<TModel, TProperty>(System.Web.Mvc.HtmlHelper<TModel>, System.Linq.Expressions.Expression<System.Func<TModel, TProperty>>, object)`
- `InputExtensions.TextBoxFor<TModel, TProperty>(System.Web.Mvc.HtmlHelper<TModel>, System.Linq.Expressions.Expression<System.Func<TModel, TProperty>>)`

- `TextAreaExtensions.TextArea(System.Web.Mvc.HtmlHelper, string)`
- `TextAreaExtensions.TextAreaFor<TModel, TProperty>(System.Web.Mvc.HtmlHelper<TModel>, System.Linq.Expressions.Expression<System.Func<TModel, TProperty>>)`

## System.Web.Mvc
- `HttpPostedFileBaseModelBinder.BindModel(System.Web.Mvc.ControllerContext, System.Web.Mvc.ModelBindingContext)`
- `SelectList.SelectList(System.Collections.IEnumerable, string, string, object)`
- `SelectList.SelectList(System.Collections.IEnumerable, string, string, object, System.Collections.IEnumerable)`
- 
