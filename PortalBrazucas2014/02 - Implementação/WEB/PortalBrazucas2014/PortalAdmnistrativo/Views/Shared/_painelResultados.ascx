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
    });

</script>