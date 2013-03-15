<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>Noticia</legend>

    <div class="display-label">CodigoNoticia</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CodigoNoticia) %>
    </div>

    <div class="display-label">Titulo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Titulo) %>
    </div>

    <div class="display-label">DataPublicacao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DataPublicacao) %>
    </div>

    <div class="display-label">Categoria</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Categoria) %>
    </div>

    <div class="display-label">Conteudo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Conteudo) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
