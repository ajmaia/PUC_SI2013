<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PortalAdmnistrativo.Models.Noticia>>" %>

<asp:Content ID="IndexTitulo" ContentPlaceHolderID="TitleContent" runat="server">
    <%: PortalBrazucas.Resource.PortalResource.TituloExibirNoticia %>    
</asp:Content>

<asp:Content ID="IndexConteudo" ContentPlaceHolderID="MainContent" runat="server">
    <% foreach (var item in Model) {
        Html.RenderPartial("_noticia", item);
    } %>
</asp:Content>