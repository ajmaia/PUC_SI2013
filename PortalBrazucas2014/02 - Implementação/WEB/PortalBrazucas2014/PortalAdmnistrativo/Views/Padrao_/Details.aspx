<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Padrao>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>Padrao</legend>

    <div class="display-label">CodigoPadrao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CodigoPadrao) %>
    </div>

    <div class="display-label">Titulo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Titulo) %>
    </div>

    <div class="display-label">DataCadastro</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DataCadastro) %>
    </div>

    <div class="display-label">Status</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Status) %>
    </div>
</fieldset>
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
