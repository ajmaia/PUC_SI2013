<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PortalAdmnistrativo.Models.Cidade>>" %>

<asp:Content ID="IndexTitulo" ContentPlaceHolderID="TitleContent" runat="server">
    <%: PortalBrazucas.Resource.PortalResource.TituloExibirCidade %>    
</asp:Content>

<asp:Content ID="IndexConteudo" ContentPlaceHolderID="MainContent" runat="server">
    <% foreach (var item in Model) {
        Html.RenderPartial("_cidade", item);
    } %>
</asp:Content>