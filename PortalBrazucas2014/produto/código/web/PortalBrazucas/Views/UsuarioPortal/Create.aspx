<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Usuario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Usuário | <%: PortalBrazucas.Resource.PortalResource.TituloCriarUsuario %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: PortalBrazucas.Resource.PortalResource.TituloCriarUsuario %></h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <div class="painel_campos">
        <div class="conjunto_campo">
            <div class="campos">
                <%: Html.LabelFor(model => model.LoginUsuario) %>
            </div>
            <div class="campos">
                <%: Html.EditorFor(model => model.LoginUsuario) %>
                <%: Html.ValidationMessageFor(model => model.LoginUsuario) %>
            </div>
        </div>
        <div class="conjunto_campo">
            <div class="campos">
                <%: Html.LabelFor(model => model.CpfCnpj) %>
            </div>
            <div class="campos">
                <%: Html.EditorFor(model => model.CpfCnpj) %>
                <%: Html.ValidationMessageFor(model => model.CpfCnpj) %>
            </div>
        </div>
        <div class="conjunto_campo">
            <div class="campos">
                <%: Html.LabelFor(model => model.NomeRazaoSocial) %>
            </div>
            <div class="campos">
                <%: Html.EditorFor(model => model.NomeRazaoSocial) %>
                <%: Html.ValidationMessageFor(model => model.NomeRazaoSocial) %>
            </div>
        </div>
        <div class="conjunto_campo">
            <div class="campos">
                <%: Html.LabelFor(model => model.Email) %>
            </div>
            <div class="campos">
                <%: Html.EditorFor(model => model.Email) %>
                <%: Html.ValidationMessageFor(model => model.Email) %>
            </div>
        </div>
        <div class="conjunto_campo">
            <div class="campos">
                <%: Html.LabelFor(model => model.DataNascimento) %>
            </div>
            <div class="campos">
                <%: Html.EditorFor(model => model.DataNascimento) %>
                <%: Html.ValidationMessageFor(model => model.DataNascimento) %>
            </div>
        </div>
        <div class="conjunto_campo">
            <div class="campos">
                <%: Html.LabelFor(model => model.Sexo) %>
            </div>
            <div class="campos">
                <%: Html.DropDownListFor(model => model.Sexo, new SelectList(ViewBag.ListaSexo, "Value", "Text"), PortalAdmnistrativo.Resouces.Geral.optSelecioneAlgum, new { @class = "controle500" }) %>
                <%: Html.ValidationMessageFor(model => model.Sexo) %>
            </div>
        </div>
        <div class="conjunto_campo">
            <div class="campos">
                <%: Html.LabelFor(model => model.Anunciante) %>
            </div>
            <div class="campos">
                <%: Html.CheckBoxFor(model => model.Anunciante) %>
                <%: Html.ValidationMessageFor(model => model.Anunciante) %>
            </div>
        </div>
    </div>

    <div class="painel_botao">
        <input type="submit" value="<%: PortalBrazucas.Resource.PortalResource.btnSalvar %>" />
    </div>
    <br />
    <br />
<% } %>
</asp:Content>
