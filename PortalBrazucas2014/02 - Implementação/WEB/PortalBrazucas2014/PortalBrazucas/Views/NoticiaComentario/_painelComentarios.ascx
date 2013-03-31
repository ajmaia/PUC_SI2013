<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PortalAdmnistrativo.Models.Comentario>>" %>

<% foreach (var item in Model) 
   { %>
        <div class="detalhes_contario">
            <%: Html.DisplayFor(modelItem => item.NomeLoginCriacao) %>
            -
            <%: Html.DisplayFor(modelItem => item.DataCriacaoString) %>
        </div>
        <div class="conteudo_comentario">
            <%: Html.DisplayFor(modelItem => item.Conteudo) %>
        </div>
<% } %>