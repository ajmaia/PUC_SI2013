$(document).ready(function () {

    //Assina o evento onchange do DropDownList
    $("#Grupo").change(Grupo_Selecionado);
    //$("#Pos1").change(VerificaPais);
    //$("#Pos2").change(VerificaPais);
    //$("#Pos3").change(VerificaPais);
    //$("#Pos4").change(VerificaPais);
});

function Pais_Selecionado() {

    // Envia o país selecionado e recupera a lista menos o selecionado.
    $.post("PaisSelecionado", { Pos1: $("#Pos1").val() }, Pais_SelecionadoRetorno, "Json");
}

function Pais_SelecionadoRetorno(listaPais) {

    $("Pos2").append(listaPais);
    
}

function Grupo_Selecionado() {

    //Envia o item selecionado para Action "Produto" do Controller Home
    $.post("GrupoEscolhido", { GrupoID: $("#Grupo").val() }, Grupo_SelecionadoRetorno, "Json");
}

function Grupo_SelecionadoRetorno(partial) {

    //Limpa o conteúdo da div
    $("#partial").empty();

        //adiciona o novo conteúdo
        $("#partial").append(partial);
}

function VerificaPais() {
    var Pais1 = intParse($("#Pos1").val());
    var Pais2 = intParse($("#Pos2").val());
    var Pais3 = intParse($("#Pos3").val());
    var Pais4 = intParse($("#Pos4").val());
    if (Pais1 > 0) {
        if (Pos1 == Pos2 || Pos1 == Pos3 || Pos1 == Pos4 || Pos2 == Pos3 || Pos3 == Pos4)
            alert("Erro!");
        else
            alert();
    }
}