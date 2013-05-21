<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PortalAdmnistrativo.Models.Jogo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Administrar Tabela de Jogos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Administrar Tabela de Jogos</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            Cidade
        </th>
        <th>
            NomeCidade
        </th>
        <th>
            LocalVendaIngresso
        </th>
        <th>
            Rodada
        </th>
        <th>
            CodigoSelecaoA
        </th>
        <th>
            NomeSelecaoA
        </th>
        <th>
            GolsSelecaoA
        </th>
        <th>
            ExpulsoesSelecaoA
        </th>
        <th>
            CodigoSelecaoB
        </th>
        <th>
            NomeSelecaoB
        </th>
        <th>
            GolsSelecaoB
        </th>
        <th>
            ExpulsoesSelecaoB
        </th>
        <th>
            DataHora
        </th>
        <th>
            CaminhoImagem
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Cidade.Nome) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeCidade) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.LocalVendaIngresso) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Rodada) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CodigoSelecaoA) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeSelecaoA) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.GolsSelecaoA) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ExpulsoesSelecaoA) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CodigoSelecaoB) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeSelecaoB) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.GolsSelecaoB) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ExpulsoesSelecaoB) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DataHora) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CaminhoImagem) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.CodigoJogo }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.CodigoJogo }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.CodigoJogo }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
