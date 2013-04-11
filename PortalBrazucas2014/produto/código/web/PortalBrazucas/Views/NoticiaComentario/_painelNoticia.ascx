<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Noticia>" %>

<h1><%: Model.Titulo %></h1>

<h3>
    <%: Model.DescricaoCategoria %>
    <br />
    Autor: <%: Model.Autor %>    
</h3>

<%
    ConteudoNoticia.Text = Model.Conteudo;
%>

<asp:Literal ID="ConteudoNoticia" runat="server"></asp:Literal>