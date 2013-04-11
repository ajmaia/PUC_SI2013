<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PortalAdmnistrativo.Models.Selecao>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>Selecao</legend>

    <div class="display-label">Nome</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Nome) %>
    </div>

    <div class="display-label">Pais</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Pais) %>
    </div>

    <div class="display-label">CaminhoImagem</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CaminhoImagem) %>
    </div>

    <div class="display-label">CodigoGrupo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CodigoGrupo) %>
    </div>

    <div class="display-label">DescricaoGrupo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DescricaoGrupo) %>
    </div>

    <div class="display-label">QuantidadeJogos</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.QuantidadeJogos) %>
    </div>

    <div class="display-label">Vitorias</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Vitorias) %>
    </div>

    <div class="display-label">Empates</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Empates) %>
    </div>

    <div class="display-label">Derrotas</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Derrotas) %>
    </div>

    <div class="display-label">GolsRealizados</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.GolsRealizados) %>
    </div>

    <div class="display-label">GolsSofridos</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.GolsSofridos) %>
    </div>

    <div class="display-label">Historia</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Historia.HistoriaSelecao) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.CodigoSelecao }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
