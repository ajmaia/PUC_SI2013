<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PortalAdmnistrativo.Models.Comentario>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            Conteudo
        </th>
        <th>
            Usuario
        </th>
        <th>
            NomeLoginCriacao
        </th>
        <th>
            DataCriacao
        </th>
        <th>
            StatusAprovacao
        </th>
        <th>
            UsuarioAprovacao
        </th>
        <th>
            Noticia
        </th>
        <th>
            DataCriacaoString
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Conteudo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Usuario.NomeRazaoSocial) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeLoginCriacao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DataCriacao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.StatusAprovacao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.UsuarioAprovacao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Noticia.Titulo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DataCriacaoString) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.CodigoComentario }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.CodigoComentario }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.CodigoComentario }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
