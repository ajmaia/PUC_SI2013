<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Noticia>" %>

<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.Titulo) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.Titulo, new { @class = "controle930" }) %>
        <%: Html.ValidationMessageFor(item => item.Titulo) %>
    </div>
</div>
<div class="clear"></div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.DataPublicacao) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.DataPublicacao, new { @class = "controle300" }) %>
        <%: Html.ValidationMessageFor(item => item.DataPublicacao) %>
    </div>
</div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.Categoria) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.Categoria, new { @class = "controle500" }) %>
        <%: Html.ValidationMessageFor(item => item.Categoria) %>
    </div>
</div>
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.Conteudo) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.Conteudo, new { @class = "controle500" }) %>
        <%: Html.ValidationMessageFor(item => item.Conteudo) %>
    </div>
</div>    
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.CaminhoImagem) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.CaminhoImagem, new { @class = "controle500" }) %>
        <%: Html.ValidationMessageFor(item => item.CaminhoImagem) %>
    </div>
</div>                  