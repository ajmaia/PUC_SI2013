<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Cidade>" %>

<asp:Content ID="CidadeTitulo" ContentPlaceHolderID="TitleContent" runat="server">
    <%: PortalBrazucas.Resource.PortalResource.TituloExibirCidade %>    
    |
    <%: ((PortalAdmnistrativo.Models.Cidade)ViewBag.Cidade).Nome %>
</asp:Content>

<asp:Content ID="CidadeConteudo" ContentPlaceHolderID="MainContent" runat="server">
    <div class='painel_titulo'><%: ((PortalAdmnistrativo.Models.Cidade)ViewBag.Cidade).Nome %></div>
    <div id="painel_noticia">
        <% Html.RenderPartial("_painelCidade", (PortalAdmnistrativo.Models.Cidade)ViewBag.Cidade); %>
    </div>
    </div>
</asp:Content>