<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Anuncio>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>Anuncio</legend>

    <div class="display-label">Titulo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Titulo) %>
    </div>

    <div class="display-label">CaminhoImagem</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CaminhoImagem) %>
    </div>

    <div class="display-label">Conteudo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Conteudo) %>
    </div>

    <div class="display-label">DataPublicacao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DataPublicacao) %>
    </div>

    <div class="display-label">Usuario</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Usuario.NomeRazaoSocial) %>
    </div>

    <div class="display-label">StatusAprovacao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.StatusAprovacao) %>
    </div>

    <div class="display-label">UsuarioAprovacao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.UsuarioAprovacao) %>
    </div>

    <div class="display-label">Categoria</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Categoria.DescricaoCategoria) %>
    </div>

    <div class="display-label">DescricaoCategoria</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DescricaoCategoria) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.CodigoAnuncio }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
