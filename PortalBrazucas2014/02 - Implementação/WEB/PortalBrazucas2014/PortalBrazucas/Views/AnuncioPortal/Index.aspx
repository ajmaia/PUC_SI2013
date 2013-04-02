<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PortalAdmnistrativo.Models.Anuncio>>" %>

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
            Titulo
        </th>
        <th>
            CaminhoImagem
        </th>
        <th>
            Conteudo
        </th>
        <th>
            DataPublicacao
        </th>
        <th>
            Usuario
        </th>
        <th>
            StatusAprovacao
        </th>
        <th>
            UsuarioAprovacao
        </th>
        <th>
            Categoria
        </th>
        <th>
            DescricaoCategoria
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Titulo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CaminhoImagem) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Conteudo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DataPublicacao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Usuario.NomeRazaoSocial) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.StatusAprovacao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.UsuarioAprovacao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Categoria.DescricaoCategoria) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DescricaoCategoria) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.CodigoAnuncio }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.CodigoAnuncio }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.CodigoAnuncio }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
