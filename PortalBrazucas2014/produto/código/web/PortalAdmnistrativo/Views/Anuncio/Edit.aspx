﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Anuncio>" %>

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
        <legend>Anuncio</legend>

        <%: Html.HiddenFor(model => model.CodigoAnuncio) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Titulo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Titulo) %>
            <%: Html.ValidationMessageFor(model => model.Titulo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CaminhoImagem) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CaminhoImagem) %>
            <%: Html.ValidationMessageFor(model => model.CaminhoImagem) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Conteudo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Conteudo) %>
            <%: Html.ValidationMessageFor(model => model.Conteudo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DataPublicacao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DataPublicacao) %>
            <%: Html.ValidationMessageFor(model => model.DataPublicacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.LoginCriacao, "Usuario") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("LoginCriacao", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.LoginCriacao) %>
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
            <%: Html.LabelFor(model => model.CodigoCategoria, "Categoria") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("CodigoCategoria", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.CodigoCategoria) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoCategoria) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DescricaoCategoria) %>
            <%: Html.ValidationMessageFor(model => model.DescricaoCategoria) %>
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
