<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Noticia>" %>

<!-- TinyMCE -->
<script type="text/javascript" src="../../Content/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
    tinyMCE.init({
        // General options
        mode: "textareas",
        theme: "advanced",
        plugins: "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave,visualblocks",

        // Theme options
        theme_advanced_buttons1: "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
        theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
        theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,advhr,|,print,|,ltr,rtl,|,fullscreen",
        theme_advanced_toolbar_location: "top",
        theme_advanced_toolbar_align: "left",
        theme_advanced_statusbar_location: "bottom",
        theme_advanced_resizing: true,

        // Example content CSS (should be your site CSS)
        content_css: "css/content.css",

        // Drop lists for link/image/media/template dialogs
        template_external_list_url: "lists/template_list.js",
        external_link_list_url: "lists/link_list.js",
        external_image_list_url: "lists/image_list.js",
        media_external_list_url: "lists/media_list.js",

        // Style formats
        style_formats: [
			{ title: 'Bold text', inline: 'b' },
			{ title: 'Red text', inline: 'span', styles: { color: '#ff0000' } },
			{ title: 'Red header', block: 'h1', styles: { color: '#ff0000' } },
			{ title: 'Example 1', inline: 'span', classes: 'example1' },
			{ title: 'Example 2', inline: 'span', classes: 'example2' },
			{ title: 'Table styles' },
			{ title: 'Table row 1', selector: 'tr', classes: 'tablerow1' }
        ],

        // Replace values for the template plugin
        template_replace_values: {
            username: "Some User",
            staffid: "991234"
        }
    });
</script>
<!-- /TinyMCE -->

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
        <%: Html.DropDownListFor(item => item.CodigoCategoria, new SelectList(ViewBag.ListaCategorias, "Value", "Text"), PortalAdmnistrativo.Resouces.Geral.optSelecioneAlgum, new { @class = "controle500" }) %>
        <%: Html.ValidationMessageFor(item => item.Categoria) %>
    </div>
</div>
<div class="clear"></div>    
<div class="conjunto_campo">
    <div class="campos">
        <%: Html.LabelFor(item => item.Imagem) %>
    </div>
    <div class="campos">
        <%: Html.TextBoxFor(item => item.Imagem, new { @class = "controle300", type = "file" }) %>
        <%: Html.ValidationMessageFor(item => item.Imagem) %>
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
        <%: Html.TextAreaFor(item => item.Conteudo, new { @class = "controle300" }) %>
        <%: Html.ValidationMessageFor(item => item.Conteudo) %>
    </div>
</div>