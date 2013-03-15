﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PortalAdmnistrativo.Models.Padrao>>" %>

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
                grid.Column(columnName: "Titulo", header: PortalAdmnistrativo.Resouces.Noticia.Titulo, format: (item) => item.Titulo, style: "webgrid-coluna300"),
                grid.Column(columnName: "DataPublicacao", header: PortalAdmnistrativo.Resouces.Noticia.DataPublicacao, format: (item) => item.DataPublicacao, style: "webgrid-coluna120"),
                grid.Column(columnName: "Categoria", header: PortalAdmnistrativo.Resouces.Noticia.Categoria, format: (item) => item.Categoria, style: "webgrid-coluna120")
              ))
%>

                