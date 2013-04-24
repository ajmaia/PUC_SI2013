<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

    <div id="icone_login" onclick="EfetuarLogin();"></div>
    <div id="logado" class="controles_login" style="padding-right: 10px; margin-top: 10px; display: none;">Bem vindo(a) USUÁRIO!</div>
    <div id="naologado" class="controles_login">
        <input id="password" type="password" value="senha" class="campo_login"/>
        <input id="user" type="text" value="Usuário" class="campo_login"/>
    </div>

<script language="javascript" type="text/javascript">
    function EfetuarLogin() {
        var usuario = document.getElementById("user").value;
        var senha = document.getElementById("password").value;

        $.ajax({
            url: "/UsuarioPortal/EfetuarLogin",
            data: {
                user: usuario,
                password: senha
            },
            type: "POST",
            async: false
        });
    }
</script>