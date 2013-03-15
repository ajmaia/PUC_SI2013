<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%
    using (Html.BeginForm()) {
%>
    <fieldset class="fildset530">
        <legend><%: PortalAdmnistrativo.Resouces.Noticia.pnlTituloExclusao %></legend>

        <div id="grid">
            <% Html.RenderPartial("_excluir"); %>
        </div>

    </fieldset>
    <div class="painel_botao">
        <input type="submit" value="<%: PortalAdmnistrativo.Resouces.Geral.btnExcluir %>" />
    </div>

<%  } %>