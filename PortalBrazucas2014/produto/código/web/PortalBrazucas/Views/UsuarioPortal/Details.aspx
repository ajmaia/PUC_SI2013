<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Usuario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

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
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.LoginUsuario }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
