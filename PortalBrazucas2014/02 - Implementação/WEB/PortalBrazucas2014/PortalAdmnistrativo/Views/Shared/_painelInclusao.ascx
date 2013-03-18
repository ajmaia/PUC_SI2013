<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%
    using (Html.BeginForm("Create", ViewContext.RouteData.Values["controller"].ToString(), FormMethod.Post, new { id = "incluir" }))
    {
%>

    <div class="painel_campos">
        <% Html.RenderPartial("_incluir"); %>
    </div>

<%  } %>