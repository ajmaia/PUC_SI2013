<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Jogo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>Jogo</legend>

    <div class="display-label">Cidade</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Cidade.Nome) %>
    </div>

    <div class="display-label">NomeCidade</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeCidade) %>
    </div>

    <div class="display-label">LocalVendaIngresso</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.LocalVendaIngresso) %>
    </div>

    <div class="display-label">Rodada</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Rodada) %>
    </div>

    <div class="display-label">CodigoSelecaoA</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CodigoSelecaoA) %>
    </div>

    <div class="display-label">NomeSelecaoA</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeSelecaoA) %>
    </div>

    <div class="display-label">GolsSelecaoA</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.GolsSelecaoA) %>
    </div>

    <div class="display-label">ExpulsoesSelecaoA</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ExpulsoesSelecaoA) %>
    </div>

    <div class="display-label">CodigoSelecaoB</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CodigoSelecaoB) %>
    </div>

    <div class="display-label">NomeSelecaoB</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeSelecaoB) %>
    </div>

    <div class="display-label">GolsSelecaoB</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.GolsSelecaoB) %>
    </div>

    <div class="display-label">ExpulsoesSelecaoB</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ExpulsoesSelecaoB) %>
    </div>

    <div class="display-label">DataHora</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DataHora) %>
    </div>

    <div class="display-label">CaminhoImagem</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CaminhoImagem) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
