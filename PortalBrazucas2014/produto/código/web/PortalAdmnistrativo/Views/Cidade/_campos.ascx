<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Cidade>" %>

<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.Nome) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.Nome, new { @class = "controle930" }) %>
    </div>
</div>
<div class="clear"></div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.NomeEstadio) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.NomeEstadio, new { @class = "controle930" }) %>
    </div>
</div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.UF) %>
    </div>
    <div class="campos">
        <%: Html.DropDownListFor(item => item.UF, new SelectList(ViewBag.ListaEstados, "Value", "Text"), PortalAdmnistrativo.Resouces.Geral.optSelecionarTodos, new { @class = "controle500" }) %>
    </div>
</div>               