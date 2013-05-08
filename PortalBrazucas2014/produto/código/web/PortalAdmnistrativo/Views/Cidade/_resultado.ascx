<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PortalAdmnistrativo.Models.Cidade>>" %>

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
                  grid.Column(format: (item) => new HtmlString(String.Format("<input style=\"height: 10px;\" class=\"check-box\" name=\"CodigoGrid\" type=\"checkbox\" value=\"{0}\" />", item.CodigoCidade)), style: "webgrid-botoes"),
                  grid.Column(columnName: "Nome", header: PortalAdmnistrativo.Resouces.Cidade.Nome, format: (item) => item.Nome, style: "webgrid-coluna120"),
                  grid.Column(columnName: "UF", header: PortalAdmnistrativo.Resouces.Cidade.UF, format: (item) => item.UF, style: "webgrid-botoes"),
                  grid.Column(columnName: "NomeEstadio", header: PortalAdmnistrativo.Resouces.Cidade.NomeEstadio, format: (item) => item.NomeEstadio, style: "webgrid-coluna120"),
                  grid.Column(columnName: "CapacidadeEstadio", header: PortalAdmnistrativo.Resouces.Cidade.CapacidadeEstadio, format: (item) => item.CapacidadeEstadio, style: "webgrid-coluna120"),
                  grid.Column(format: (item) => new HtmlString(String.Format("<a href=\"javascript:carregarPopUp({0},'Editar')\" class=\"webgrid-editar\"></a>", item.CodigoCidade)), style: "webgrid-botoes"),
                  grid.Column(format: (item) => new HtmlString(String.Format("<a href=\"javascript:carregarPopUp({0},'Excluir')\" class=\"webgrid-exluir\"></a>", item.CodigoCidade)), style: "webgrid-botoes")
              )
    )
%>