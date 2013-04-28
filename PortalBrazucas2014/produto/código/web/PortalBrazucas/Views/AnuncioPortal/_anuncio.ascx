<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Anuncio>" %>

<div class="anuncio">
<% if(String.IsNullOrEmpty(Model.Conteudo)) { %>
    <div style="font-size: 16px; color: darkgreen; font-weight: bold; padding-bottom: 3px; text-align: center; width: 325px;"><%: Model.Titulo %></div>
    <div style="float: left; background-image: url('<%: Model.CaminhoImagem %>'); background-position: center; background-repeat: no-repeat; width: 325px; height: 130px; margin-top: 3px;"></div>
<% } else if (DateTime.Now.Millisecond % 2 == 0) { %>
    <div style="float: left; background-image: url('<%: Model.CaminhoImagem %>'); background-position: center; background-repeat: no-repeat; width: 200px; height: 150px; margin-top: 3px;"></div>
    <div style="float: left; padding-left: 10px; width: 118px;">
        <div style="font-size: 16px; color: darkgreen; font-weight: bold; padding-bottom: 3px;"><%: Model.Titulo %></div>
        <div><%: Model.Conteudo %></div>
    </div>
<% } else { %>
    <div style="float: left; padding-left: 10px; width: 118px;">
        <div style="font-size: 16px; color: darkgreen; font-weight: bold; padding-bottom: 3px;"><%: Model.Titulo %></div>
        <div><%: Model.Conteudo %></div>
    </div>
    <div style="float: left; background-image: url('<%: Model.CaminhoImagem %>'); background-position: center; background-repeat: no-repeat; width: 200px; height: 150px; margin-top: 3px;"></div>
<% } %>
</div>

