<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" validateRequest="false" %>

<asp:Content ID="NoticiaTitulo" ContentPlaceHolderID="TitleContent" runat="server">
    <%: PortalBrazucas.Resource.PortalResource.TituloExibirNoticia %>
    |
    <%: ((PortalAdmnistrativo.Models.Noticia)ViewBag.Noticia).Titulo %>
</asp:Content>

<asp:Content ID="NoticiaConteudo" ContentPlaceHolderID="MainContent" runat="server">
    <div class='painel_titulo'><%: ((PortalAdmnistrativo.Models.Noticia)ViewBag.Noticia).DataPublicacaoString %></div>
    <div id="painel_noticia">
        <% Html.RenderPartial("_painelNoticia", (PortalAdmnistrativo.Models.Noticia)ViewBag.Noticia); %>
    </div>
    <div class='painel_titulo'><%: PortalBrazucas.Resource.PortalResource.TituloExibirComentario %></div>
    <div id="painel_comentarios">
        <% Html.RenderPartial("_painelComentarios", (IEnumerable<PortalAdmnistrativo.Models.Comentario>)ViewBag.Comentarios); %>
    </div>
</asp:Content>
