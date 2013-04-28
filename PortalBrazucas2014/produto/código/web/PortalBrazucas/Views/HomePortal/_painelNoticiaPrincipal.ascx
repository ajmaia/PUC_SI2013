<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Noticia>" %>
<div id="divDestaquePrincipal" onclick="javascript:redirecionaNoticia('<%: Model.CodigoNoticia %>')" style="cursor: pointer;">
    <div class='painel_titulo'><%: Model.DataPublicacaoString %></div>
    <div style="font-size: 28px; color: darkgreen; font-weight: bold;"><%: Model.Titulo %></div>
    <div style="background-image: url('<%: Model.CaminhoImagem %>'); background-position: center; background-repeat: no-repeat; width: 450px; height: 200px;"></div>
    <div><%: String.Format("Leia mais sobre o que {0} tem a dizer...",Model.Autor) %></div>
</div>

<script language="javascript" type="text/javascript">
    function redirecionaNoticia(CodigoNoticia) {
        window.location.href = '/NoticiaComentario/redirecionar?CodNoticia=' + CodigoNoticia;
    }
</script>