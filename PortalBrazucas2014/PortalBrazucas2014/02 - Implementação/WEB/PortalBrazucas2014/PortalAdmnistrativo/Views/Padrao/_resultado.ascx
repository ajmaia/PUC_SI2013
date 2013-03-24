<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PortalAdmnistrativo.Models.Padrao>>" %>

<%
    var idItem = "item_" + Guid.NewGuid().ToString().Substring(0, 5).Replace("-", "");
    var grid = new WebGrid(source: Model, selectionFieldName: "SelectedRow", rowsPerPage: 5, ajaxUpdateContainerId: "grid");
%>

<%:
    grid.GetHtml(tableStyle: "webgrid",
              headerStyle: "webgrid-header",
              rowStyle: "webgrid-row", 
              alternatingRowStyle: "webgrid-row-alt",
              selectedRowStyle: "webgrid-row-sel",
              footerStyle: "webgrid-footer",
              columns: grid.Columns(
                  grid.Column(format: (item) => new HtmlString(String.Format("<input style=\"height: 10px;\" class=\"check-box\" name=\"CodPadrao\" type=\"checkbox\" value=\"{0}\" />", item.CodigoPadrao)), style: "webgrid-botoes"),
                  grid.Column(columnName: "CodigoPadrao", header: PortalAdmnistrativo.Resouces.Padrao.CodigoPadrao, format: (item) => item.CodigoPadrao, style: "webgrid-coluna120"),
                  grid.Column(columnName: "Titulo", header: PortalAdmnistrativo.Resouces.Padrao.Titulo, format: (item) => item.Titulo, style: "webgrid-coluna300"),
                  grid.Column(columnName: "DataCadastro", header: PortalAdmnistrativo.Resouces.Padrao.DataCadastro, format: (item) => item.DataCadastro, style: "webgrid-coluna120"),
                  grid.Column(columnName: "Status", header: PortalAdmnistrativo.Resouces.Padrao.Status, format: (item) => item.Status, style: "webgrid-coluna120"),
                  grid.Column(format: (item) => new HtmlString(String.Format("<a href=\"javascript:carregarPopUp({0},'Editar')\" class=\"webgrid-editar\"></a>", item.CodigoPadrao)), style: "webgrid-botoes"),
                  grid.Column(format: (item) => new HtmlString(String.Format("<a href=\"javascript:carregarPopUp({0},'Excluir')\" class=\"webgrid-exluir\"></a>", item.CodigoPadrao)), style: "webgrid-botoes")
              ))
%>

<script language="javascript" type="text/javascript">

    function excluirSelecionados() {

        var codsMarcados = "";

        $("input[type=checkbox][name='CodPadrao']:checked").each(function () {
            codsMarcados = codsMarcados + ($(this).val()) + ";";
        });

        $("body").append("<div id='popup'></div>");

        $.ajax({
            url: "/Padrao/ExcluirSelecionados",
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

    function carregarPopUp(cod, acao) {
        $("body").append("<div id='popup'></div>")

        var wid = acao == "Excluir" ? 400 : 400;

        $.ajax({
            url: "/Padrao/" + acao,
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
                        title: acao
                    })
                    .html(data);
            },
            type: "GET",
            async: false
        });
    }

    $(document).ready(function () {
        $(".check-box").click(function () {
            var exibe = false;

            $("input[type=checkbox][name='CodPadrao']:checked").each(function () {
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

</script>