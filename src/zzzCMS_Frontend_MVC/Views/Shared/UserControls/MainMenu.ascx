<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="BusinessObjects" %>
<div id="menu">
    <ul>
        <% foreach (MenuAndPage map in (IQueryable<MenuAndPage>)ViewData["MainMenu"])
           {%>
        <li>
            <%= Html.ActionLink(map.Title, "Index", "Home", new { id = map.Id }, new { @class = "menu" })%>
        </li>
        <% } %>
    </ul>
</div>
