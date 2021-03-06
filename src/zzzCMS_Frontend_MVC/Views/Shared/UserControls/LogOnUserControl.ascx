<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<script type="text/javascript">
    $(document).ready(function() {
        $("#UserName").bind("mouseenter", function(e) {
            if ($(this).val() == "enter your user name") {
                $(this).val("");
            }
        });
        $("#UserName").bind("mouseleave", function(e) {
            if ($(this).val() == "") {
                $(this).val("enter your user name");
            }
        });
        $("#Password").bind("mouseenter", function(e) {
            if ($(this).val() == "password") {
                $(this).val("");
            }
        });
        $("#Password").bind("mouseleave", function(e) {
            if ($(this).val() == "") {
                $(this).val("password");
            }
        });
    });
</script>

<div id="login">
    <div id="logintxtblank">
        <%
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                using (Html.BeginForm("LogOff", "Home"))
                {
        %>
        <div id="loginheading">
            <h4>
                Welcome<b>
                    <%= Html.Encode(Page.User.Identity.Name) %></b>!</h4>
        </div>
            <button class="ui-state-default ui-corner-all" type="submit">log off</button>
        <%
            }
            }
            else
            {
                using (Html.BeginForm("LogOn", "Home"))
                {
        %>
        <div id="loginheading">
            <h4>
                User Login</h4>
        </div>
        <div id="username">
            User Name:</div>
        <div id="input">
            <label>
                <%=Html.TextBox("UserName", "enter your user name", new { @class = "input" })%>
            </label>
        </div>
        <div id="password">
            Password:</div>
        <div id="input02">
            <label>
                <%=Html.Password("Password", "password", new { @class = "input" })%>
            </label>
        </div>
        <div id="loginbutton">
            <button class="ui-state-default ui-corner-all" type="submit">
                login</button>
        </div>
        <div id="member">
            Not yet a Member?
        </div>
        <div id="register">
            <a href="#" class="register">Register Now</a></div>
        <%  }
            }
        %>
    </div>
</div>
