<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Selecao>" %>

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
        <legend>Selecao</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Nome) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Nome) %>
            <%: Html.ValidationMessageFor(model => model.Nome) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Pais) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Pais) %>
            <%: Html.ValidationMessageFor(model => model.Pais) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CaminhoImagem) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CaminhoImagem) %>
            <%: Html.ValidationMessageFor(model => model.CaminhoImagem) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CodigoGrupo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CodigoGrupo) %>
            <%: Html.ValidationMessageFor(model => model.CodigoGrupo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoGrupo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DescricaoGrupo) %>
            <%: Html.ValidationMessageFor(model => model.DescricaoGrupo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.QuantidadeJogos) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.QuantidadeJogos) %>
            <%: Html.ValidationMessageFor(model => model.QuantidadeJogos) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Vitorias) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Vitorias) %>
            <%: Html.ValidationMessageFor(model => model.Vitorias) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Empates) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Empates) %>
            <%: Html.ValidationMessageFor(model => model.Empates) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Derrotas) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Derrotas) %>
            <%: Html.ValidationMessageFor(model => model.Derrotas) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.GolsRealizados) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.GolsRealizados) %>
            <%: Html.ValidationMessageFor(model => model.GolsRealizados) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.GolsSofridos) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.GolsSofridos) %>
            <%: Html.ValidationMessageFor(model => model.GolsSofridos) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CodigoHistoria, "Historia") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("CodigoHistoria", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.CodigoHistoria) %>
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
