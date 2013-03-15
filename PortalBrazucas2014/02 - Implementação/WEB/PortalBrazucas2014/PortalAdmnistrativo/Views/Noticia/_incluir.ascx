<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Padrao>" %>

<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.Titulo) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.Titulo, new { @class = "controle500" }) %>
        <%: Html.ValidationMessageFor(item => item.Titulo) %>
    </div>
</div>
<div class="clear"></div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.DataCadastro) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.DataCadastro, new { @class = "controle300" }) %>
        <%: Html.ValidationMessageFor(item => item.DataCadastro) %>
    </div>
</div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.Status) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.Status, new { @class = "controle300" }) %>
        <%: Html.ValidationMessageFor(item => item.Status) %>
    </div>
</div>   