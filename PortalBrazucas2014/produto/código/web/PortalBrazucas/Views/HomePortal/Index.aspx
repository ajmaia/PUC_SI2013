<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="IndexTitulo" ContentPlaceHolderID="TitleContent" runat="server">
    Home | Destaques
</asp:Content>

<asp:Content ID="IndexConteudo" ContentPlaceHolderID="MainContent" runat="server">
    <div id="destaquePrincipal">
        <% 
            if (ViewBag.NoticiaPrincipal != null)
                Html.RenderPartial("_painelNoticiaPrincipal", (PortalAdmnistrativo.Models.Noticia)ViewBag.NoticiaPrincipal);
        %>
    </div>
    <div id="destaqueSecundario">
        <% 
            if (ViewBag.NoticiaSecundaria != null)
                Html.RenderPartial("_painelNoticiaSecundaria", (PortalAdmnistrativo.Models.Noticia)ViewBag.NoticiaSecundaria); 
        %>
    </div>
    <div id="destaqueTerciario">
        <% 
            if (ViewBag.NoticiaTerciaria != null)
                Html.RenderPartial("_painelNoticiaTerciaria", (PortalAdmnistrativo.Models.Noticia)ViewBag.NoticiaTerciaria); 
        %>
    </div>
    <div id="credencie">
        <div class='painel_titulo'><%: DateTime.Now.ToShortDateString() %></div>

        <div onclick="javascript: window.location.href='/UsuarioPortal/Create';" style="cursor: pointer;">
            Cadastre-se em nosso portal...
        </div>
    </div>
</asp:Content>
