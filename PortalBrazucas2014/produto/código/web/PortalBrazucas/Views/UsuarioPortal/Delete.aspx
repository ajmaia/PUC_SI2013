<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Usuario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>Usuario</legend>

    <div class="display-label">CpfCnpj</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CpfCnpj) %>
    </div>

    <div class="display-label">NomeRazaoSocial</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeRazaoSocial) %>
    </div>

    <div class="display-label">Email</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Email) %>
    </div>

    <div class="display-label">DataNascimento</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DataNascimento) %>
    </div>

    <div class="display-label">Sexo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Sexo) %>
    </div>

    <div class="display-label">TipoPerfil</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.TipoPerfil) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
