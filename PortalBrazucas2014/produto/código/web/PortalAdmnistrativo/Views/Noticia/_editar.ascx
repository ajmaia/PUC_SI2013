<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Noticia>" %>

<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.CodigoNoticia) %>
        -
        <%: Html.LabelFor(model => model.DataPublicacaoString) %>
    </div>
    <div class="campos">
        <%: Html.HiddenFor(model => model.CodigoNoticia) %>
        <%: Html.HiddenFor(model => model.DataPublicacao) %>
        <%: Html.DisplayFor(item => item.CodigoNoticia, new { @class = "controle500" }) %>
        <%: Html.ValidationMessageFor(item => item.CodigoNoticia) %>
    </div>
</div>
<div class="clear"></div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.Titulo) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.Titulo, new { @class = "controle500" }) %>
        <%: Html.ValidationMessageFor(item => item.Titulo) %>
    </div>
</div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.Categoria) %>
    </div>
    <div class="campos">
        <%: Html.DropDownListFor(item => item.CodigoCategoria, new SelectList(ViewBag.ListaCategorias, "Value", "Text"), new { @class = "controle500" }) %>
        <%: Html.ValidationMessageFor(item => item.Categoria) %>
    </div>
</div>
<div class="clear"></div>    
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.CaminhoImagem) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.CaminhoImagem, new { @class = "controle300" }) %>
        <%: Html.ValidationMessageFor(item => item.CaminhoImagem) %>
    </div>
</div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.Autor) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.Autor, new { @class = "controle300" }) %>
        <%: Html.ValidationMessageFor(item => item.Autor) %>
    </div>
</div>
<div class="clear"></div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.Conteudo) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.Conteudo, new { @class = "controle300" }) %>
        <%: Html.ValidationMessageFor(item => item.Conteudo) %>
    </div>
</div>   