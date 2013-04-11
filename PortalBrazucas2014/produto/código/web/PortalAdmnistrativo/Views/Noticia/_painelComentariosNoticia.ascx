<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PortalAdmnistrativo.Models.Comentario>>" %>

<div class="painel_campos">
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
                  grid.Column(columnName: "DataCriacaoString", header: PortalAdmnistrativo.Resouces.Comentario.DataCriacao, format: (item) => item.DataCriacaoString, style: "webgrid-coluna120"),
                  grid.Column(columnName: "LoginCriacao", header: PortalAdmnistrativo.Resouces.Comentario.LoginCriacao, format: (item) => item.LoginCriacao, style: "webgrid-coluna120"),
                  grid.Column(columnName: "Conteudo", header: PortalAdmnistrativo.Resouces.Comentario.Conteudo, format: (item) => item.Conteudo, style: "webgrid-coluna300"),
                  grid.Column(columnName: "UsuarioAprovacao", header: PortalAdmnistrativo.Resouces.Comentario.UsuarioAprovacao, format: (item) => item.UsuarioAprovacao, style: "webgrid-coluna120"),
                  grid.Column(format: (item) => (item.StatusAprovacao == "1" ? new HtmlString(String.Format("<a href=\"#\" class=\"webgrid-aprovar-off\"></a>", item.CodigoNoticia)) : 
                      new HtmlString(String.Format("<a href=\"javascript:AprovarComentario({0})\" class=\"webgrid-aprovar\"></a>", item.CodigoComentario))), style: "webgrid-botoes"),
                  grid.Column(format: (item) => (item.StatusAprovacao == "0" ? new HtmlString(String.Format("<a href=\"#\" class=\"webgrid-reprovar-off\"></a>", item.CodigoNoticia)) :
                      new HtmlString(String.Format("<a href=\"javascript:ReprovarComentario({0})\" class=\"webgrid-reprovar\"></a>", item.CodigoComentario))), style: "webgrid-botoes")
              )
    )
%>
</div>

<script language="javascript" type="text/javascript">

    function AprovarComentario(cod) {
        $.ajax({
            url: "/Noticia/AprovarComentario",
            data: {
                id: cod
            },
            success: function (data) {
                $("#popup").load("_painelIncluirComentario");
            },
            type: "GET",
            async: false
        });
    }

    function ReprovarComentario(cod) {
        $.ajax({
            url: "/Noticia/ReprovarComentario",
            data: {
                id: cod
            },
            success: function (data) {
                $("#popup").load("_painelIncluirComentario");
            },
            type: "GET",
            async: false
        });
    }
</script>