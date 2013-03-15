﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%
    using (Ajax.BeginForm(
        "Buscar",
        ViewContext.RouteData.Values["controller"].ToString(),
        new AjaxOptions
        {
            InsertionMode = InsertionMode.InsertBefore,
            UpdateTargetId = "resultados",
            HttpMethod = "POST",
            OnBegin = string.Format("$('#resultados').exibirCarregando();"),
            OnSuccess = string.Format("$('#resultados').ocultarCarregando();atualizarResultados();")
        }))
    {
%>

    <div class="painel_campos">
        <% Html.RenderPartial("_campos"); %>
    </div>
    <div class="painel_botao">
        <input type="button" value="<%: PortalAdmnistrativo.Resouces.Geral.btnLimpar %>" />
        <input type="submit" value="<%: PortalAdmnistrativo.Resouces.Geral.btnPesquisar %>" />
    </div>

<%  } %>

<script language="javascript" type="text/javascript">
    $("#painel_filtros").focalizarPrimeiroCampo();

    function carregarPopUpIncluir() {
        $("body").append("<div id='popupIncluir'></div>")

        var urlCaminho = "/" + '<%: ViewContext.RouteData.Values["controller"].ToString() %>' + "/Create"

        $.ajax({
            url: urlCaminho,
            success: function (data) {
                $("#popupIncluir")
                .dialog({
                    close: function () {
                        $(this).remove();
                    },
                    resizable: false,
                    modal: true,
                    width: 900,
                    height: 500,
                    title: '<%: String.Format("{0} {1}", PortalAdmnistrativo.Resouces.Geral.pnlTituloInclusao, ViewContext.RouteData.Values["controller"].ToString()) %>',
                    buttons: {
                        Salvar: function () {
                            $(this).dialog("close");
                        },
                        Cancelar: function () {
                            $(this).dialog("close");
                        }
                    }
                })
                .html(data);
            },
            type: "GET",
            async: false
    });
}
</script>