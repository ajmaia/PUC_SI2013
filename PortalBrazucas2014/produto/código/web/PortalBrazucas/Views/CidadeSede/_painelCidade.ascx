<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PortalAdmnistrativo.Models.Cidade>" %>

<h1><%: Model.NomeEstadio %></h1>

<h3>
    <%: Model.UF %>
    <br />
    Capacidade: <%: Model.CapacidadeEstadio %>    
</h3>

<div style="background-image: url('<%: Model.CaminhoImagem %>'); background-position: center; background-repeat: no-repeat; background-size: contain; width: 800px; height: 450px;"></div>
<br />
<div><%: Model.InformacoesEstadio %></div>