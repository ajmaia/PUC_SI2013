$(document).ready(function () {
    $("#mensagem").change(MostraMensagem());

});

function MostraMensagem() {
    var mensagem = document.getElementById("mensagem").valueOf();
    if (mensagem != null) {
        return alert(mensagem);
    }
}