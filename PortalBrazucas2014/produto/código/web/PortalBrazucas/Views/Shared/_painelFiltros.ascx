<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%
    using (Ajax.BeginForm(
        "Buscar",
        ViewContext.RouteData.Values["controller"].ToString(),
        new AjaxOptions
        {
            InsertionMode = InsertionMode.Replace,
            UpdateTargetId = "resultado",
            HttpMethod = "POST",
            OnSuccess = string.Format("$('#resultado').load('_painelResultados');")
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
                    width: 800,
                    height: 600,
                    title: '<%: String.Format("{0} {1}", PortalAdmnistrativo.Resouces.Geral.pnlTituloInclusao, ViewContext.RouteData.Values["controller"].ToString()) %>',
                    buttons: {
                        Salvar: function () {
                            $('#incluir').submit();
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