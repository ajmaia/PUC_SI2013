﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Comentario>" %>

<%
    using (Html.BeginForm("NovoComentario", ViewContext.RouteData.Values["controller"].ToString(), FormMethod.Post))
    {
%>
    <div class="detalhes_contario">
        <div style="font-size: 15px; color: #0e7019; float: left;">
            <%: Html.DisplayFor(model => model.NomeLoginCriacao) %>&nbsp;
        </div>
        <div style="font-size: 12px; color: #7aea86; padding-top: 2px;">
            (<%: Html.DisplayFor(model => model.DataCriacaoString) %>)
        </div>
    </div>
    <div class="painel_campos">
        <div class="conjunto_campo">
            <div class="campos">
                <%: Html.TextAreaFor(item => item.Conteudo, new { @class = "controle875" }) %>
                <%: Html.HiddenFor(model => model.CodigoNoticia) %>
                <%: Html.HiddenFor(model => model.LoginCriacao) %>
                <%: Html.HiddenFor(model => model.NomeLoginCriacao) %>
                <%: Html.ValidationMessageFor(item => item.Conteudo) %>
            </div>
        </div>
    </div>
    <div class="painel_botao">
        <input type="submit" value="<%: PortalAdmnistrativo.Resouces.Comentario.btnIncluir %>"  />
    </div>
<%  } %>