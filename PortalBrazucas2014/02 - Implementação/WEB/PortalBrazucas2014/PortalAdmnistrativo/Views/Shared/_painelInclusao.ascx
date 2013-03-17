<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<div id="painelInclusao">
<%
    using (Html.BeginForm()) {
%>

    <div class="painel_campos">
        <% Html.RenderPartial("_incluir"); %>
    </div>
    <div class="painel_botao">
        <input type="submit" value="<%: PortalAdmnistrativo.Resouces.Geral.btnIncluir %>" />
    </div>

<%  } %>
</div>