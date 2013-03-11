<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<div id="grid">
    <% Html.RenderPartial("_resultado"); %>
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