<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Anuncio>" %>

<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.Titulo) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.Titulo, new { @class = "controle875" }) %>
        <%: Html.ValidationMessageFor(item => item.Titulo) %>
    </div>
</div>
<div class="clear"></div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.DataPublicacao) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.DataPublicacaoString, new { @class = "datePicker" }) %>
        <script type="text/javascript">
            $(".datePicker").datepicker({
                showOn: "both",
                buttonImage: "/Content/themes/images/icones/ico_calendar.gif",
                buttonImageOnly: true,
                gotoCurrent: true,
                dateFormat: "dd/mm/yy"
            });

            $(".datePicker").autocomplete({
                showOn: "both",
                buttonImage: "/Content/themes/images/icones/ico_calendar.gif",
                buttonImageOnly: true,
                gotoCurrent: true,
                dateFormat: "dd/mm/yy"
            });
        </script>
        <%: Html.ValidationMessageFor(item => item.DataPublicacao) %>
    </div>
</div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.Categoria) %>
    </div>
    <div class="campos">
        <%: Html.DropDownListFor(item => item.CodigoCategoria, new SelectList(ViewBag.ListaCategorias, "Value", "Text"), PortalAdmnistrativo.Resouces.Geral.optSelecionarTodos, new { @class = "controle500" }) %>
        <%: Html.ValidationMessageFor(item => item.Categoria) %>
    </div>
</div>               