<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Cidade>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

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
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.CodigoCidade }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
