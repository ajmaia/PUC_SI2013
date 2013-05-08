<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Cidade>" %>
<div id="divDestaquePrincipal" onclick="javascript:redirecionaCidade('<%: Model.CodigoCidade %>')" style="cursor: pointer;">
    <div class='painel_titulo'><%: Model.Nome %></div>
    <div style="float: left; background-image: url('<%: Model.CaminhoImagem %>'); background-position: center; background-repeat: no-repeat; background-size: contain; width: 135px; height: 60px;"></div>
    <div style="margin-left: 150px;">
        <div style="font-size: 16px; color: darkgreen; font-weight: bold;"><%: Model.NomeEstadio %></div>
        <div><%: String.Format("Sobre o Estádio: {0}", Model.InformacoesEstadio) %></div>
    </div>
</div>

<script language="javascript" type="text/javascript">
    function redirecionaCidade(CodigoCidade) {
        window.location.href = '/CidadeSede/redirecionar?CodCidade=' + CodigoCidade;
    }
</script>