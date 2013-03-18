<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%
    var modelo = (IEnumerable<object>)Model;
    var total = 0;
    if (modelo != null)
    {
        total = modelo.Count();
    }
    var viewResultado = "_resultado";
    var painelGrid = "grid";
    if (this.ViewBag.ViewResultado != null)
    {
        viewResultado = this.ViewBag.ViewResultado;
    }
    if (this.ViewBag.PainelGrid != null)
    {
        painelGrid = this.ViewBag.PainelGrid;
    }
%>

<div id='<%: painelGrid %>'>
<%
    if (modelo != null)
    {
        if (total == 0)
        {
%>
        <div class="grid_empty">
            <%: PortalAdmnistrativo.Resouces.Geral.grdGridVazio %>
        </div>
<%
        }
        else
        {
%>
             <div>
<%
                if (ViewBag.ListaModelo != null)
                {
                    Html.Partial("_ResultadoRodape");
                }
%>
            </div>
<%
            Html.RenderPartial(viewResultado, modelo);
           
        }
    }
%>
</div>
<div style="margin-top: 10px;">
    <div style="float:left;">
        <%: Html.CheckBox("All", new { id = "toggleAllCheckBox" }) %>
    </div>
    <div style="float:left; margin-top: 3px;">
        <%: Html.Label(PortalAdmnistrativo.Resouces.Geral.chkMarcarTodos) %>
    </div>
</div>
<div class="clear"></div>
<div class="campo_botao" id="divExcluirSelecionados">
    <input type="submit" class="button" value="<%: PortalAdmnistrativo.Resouces.Geral.chkExcluiSelecionados %>"/>
</div>


<script language="javascript" type="text/javascript">

    $(document).ready(function () {
        $("#divExcluirSelecionados").hide();

        $("#toggleAllCheckBox").click(function () {
            if ($(this).attr("checked")) {
                $(".check-box").attr("checked", true);
                $("#divExcluirSelecionados").show();

            } else {
                $(".check-box").attr("checked", false);
                $("#divExcluirSelecionados").hide();
            }
        });

        $(".check-box").click(function () {
            var exibe = false;

            $("input[type=checkbox][name='CodigoGrid']:checked").each(function () {
                exibe = true;
            });

            if (exibe) {
                $("#divExcluirSelecionados").show();
            }
            else {
                $("#divExcluirSelecionados").hide();
            }
        });
    });

    function carregarPopUp(cod, acao) {
        $("body").append("<div id='popup'></div>")
        
        var wid = 0;
        <% var tipo = ""; %>

        if(acao == "Excluir")
        {
            wid = 400;
            <% tipo = PortalAdmnistrativo.Resouces.Geral.pnlTituloExclusao; %>
        }
        else {
            wid = 400;
            <% tipo = PortalAdmnistrativo.Resouces.Geral.pnlTituloEdicao; %>
        }

        $.ajax({
            url: "/" + '<%: ViewContext.RouteData.Values["controller"].ToString() %>' + "/" + acao,
            data: {
                id: cod
            },
            success: function (data) {
                $("#popup")
                    .dialog({
                        close: function () {
                            $(this).remove();
                        },
                        resizable: false,
                        modal: true,
                        width: 580,
                        height: wid,
                        title: '<%: String.Format("{0} {1}", tipo, ViewContext.RouteData.Values["controller"].ToString()) %>',
                        buttons: {
                            Ok: function () {
                                $('#acaoGrid').submit();
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

    function excluirSelecionados() {

        var codsMarcados = "";

        $("input[type=checkbox][name='CodigoGrid']:checked").each(function () {
            codsMarcados = codsMarcados + ($(this).val()) + ";";
        });

        $("body").append("<div id='popup'></div>");

        $.ajax({
            url: "/" + '<%: ViewContext.RouteData.Values["controller"].ToString() %>' + "/ExcluirSelecionados",
            data: {
                listaCods: codsMarcados
            },
            success: function (data) {
                $("#popup")
                    .dialog({
                        close: function () {
                            $(this).remove();
                        },
                        resizable: false,
                        modal: true,
                        width: 580,
                        height: 400,
                        title: "Excluir Selecionados"
                    })
                    .html(data);
            },
            type: "GET",
            async: false
        });
    }

</script>