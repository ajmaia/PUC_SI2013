<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Jogo>" %>

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
        <legend>Jogo</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CodigoCidade, "Cidade") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("CodigoCidade", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.CodigoCidade) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeCidade) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeCidade) %>
            <%: Html.ValidationMessageFor(model => model.NomeCidade) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.LocalVendaIngresso) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.LocalVendaIngresso) %>
            <%: Html.ValidationMessageFor(model => model.LocalVendaIngresso) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Rodada) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Rodada) %>
            <%: Html.ValidationMessageFor(model => model.Rodada) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CodigoSelecaoA) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CodigoSelecaoA) %>
            <%: Html.ValidationMessageFor(model => model.CodigoSelecaoA) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeSelecaoA) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeSelecaoA) %>
            <%: Html.ValidationMessageFor(model => model.NomeSelecaoA) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.GolsSelecaoA) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.GolsSelecaoA) %>
            <%: Html.ValidationMessageFor(model => model.GolsSelecaoA) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ExpulsoesSelecaoA) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ExpulsoesSelecaoA) %>
            <%: Html.ValidationMessageFor(model => model.ExpulsoesSelecaoA) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CodigoSelecaoB) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CodigoSelecaoB) %>
            <%: Html.ValidationMessageFor(model => model.CodigoSelecaoB) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeSelecaoB) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeSelecaoB) %>
            <%: Html.ValidationMessageFor(model => model.NomeSelecaoB) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.GolsSelecaoB) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.GolsSelecaoB) %>
            <%: Html.ValidationMessageFor(model => model.GolsSelecaoB) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ExpulsoesSelecaoB) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ExpulsoesSelecaoB) %>
            <%: Html.ValidationMessageFor(model => model.ExpulsoesSelecaoB) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DataHora) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DataHora) %>
            <%: Html.ValidationMessageFor(model => model.DataHora) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CaminhoImagem) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CaminhoImagem) %>
            <%: Html.ValidationMessageFor(model => model.CaminhoImagem) %>
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
