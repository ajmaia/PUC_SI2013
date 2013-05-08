﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Noticia>" %>
<div id="divDestaquePrincipal" onclick="javascript:redirecionaNoticia('<%: Model.CodigoNoticia %>')" style="cursor: pointer;">
    <div class='painel_titulo'><%: Model.DataPublicacaoString %></div>
    <div style="float: left; background-image: url('<%: Model.CaminhoImagem %>'); background-position: center; background-repeat: no-repeat; background-size: contain; width: 135px; height: 60px;"></div>
    <div style="margin-left: 150px;">
        <div style="font-size: 16px; color: darkgreen; font-weight: bold;"><%: Model.Titulo %></div>
        <div><%: String.Format("Leia mais sobre o que {0} tem a dizer...",Model.Autor) %></div>
    </div>
</div>

<script language="javascript" type="text/javascript">
    function redirecionaNoticia(CodigoNoticia) {
        window.location.href = '/NoticiaComentario/redirecionar?CodNoticia=' + CodigoNoticia;
    }
</script>