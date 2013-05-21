<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PortalAdmnistrativo.Models.Jogo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Administrar Tabela de Jogos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Content/TabelaJogos.css" rel="stylesheet" />
    <h2>Administrar Tabela de Jogos</h2>
    <p>
        Siga as etapas para realizar a administração da Tabela de Jogos
    </p>
    <div class="linkCadastro">
        <div class="posicaoLink">
            <%: Html.ActionLink("1 - Cadastrar Grupos da Copa", "CadastrarGrupo")%>
        </div>
    </div>
    <div class="linkCadastro">
        <div class="posicaoLink">
            <% if (ViewBag.Etapa2 == "True")
               { %>
            <%: Html.ActionLink("2 - Cadastrar Jogos do Grupo", "CadastrarJogo") %>
            <%} %>
            <% else
               { %>
            <%: Html.Label("2 - Cadastrar Jogos do Grupo") %>
            <%} %>
        </div>
    </div>
    <div class="linkCadastro">
        <div class="posicaoLink">
            <% if (ViewBag.Etapa2 == "True")
               { %>

            <%: Html.ActionLink("3 - Alterar Placar - Fase de Grupo", "FaseEliminatoria") %>
            <%} %>
            <% else
               { %>
            <%: Html.Label("3 - Alterar Placar - Fase de Grupo") %>
            <%} %>
        </div>
    </div>

</asp:Content>
