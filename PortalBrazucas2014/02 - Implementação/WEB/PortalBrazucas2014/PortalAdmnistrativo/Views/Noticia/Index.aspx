<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="IndexTitulo" ContentPlaceHolderID="TitleContent" runat="server">
    <%: PortalAdmnistrativo.Resouces.Noticia.CasoUso %>
</asp:Content>

<asp:Content ID="IndexConteudo" ContentPlaceHolderID="MainContent" runat="server">
    <div class='painel_titulo'><%: PortalAdmnistrativo.Resouces.Geral.pnlTituloBusca %></div>
    <div id="painel_filtros">
        <% Html.RenderPartial("_painelFiltros", (PortalAdmnistrativo.Models.Noticia)ViewBag.Parametros); %>
    </div>
    <div class='painel_titulo'><%: PortalAdmnistrativo.Resouces.Geral.pnlTituloResultado %></div>
    <div id="resultado">
        <% Html.RenderPartial("_painelResultados", (IEnumerable<PortalAdmnistrativo.Models.Noticia>)ViewBag.Resultados); %>
    </div>

    <div class="clear"></div>
    <div class="campo_botao">
        <input type="submit" class="button" value="<%: PortalAdmnistrativo.Resouces.Geral.btnIncluir %>" onclick="javascript:carregarPopUpIncluir();"/>
    </div>
</asp:Content>
