<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="IndexTitulo" ContentPlaceHolderID="TitleContent" runat="server">
    <%: PortalAdmnistrativo.Resouces.Padrao.Titulo %>
</asp:Content>

<asp:Content ID="IndexConteudo" ContentPlaceHolderID="MainContent" runat="server">
    <div class='painel_titulo'><%: PortalAdmnistrativo.Resouces.Padrao.TituloBusca %></div>
    <div id="painel_filtros">
        <% Html.RenderPartial("_painelFiltros", (PortalAdmnistrativo.Models.Padrao)ViewBag.Parametros); %>
    </div>
    <div class='painel_titulo'><%: PortalAdmnistrativo.Resouces.Padrao.TituloResultado %></div>
    <div id="resultado">
        <% Html.RenderPartial("_painelResultados", (IEnumerable<PortalAdmnistrativo.Models.Padrao>)ViewBag.Resultados); %>
    </div>
</asp:Content>
