<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="IndexTitulo" ContentPlaceHolderID="TitleContent" runat="server">
    <%: PortalAdmnistrativo.Resouces.Home.Titulo %>
</asp:Content>

<asp:Content ID="IndexConteudo" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: PortalAdmnistrativo.Resouces.Home.msgBemVindo %></h1>
</asp:Content>
