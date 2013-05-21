<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PortalAdmnistrativo.Models.Selecao>>" %>

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
            Nome
        </th>
        <th>
            CaminhoImagem
        </th>
        <th>
            CodigoGrupo
        </th>
        <th>
            DescricaoGrupo
        </th>
        <th>
            QuantidadeJogos
        </th>
        <th>
            Vitorias
        </th>
        <th>
            Empates
        </th>
        <th>
            Derrotas
        </th>
        <th>
            GolsRealizados
        </th>
        <th>
            GolsSofridos
        </th>
        <th>
            Historia
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Nome) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CaminhoImagem) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CodigoGrupo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DescricaoGrupo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.QuantidadeJogos) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Vitorias) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Empates) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Derrotas) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.GolsRealizados) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.GolsSofridos) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Historia.HistoriaSelecao) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.CodigoSelecao }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.CodigoSelecao }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.CodigoSelecao }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
