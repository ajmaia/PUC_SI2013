<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Comentario>" %>

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
        <legend>Comentario</legend>

        <%: Html.HiddenFor(model => model.CodigoComentario) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Conteudo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Conteudo) %>
            <%: Html.ValidationMessageFor(model => model.Conteudo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.LoginCriacao, "Usuario") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("LoginCriacao", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.LoginCriacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeLoginCriacao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeLoginCriacao) %>
            <%: Html.ValidationMessageFor(model => model.NomeLoginCriacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DataCriacao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DataCriacao) %>
            <%: Html.ValidationMessageFor(model => model.DataCriacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.StatusAprovacao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.StatusAprovacao) %>
            <%: Html.ValidationMessageFor(model => model.StatusAprovacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.UsuarioAprovacao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.UsuarioAprovacao) %>
            <%: Html.ValidationMessageFor(model => model.UsuarioAprovacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CodigoNoticia, "Noticia") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("CodigoNoticia", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.CodigoNoticia) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DataCriacaoString) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DataCriacaoString) %>
            <%: Html.ValidationMessageFor(model => model.DataCriacaoString) %>
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
