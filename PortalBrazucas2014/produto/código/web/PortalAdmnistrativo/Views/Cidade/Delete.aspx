<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Cidade>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>Cidade</legend>

    <div class="display-label">Nome</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Nome) %>
    </div>

    <div class="display-label">UF</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.UF) %>
    </div>

    <div class="display-label">CaminhoImagem</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CaminhoImagem) %>
    </div>

    <div class="display-label">NomeEstadio</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeEstadio) %>
    </div>

    <div class="display-label">CapacidadeEstadio</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CapacidadeEstadio) %>
    </div>

    <div class="display-label">InformacoesEstadio</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.InformacoesEstadio) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
