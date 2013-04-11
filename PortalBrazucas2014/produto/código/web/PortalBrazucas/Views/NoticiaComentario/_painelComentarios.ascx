<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PortalAdmnistrativo.Models.Comentario>>" %>

<% foreach (var item in Model) 
   { %>
        <div class="detalhes_contario">
            <div style="font-size: 15px; color: #0e7019; float: left;">
                <%: Html.DisplayFor(modelItem => item.NomeLoginCriacao) %>&nbsp;
            </div>
            <div style="font-size: 12px; color: #7aea86; padding-top: 2px;">
                (<%: Html.DisplayFor(modelItem => item.DataCriacaoString) %>)
            </div>
        </div>
        <div class="conteudo_comentario">
            <%: Html.DisplayFor(modelItem => item.Conteudo) %>
        </div>
<% } %>