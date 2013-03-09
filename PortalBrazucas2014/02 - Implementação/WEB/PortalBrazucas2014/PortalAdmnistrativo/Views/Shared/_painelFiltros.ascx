<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<% using (Ajax.BeginForm(
        "Buscar",
        ViewContext.RouteData.Values["controller"].ToString(),
        new AjaxOptions
        {
            InsertionMode = InsertionMode.InsertBefore,
            UpdateTargetId = "resultados",
            HttpMethod = "POST"
        }))
    {
%>
    <div class="painel_campos">
        <% Html.RenderPartial("_campos"); %>
    </div>
    <div class="painel_botao">
        <input type="submit" value="<%: PortalAdmnistrativo.Resouces.Geral.btnLimpar %>" />
        <input type="submit" value="<%: PortalAdmnistrativo.Resouces.Geral.btnPesquisar %>" />
    </div>

<%  } %>
