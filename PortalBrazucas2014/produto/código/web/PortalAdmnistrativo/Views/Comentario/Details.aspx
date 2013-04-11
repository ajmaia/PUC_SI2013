<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Comentario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>Comentario</legend>

    <div class="display-label">Conteudo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Conteudo) %>
    </div>

    <div class="display-label">Usuario</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Usuario.NomeRazaoSocial) %>
    </div>

    <div class="display-label">NomeLoginCriacao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeLoginCriacao) %>
    </div>

    <div class="display-label">DataCriacao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DataCriacao) %>
    </div>

    <div class="display-label">StatusAprovacao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.StatusAprovacao) %>
    </div>

    <div class="display-label">UsuarioAprovacao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.UsuarioAprovacao) %>
    </div>

    <div class="display-label">Noticia</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Noticia.Titulo) %>
    </div>

    <div class="display-label">DataCriacaoString</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DataCriacaoString) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.CodigoComentario }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
