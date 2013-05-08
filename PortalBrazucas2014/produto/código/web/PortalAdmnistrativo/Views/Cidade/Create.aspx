<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Cidade>" %>

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
        <legend>Cidade</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Nome) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Nome) %>
            <%: Html.ValidationMessageFor(model => model.Nome) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.UF) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.UF) %>
            <%: Html.ValidationMessageFor(model => model.UF) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CaminhoImagem) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CaminhoImagem) %>
            <%: Html.ValidationMessageFor(model => model.CaminhoImagem) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeEstadio) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeEstadio) %>
            <%: Html.ValidationMessageFor(model => model.NomeEstadio) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CapacidadeEstadio) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CapacidadeEstadio) %>
            <%: Html.ValidationMessageFor(model => model.CapacidadeEstadio) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.InformacoesEstadio) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.InformacoesEstadio) %>
            <%: Html.ValidationMessageFor(model => model.InformacoesEstadio) %>
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
