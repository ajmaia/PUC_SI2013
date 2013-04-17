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
                  grid.Column(columnName: "CodigoNoticia", header: PortalAdmnistrativo.Resouces.Noticia.CodigoNoticia, format: (item) => item.CodigoNoticia, style: "webgrid-coluna120"),  
                  grid.Column(columnName: "Titulo", header: PortalAdmnistrativo.Resouces.Noticia.Titulo, format: (item) => item.Titulo, style: "webgrid-coluna300"),
                  grid.Column(columnName: "DataPublicacao", header: PortalAdmnistrativo.Resouces.Noticia.DataPublicacao, format: (item) => item.DataPublicacao, style: "webgrid-coluna120"),
                  grid.Column(columnName: "DescricaoCategoria", header: PortalAdmnistrativo.Resouces.Categoria.DescricaoCategoria, format: (item) => item.DescricaoCategoria, style: "webgrid-coluna120")
              ))
%>

                