$(document).ready(function () {
    $("#icone_admin").hide();

    $("#icone_admin").hover(function () {
            $("#menu_admin").show();
        },
        function () {
            $("#menu_admin").hide();
        });
        $("#menu_admin").hover(function () {
            $("#menu_admin").show();
            $("#icone_admin").attr("id", "ico_admin_hover");
        },
        function () {
            $("#menu_admin").hide();
            $("#ico_admin_hover").attr("id", "icone_admin");
    });


    $("#icone_idioma").hover(function () {
        $("#menu_idioma").show();
        },
        function () {
            $("#menu_idioma").hide();
        });
        $("#menu_idioma").hover(function () {
            $("#menu_idioma").show();
            $("#icone_idioma").attr("id", "ico_idioma_hover");
        },
        function () {
            $("#menu_idioma").hide();
            $("#ico_idioma_hover").attr("id", "icone_idioma");
    });
});


function trocaLogin() {
    if (document.getElementById("logado").style.display == "none") {
        document.getElementById("logado").style.display = "";
        document.getElementById("naologado").style.display = "none";
        document.getElementById("icone_login").id = "icone_logout";
        document.getElementById("icone_admin").style.display = "";
    }
    else {
        document.getElementById("logado").style.display = "none";
        document.getElementById("naologado").style.display = "";
        document.getElementById("icone_logout").id = "icone_login";
        document.getElementById("icone_admin").style.display = "none";
    }
}