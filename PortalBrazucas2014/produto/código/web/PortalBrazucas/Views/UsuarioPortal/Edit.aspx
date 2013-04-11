<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Usuario>" %>

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
        <legend>Usuario</legend>

        <%: Html.HiddenFor(model => model.LoginUsuario) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CpfCnpj) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CpfCnpj) %>
            <%: Html.ValidationMessageFor(model => model.CpfCnpj) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeRazaoSocial) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeRazaoSocial) %>
            <%: Html.ValidationMessageFor(model => model.NomeRazaoSocial) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Email) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Email) %>
            <%: Html.ValidationMessageFor(model => model.Email) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DataNascimento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DataNascimento) %>
            <%: Html.ValidationMessageFor(model => model.DataNascimento) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Sexo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Sexo) %>
            <%: Html.ValidationMessageFor(model => model.Sexo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.TipoPerfil) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.TipoPerfil) %>
            <%: Html.ValidationMessageFor(model => model.TipoPerfil) %>
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
