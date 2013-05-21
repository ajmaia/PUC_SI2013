<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div>
    <% if (ViewBag.PrimeiroAnuncio != null)
           Html.RenderPartial("_anuncio", (PortalAdmnistrativo.Models.Anuncio)ViewBag.PrimeiroAnuncio); %>
</div>
<div>
    <% if (ViewBag.SegundoAnuncio != null)
           Html.RenderPartial("_anuncio", (PortalAdmnistrativo.Models.Anuncio)ViewBag.SegundoAnuncio); %>
</div>
    <div id="ultimoJogo"></div>
    <script language="javascript" type="text/javascript">
        $("body").ready(function () {
            $("#ultimoJogo").load("/JogoPortal/ListarUltimoJogo");
        });
            </script>
<%--<div>
    <% if (ViewBag.TerceiroAnuncio != null) 
           Html.RenderPartial("_anuncio", (PortalAdmnistrativo.Models.Anuncio)ViewBag.TerceiroAnuncio); %>
</div>
<div>
    <% if (ViewBag.QuartoAnuncio != null) 
           Html.RenderPartial("_anuncio", (PortalAdmnistrativo.Models.Anuncio)ViewBag.QuartoAnuncio); %>
</div>--%>