<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Jogo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Cadastrar Posição das Seleções nos Grupos da Copa
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Cadastrar Grupos da Copa</h2>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery-1.3.2.min.js")%>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/GrupoSelecionado.js")%>" type="text/javascript"></script>

    <p>
        Todos os dados aqui cadastrados devem obedecer ao sorteio realizado pela Fifa.<br />
        Cadastre os grupos que comporão a tabela de jogos.
    </p>
    <p>
        É possível alterar o cadastro já realizado, bastando selecionar o grupo e definir a nova posição das seleções no grupo.
    </p>

    <% using (Html.BeginForm())
       { %>
    <div id="mensagemErro">
        <p>
            <%: Html.Label("mensagem", ViewBag.Mensagem as String) %>
        </p>
    </div>

    <%  if (ViewBag.GrupoSemCadastro != null)
        {%>

    <div class="semCadsatro1">
        <p>Grupos que não possuem cadastro de Seleção:</p>
        <div class="semCadastro">
            <%
            var listaGrupo = ViewBag.GrupoSemCadastro as IEnumerable<string>;
            foreach (var selecao in listaGrupo)
            {%>
            <%: Html.Label(selecao.ToString(), selecao.ToString()) %>  |  
        <% } %>
        </div>
    </div>
    <%     }%>

    <%  if (ViewBag.PaisSemCadastro != null)
        {%>

    <div class="semCadastro1">
        <p>Seleções que não possuem cadastro de ordem no grupo:</p>
        <div class="semCadastro">

            <%
            var listaGrupo = ViewBag.PaisSemCadastro as IEnumerable<PortalAdmnistrativo.Models.Selecao>;
            foreach (var selecao in listaGrupo)
            {%>
            <%: Html.Label(selecao.Nome.ToString(), selecao.Nome.ToString())%> |         
        <% } %>
        </div>
    </div>
    <%     }%>

    <div>
        <asp:Label ID="Label1" runat="server" Text="Selecione o grupo:"></asp:Label>
        <%: Html.DropDownList("Grupo", ViewBag.Grupos as IEnumerable<SelectListItem>, "Selecione um grupo")%>
    </div>
    <div id="partial">
    </div>
    <div>
        <input type="submit" runat="server" id="send" value="Criar Grupo" />
    </div>
    <% } %>
    <div>
        <%: Html.ActionLink("Voltar", "Index") %>
    </div>

</asp:Content>
