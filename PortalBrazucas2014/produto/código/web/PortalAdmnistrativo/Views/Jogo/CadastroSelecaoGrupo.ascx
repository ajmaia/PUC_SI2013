<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<script src="../../Scripts/GrupoSelecionado.js"></script>
<div>
    <asp:Label ID="lblPos1" runat="server" Text="Posição 1: "></asp:Label>
    <%: Html.DropDownList("Pos1", ViewBag.Selecoes as IEnumerable<SelectListItem>,"Selecione aqui")%>
</div>
<div>
    <asp:Label ID="lblPos2" runat="server" Text="Posição 2: "></asp:Label>
    <%: Html.DropDownList("Pos2", ViewBag.Selecoes as IEnumerable<SelectListItem>,"Selecione aqui")%>
</div>
<div>
    <asp:Label ID="lblPos3" runat="server" Text="Posição 3: "></asp:Label>
    <%: Html.DropDownList("Pos3", ViewBag.Selecoes as IEnumerable<SelectListItem>,"Selecione aqui")%>
</div>
<div>
    <asp:Label ID="lblPos4" runat="server" Text="Posição 4: "></asp:Label>
    <%: Html.DropDownList("Pos4", ViewBag.Selecoes as IEnumerable<SelectListItem>,"Selecione aqui")%>
</div>
