<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="IndexTitulo" ContentPlaceHolderID="TitleContent" runat="server">
    Home | Destaques
</asp:Content>

<asp:Content ID="IndexConteudo" ContentPlaceHolderID="MainContent" runat="server">
    <div id="destaquePrincipal">
        <% Html.RenderPartial("_painelNoticiaPrincipal", (PortalAdmnistrativo.Models.Noticia)ViewBag.NoticiaPrincipal); %>
    </div>
    <div id="destaqueSecundario">
        <% Html.RenderPartial("_painelNoticiaSecundaria", (PortalAdmnistrativo.Models.Noticia)ViewBag.NoticiaSecundaria); %>
    </div>
    <div id="destaqueTerciario">
        <% Html.RenderPartial("_painelNoticiaTerciaria", (PortalAdmnistrativo.Models.Noticia)ViewBag.NoticiaTerciaria); %>
    </div>
    <div id="credencie">
        <div class='painel_titulo'><%: DateTime.Now.ToShortDateString() %></div>

        Colocar uma imagem link pra redirecionar para cadastro
    </div>
</asp:Content>
