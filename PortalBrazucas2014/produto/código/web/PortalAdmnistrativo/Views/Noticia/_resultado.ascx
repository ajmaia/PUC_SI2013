<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PortalAdmnistrativo.Models.Noticia>>" %>

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
                  grid.Column(format: (item) => new HtmlString(String.Format("<input style=\"height: 10px;\" class=\"check-box\" name=\"CodigoGrid\" type=\"checkbox\" value=\"{0}\" />", item.CodigoNoticia)), style: "webgrid-botoes"),
                  grid.Column(columnName: "Titulo", header: PortalAdmnistrativo.Resouces.Noticia.Titulo, format: (item) => item.Titulo, style: "webgrid-coluna300"),
                  grid.Column(columnName: "DataPublicacao", header: PortalAdmnistrativo.Resouces.Noticia.DataPublicacao, format: (item) => item.DataPublicacao, style: "webgrid-coluna120"),
                  grid.Column(columnName: "DescricaoCategoria", header: PortalAdmnistrativo.Resouces.Categoria.DescricaoCategoria, format: (item) => item.DescricaoCategoria, style: "webgrid-coluna120"),
                  grid.Column(format: (item) => new HtmlString(String.Format("<a href=\"javascript:carregarPopUpGerenciarComentarios('{0}')\" class=\"webgrid-comentario\"></a>", item.CodigoNoticia)), style: "webgrid-botoes"),
                  grid.Column(format: (item) => new HtmlString(String.Format("<a href=\"javascript:carregarPopUp({0},'Editar')\" class=\"webgrid-editar\"></a>", item.CodigoNoticia)), style: "webgrid-botoes"),
                  grid.Column(format: (item) => new HtmlString(String.Format("<a href=\"javascript:carregarPopUp({0},'Excluir')\" class=\"webgrid-exluir\"></a>", item.CodigoNoticia)), style: "webgrid-botoes")
              )
    )
%>

<script language="javascript" type="text/javascript">

    function carregarPopUpGerenciarComentarios(cod) {
        $("body").append("<div id='popup'></div>")
        
        $.ajax({
            url: "/Noticia/GerenciarComentarios",
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
                        width: 1190,
                        height: 500,
                        title: '<%: PortalAdmnistrativo.Resouces.Comentario.GerenciarComentarios %>',
                        buttons: {
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