<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%
    using (Html.BeginForm()) {
%>

    <div class="painel_campos">
        <% Html.RenderPartial("_editar"); %>
    </div>
    <div class="painel_botao">
        <input type="submit" value="<%: PortalAdmnistrativo.Resouces.Geral.btnSalvar %>" />
    </div>

<%  } %>