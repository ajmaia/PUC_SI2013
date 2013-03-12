<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Padrao>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Create</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Padrao</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CodigoPadrao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CodigoPadrao) %>
            <%: Html.ValidationMessageFor(model => model.CodigoPadrao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Titulo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Titulo) %>
            <%: Html.ValidationMessageFor(model => model.Titulo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DataCadastro) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DataCadastro) %>
            <%: Html.ValidationMessageFor(model => model.DataCadastro) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Status) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Status) %>
            <%: Html.ValidationMessageFor(model => model.Status) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
