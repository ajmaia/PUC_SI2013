<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.RegisterModel>" %>

<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(m => m.UserName) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(m => m.UserName, new { @class = "controle300" }) %>
        <%: Html.ValidationMessageFor(m => m.UserName) %>
    </div>
</div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(m => m.Email) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(m => m.Email, new { @class = "controle930" }) %>
        <%: Html.ValidationMessageFor(m => m.Email) %>
    </div>
</div>
<div class="clear"></div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(m => m.Password) %>
    </div>
    <div class="campos">
        <%: Html.PasswordFor(m => m.Password, new { @class = "controle500" }) %>
        <%: Html.ValidationMessageFor(m => m.Password) %>
    </div>
</div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(m => m.ConfirmPassword) %>
    </div>
    <div class="campos">
        <%: Html.PasswordFor(m => m.ConfirmPassword, new { @class = "controle500" }) %>
        <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
    </div>
</div>
                