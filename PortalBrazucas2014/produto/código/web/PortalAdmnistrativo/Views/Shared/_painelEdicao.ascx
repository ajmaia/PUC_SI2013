<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%
    using (Html.BeginForm("Editar", ViewContext.RouteData.Values["controller"].ToString(), FormMethod.Post, new { id = "acaoGrid" }))
    {
%>

    <div class="painel_campos">
        <% Html.RenderPartial("_editar"); %>
    </div>

<%  } %>