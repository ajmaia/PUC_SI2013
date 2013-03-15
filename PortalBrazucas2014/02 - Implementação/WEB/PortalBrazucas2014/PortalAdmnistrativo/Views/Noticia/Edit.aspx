<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Noticia>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Noticia</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CodigoNoticia) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CodigoNoticia) %>
            <%: Html.ValidationMessageFor(model => model.CodigoNoticia) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Titulo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Titulo) %>
            <%: Html.ValidationMessageFor(model => model.Titulo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DataPublicacao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DataPublicacao) %>
            <%: Html.ValidationMessageFor(model => model.DataPublicacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Categoria) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Categoria) %>
            <%: Html.ValidationMessageFor(model => model.Categoria) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Conteudo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Conteudo) %>
            <%: Html.ValidationMessageFor(model => model.Conteudo) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
