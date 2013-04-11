<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PortalAdmnistrativo.Models.Selecao>>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Administrar Tabela de Jogos

    <script type="text/javascript">
        function getSaldoGols() {
            var golsRealizados = parseInt(document.getElementById("golsRealizados").value);
            var golsSofridos = parseInt(document.getElementById("golsSofridos").value);
            var saldoGols = golsRealizados - golsSofridos;
            parseInt(document.getElementById("saldoGols").value) = saldoGols;
        }

        function cancelar() {
            window.location.reload();
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Fase de Grupo</h2>

    <p>
        <%: Html.ActionLink("Fase de Grupo", "FaseGrupo") %>
    </p>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <table style="font-size: 12px;">

        <tr>
            <td>
                <input type="submit" value="Salvar" />
                <input type="button" value="Cancelar" onclick="cancelar()" />
            </td>
            <td></td>
        </tr>

        <!-- Grupo A e B -->
        <tr>
            <td>
                <fieldset>
                    <legend>Grupo A</legend>
                    <% if (Model != null)
                       { %>
                    <% foreach (var item in Model)
                       {
                           if (item.DescricaoGrupo == "A")
                           {%>
                    <table>
                        <tr>
                            <th>País
                            </th>
                            <th>Vitórias
                            </th>
                            <th>Empates
                            </th>
                            <th>Derrotas
                            </th>
                            <th>Gols Realizados
                            </th>
                            <th>Gols Sofridos
                            </th>
                            <th>Saldo de Gols
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais) %>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Vitorias) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Vitorias) %>
                                </div>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Empates) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Empates) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas) %>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Derrotas) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Derrotas) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados) %>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="golsRealizados" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos) %>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="golsSofridos" />
                            </td>
                            <td>
                                <asp:Label ID="saldoGols" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       }
                       }%>
                    </table>
                </fieldset>
            </td>
            <td>
                <fieldset>
                    <legend>Grupo B</legend>
                    <% if (Model != null)
                       { %>
                    <% foreach (var item in Model)
                       {
                           if (item.DescricaoGrupo == "B")
                           {%>
                    <table>
                        <tr>
                            <th>País
                            </th>
                            <th>Vitórias
                            </th>
                            <th>Empates
                            </th>
                            <th>Derrotas
                            </th>
                            <th>Gols Realizados
                            </th>
                            <th>Gols Sofridos
                            </th>
                            <th>Saldo de Gols
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais) %>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Vitorias) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Vitorias) %>
                                </div>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Empates) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Empates) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas) %>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Derrotas) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Derrotas) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados) %>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="Hidden1" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos) %>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="Hidden2" />
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       }
                       }%>
                    </table>
                </fieldset>
            </td>
        </tr>

        <!-- Grupo C e D -->
        <tr>
            <td>
                <fieldset>
                    <legend>Grupo C</legend>
                    <% if (Model != null)
                       { %>
                    <% foreach (var item in Model)
                       {
                           if (item.DescricaoGrupo == "C")
                           {%>
                    <table>
                        <tr>
                            <th>País
                            </th>
                            <th>Vitórias
                            </th>
                            <th>Empates
                            </th>
                            <th>Derrotas
                            </th>
                            <th>Gols Realizados
                            </th>
                            <th>Gols Sofridos
                            </th>
                            <th>Saldo de Gols
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais) %>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Vitorias) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Vitorias) %>
                                </div>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Empates) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Empates) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas) %>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Derrotas) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Derrotas) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados) %>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="Hidden3" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos) %>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="Hidden4" />
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       }
                       }%>
                    </table>
                </fieldset>
            </td>
            <td>
                <fieldset>
                    <legend>Grupo D</legend>
                    <% if (Model != null)
                       { %>
                    <% foreach (var item in Model)
                       {
                           if (item.DescricaoGrupo == "D")
                           {%>
                    <table>
                        <tr>
                            <th>País
                            </th>
                            <th>Vitórias
                            </th>
                            <th>Empates
                            </th>
                            <th>Derrotas
                            </th>
                            <th>Gols Realizados
                            </th>
                            <th>Gols Sofridos
                            </th>
                            <th>Saldo de Gols
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais) %>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Vitorias) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Vitorias) %>
                                </div>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Empates) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Empates) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas) %>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Derrotas) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Derrotas) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados) %>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="Hidden5" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos) %>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="Hidden6" />
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       }
                       }%>
                    </table>
                </fieldset>
            </td>
        </tr>

        <!-- Grupo E e F -->
        <tr>
            <td>
                <fieldset>
                    <legend>Grupo E</legend>
                    <% if (Model != null)
                       { %>
                    <% foreach (var item in Model)
                       {
                           if (item.DescricaoGrupo == "E")
                           {%>
                    <table>
                        <tr>
                            <th>País
                            </th>
                            <th>Vitórias
                            </th>
                            <th>Empates
                            </th>
                            <th>Derrotas
                            </th>
                            <th>Gols Realizados
                            </th>
                            <th>Gols Sofridos
                            </th>
                            <th>Saldo de Gols
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais) %>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Vitorias) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Vitorias) %>
                                </div>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Empates) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Empates) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas) %>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Derrotas) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Derrotas) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados) %>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="Hidden7" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos) %>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="Hidden8" />
                            </td>
                            <td>
                                <asp:Label ID="Label4" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       }
                       }%>
                    </table>
                </fieldset>
            </td>
            <td>
                <fieldset>
                    <legend>Grupo F</legend>
                    <% if (Model != null)
                       { %>
                    <% foreach (var item in Model)
                       {
                           if (item.DescricaoGrupo == "F")
                           {%>
                    <table>
                        <tr>
                            <th>País
                            </th>
                            <th>Vitórias
                            </th>
                            <th>Empates
                            </th>
                            <th>Derrotas
                            </th>
                            <th>Gols Realizados
                            </th>
                            <th>Gols Sofridos
                            </th>
                            <th>Saldo de Gols
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais) %>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Vitorias) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Vitorias) %>
                                </div>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Empates) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Empates) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas) %>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Derrotas) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Derrotas) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados) %>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="Hidden9" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos) %>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="Hidden10" />
                            </td>
                            <td>
                                <asp:Label ID="Label5" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       }
                       }%>
                    </table>
                </fieldset>
            </td>
        </tr>

        <!-- Grupo G e H -->
        <tr>
            <td>
                <fieldset>
                    <legend>Grupo G</legend>
                    <% if (Model != null)
                       { %>
                    <% foreach (var item in Model)
                       {
                           if (item.DescricaoGrupo == "G")
                           {%>
                    <table>
                        <tr>
                            <th>País
                            </th>
                            <th>Vitórias
                            </th>
                            <th>Empates
                            </th>
                            <th>Derrotas
                            </th>
                            <th>Gols Realizados
                            </th>
                            <th>Gols Sofridos
                            </th>
                            <th>Saldo de Gols
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais) %>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Vitorias) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Vitorias) %>
                                </div>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Empates) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Empates) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas) %>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Derrotas) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Derrotas) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados) %>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="Hidden11" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos) %>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="Hidden12" />
                            </td>
                            <td>
                                <asp:Label ID="Label6" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       }
                       }%>
                    </table>
                </fieldset>
            </td>
            <td>
                <fieldset>
                    <legend>Grupo H</legend>
                    <% if (Model != null)
                       { %>
                    <% foreach (var item in Model)
                       {
                           if (item.DescricaoGrupo == "H")
                           {%>
                    <table>
                        <tr>
                            <th>País
                            </th>
                            <th>Vitórias
                            </th>
                            <th>Empates
                            </th>
                            <th>Derrotas
                            </th>
                            <th>Gols Realizados
                            </th>
                            <th>Gols Sofridos
                            </th>
                            <th>Saldo de Gols
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais) %>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Vitorias) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Vitorias) %>
                                </div>
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Empates) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Empates) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas) %>
                                <div class="editor-field">
                                    <%: Html.EditorFor(modelItem => item.Derrotas) %>
                                    <%: Html.ValidationMessageFor(modelItem => item.Derrotas) %>
                                </div>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados) %>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="Hidden13" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos) %>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="Hidden14" />
                            </td>
                            <td>
                                <asp:Label ID="Label7" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       }
                       }%>
                    </table>
                </fieldset>
            </td>
        </tr>

    </table>

    <% } %>
</asp:Content>
