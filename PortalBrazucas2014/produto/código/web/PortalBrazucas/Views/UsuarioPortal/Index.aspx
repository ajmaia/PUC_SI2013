<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PortalAdmnistrativo.Models.Usuario>>" %>

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
            CpfCnpj
        </th>
        <th>
            NomeRazaoSocial
        </th>
        <th>
            Email
        </th>
        <th>
            DataNascimento
        </th>
        <th>
            Sexo
        </th>
        <th>
            TipoPerfil
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.CpfCnpj) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeRazaoSocial) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Email) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DataNascimento) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Sexo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.TipoPerfil) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.LoginUsuario }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.LoginUsuario }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.LoginUsuario }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
