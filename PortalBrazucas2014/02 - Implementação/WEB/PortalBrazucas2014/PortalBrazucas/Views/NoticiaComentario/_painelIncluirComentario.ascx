<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Comentario>" %>

<%
    using (Html.BeginForm("NovoComentario", ViewContext.RouteData.Values["controller"].ToString(), FormMethod.Post))
    {
%>
    <div class="painel_campos">
        <div class="conjunto_campo">
            <div class="campos">
                <%: Html.HiddenFor(model => model.CodigoNoticia) %>
                <%: Html.HiddenFor(model => model.LoginCriacao) %>
                <%: Html.HiddenFor(model => model.NomeLoginCriacao) %>
                <%: Html.LabelFor(item => item.Conteudo) %>
            </div>
            <div class="campos">
                <%: Html.TextAreaFor(item => item.Conteudo, new { @class = "controle875" }) %>
                <%: Html.ValidationMessageFor(item => item.Conteudo) %>
            </div>
        </div>
    </div>
    <div class="painel_botao">
        <input type="submit" value="<%: PortalAdmnistrativo.Resouces.Geral.btnIncluir %>" />
    </div>
<%  } %>