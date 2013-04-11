<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Noticia>" %>

<div class='painel_titulo'><%: Model.DataPublicacaoString %></div>
<div style="font-size: 22px; color: darkgreen; font-weight: bold;"><%: Model.Titulo %></div>
<div><%: String.Format("Leia mais sobre o que {0} tem a dizer...",Model.Autor) %></div>