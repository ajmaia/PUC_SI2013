<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%
    using (Html.BeginForm("Excluir", ViewContext.RouteData.Values["controller"].ToString(), FormMethod.Post, new { id = "acaoGrid" }))
    {
%>
    <div id="grid">
        <% Html.RenderPartial("_excluir"); %>
    </div>

<%  } %>