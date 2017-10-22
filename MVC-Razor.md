# MVC Razor notes

[TOC]
---

## Optional Sections
### in `_Layout.cshtml`
```
<section id="Sidebar" class="sidebarcotent">
    @* Default SideBar Content*@
    @RenderSection("SideBar", required: false)
</section>
```
### in `Index.cshtml`
```
@section Sidebar{
<b>Using Sections</b><br />
<b>Sidebar content:</b>
<ul style="display:list-item">
    <b> <li>@Html.ActionLink("Sections", "Index", "Home")</li></b>
     <li>@Html.ActionLink("Partial Views", "About", "Home")</li>
</ul>
}
```
