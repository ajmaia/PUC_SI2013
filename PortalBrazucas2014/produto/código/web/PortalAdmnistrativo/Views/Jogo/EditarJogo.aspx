<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Jogo>" %>

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
        <legend>Jogo</legend>

        <%: Html.HiddenFor(model => model.CodigoJogo) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CodigoCidade, "Cidade") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("CodigoCidade", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.CodigoCidade) %>
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
            <%: Html.LabelFor(model => model.CodigoSelecaoA, "Selecao A") %>
        </div>
       <div class="editor-field">
            <%: Html.DropDownList("CodigoSelecaoA", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.CodigoSelecaoA) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeSelecaoA, "Seleção A") %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeSelecaoA) %>
            <%: Html.ValidationMessageFor(model => model.NomeSelecaoA) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CodigoSelecaoB, "Selecao1") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("CodigoSelecaoB", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.CodigoSelecaoB) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeSelecaoB, "Seleção B") %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeSelecaoB) %>
            <%: Html.ValidationMessageFor(model => model.NomeSelecaoB) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DataHora,"Data e Hora") %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DataHora) %>
            <%: Html.ValidationMessageFor(model => model.DataHora) %>
        </div>

        <p>
            <input type="submit" value="Salvar" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Voltar", "Index") %>
</div>

</asp:Content>
