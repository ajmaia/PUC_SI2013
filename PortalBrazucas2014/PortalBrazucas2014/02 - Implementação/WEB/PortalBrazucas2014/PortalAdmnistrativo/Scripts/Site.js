$(document).ready(function () {

    $("#icone_portal").hover(function () {
        $("#menu_portal").show();
        },
        function () {
            $("#menu_portal").hide();
        });
    $("#menu_portal").hover(function () {
            $("#menu_portal").show();
            $("#icone_portal").attr("id", "ico_portal_hover");
        },
        function () {
            $("#menu_portal").hide();
            $("#ico_portal_hover").attr("id", "icone_portal");
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