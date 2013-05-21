<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Jogo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Cadastrar Jogos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Cadastrar Grupos da Copa</h2>
    <link href="../../Content/paging.css" rel="stylesheet" />
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery-1.3.2.min.js")%>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/GrupoSelecionado.js")%>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/paging.js")%>" type="text/javascript"></script>

    <p>
        Todos os dados aqui cadastrados devem obedecer ao sorteio realizado pela Fifa.<br />
        Cadastre as informações adicionais para os jogos de cada grupo da Copa do Mundo FiFa 2014.
    </p>

    <% using (Html.BeginForm())
       { %>
    <div id="mensagemErro">
        <p>
            <%: Html.Label("mensagem", ViewBag.Mensagem as String) %>
        </p>
    </div>
    <div>
        <table id="tb1">
            <tr>
                <th>Rodada</th>
                <th>Data</th>
                <th>Local</th>
                <th colspan="3">Confronto</th>
                <th>Horário</th>
                <th>Ação</th>
            </tr>
            <% var jogos = ViewBag.Jogos as List<PortalAdmnistrativo.Models.Jogo>;
               if (ViewBag.Jogos != null)
               {
                   foreach (var item in jogos)
                   {%>
            <tr>
                <td><%: item.Rodada %></td>
                <td><%: item.DataHora.ToString("dd/MM/yyyy")   %></td>
                <td><%: item.NomeCidade %></td>
                <td><%: item.NomeSelecaoA %> </td>
                <td>X </td>
                <td><%: item.NomeSelecaoB %></td>
                <td><%: item.DataHora.ToString("hh:mm") %></td>
                <td><%: Html.ActionLink("Editar", "EditarJogo", new { id=item.CodigoJogo }) %> 
 </td>
            </tr>
            <%}
            }%>
        </table>
    </div>
    <div id="pageNav"></div>
    <script>
        var pager = new Pager('tb1', 10);
        pager.init();
        pager.showPageNav('pager', 'pageNav');
        pager.showPage(1);
    </script>
    <% } %>
    <br />
    <div>
        <%: Html.ActionLink("Voltar", "Index") %>
    </div>

</asp:Content>

