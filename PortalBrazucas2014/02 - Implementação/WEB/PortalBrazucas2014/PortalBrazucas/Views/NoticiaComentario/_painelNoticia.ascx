<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Noticia>" %>

<h1><%: Model.Titulo %></h1>

<h3>
    Autor: <%: Model.Autor %>
    <br />
    Categoria: <%: Model.DescricaoCategoria %>
</h3>



<%
    ConteudoNoticia.Text = Model.Conteudo;
%>

<asp:Literal ID="ConteudoNoticia" runat="server"></asp:Literal>