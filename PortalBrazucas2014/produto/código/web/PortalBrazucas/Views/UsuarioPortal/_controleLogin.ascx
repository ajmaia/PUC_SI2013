<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

    <div id="icone_login" onclick="trocaLogin();"></div>
    <div id="logado" class="controles_login" style="padding-right: 10px; margin-top: 10px; display: none;">Bem vindo(a) USUÁRIO!</div>
    <div id="naologado" class="controles_login">
        <input type="text" value="senha" class="campo_login"/>
        <input type="password" value="Usuário" class="campo_login"/>
    </div>