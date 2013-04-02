<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PortalAdmnistrativo.Models.Selecao>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Visualizar Tabela de Jogos

    <script type="text/javascript">
        function getSaldoGols() {
            var golsRealizados = parseInt(document.getElementById("golsRealizados").value);
            var golsSofridos = parseInt(document.getElementById("golsSofridos").value);
            var saldoGols = golsRealizados - golsSofridos;
            parseInt(document.getElementById("saldoGols").value) = saldoGols;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Tabela de Jogos</h2>

    <p>
        <%: Html.ActionLink("Fase de Grupo", "Index") %>
    </p>
    <table>
        <tr>
            <td>
                <fieldset>
                    <legend>Grupo A</legend>
                    <table>
                        <tr>
                            <th>Pais
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
                        </tr>

                        <% foreach (var item in Model)
                           {
                               if (item.DescricaoGrupo == "A")
                               {%>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Vitorias)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Empates)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados)%>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="golsRealizados" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos)%>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="golsSofridos" />

                            </td>

                            <td>
                                <asp:Label ID="saldoGols" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       } %>
                    </table>
                </fieldset>
            </td>
            <td>
                <fieldset>
                    <legend>Grupo B</legend>
                    <table>
                        <tr>
                            <th>Pais
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
                        </tr>

                        <% foreach (var item in Model)
                           {
                               if (item.DescricaoGrupo == "A")
                               {%>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Vitorias)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Empates)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados)%>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="Hidden1" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos)%>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="Hidden2" />

                            </td>

                            <td>
                                <asp:Label ID="Label1" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       } %>
                    </table>
                </fieldset>
            </td>
        </tr>

       <tr>
            <td>
                <fieldset>
                    <legend>Grupo C</legend>
                    <table>
                        <tr>
                            <th>Pais
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
                        </tr>

                        <% foreach (var item in Model)
                           {
                               if (item.DescricaoGrupo == "A")
                               {%>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Vitorias)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Empates)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados)%>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="Hidden3" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos)%>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="Hidden4" />

                            </td>

                            <td>
                                <asp:Label ID="Label2" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       } %>
                    </table>
                </fieldset>
            </td>
            <td>
                <fieldset>
                    <legend>Grupo D</legend>
                    <table>
                        <tr>
                            <th>Pais
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
                        </tr>

                        <% foreach (var item in Model)
                           {
                               if (item.DescricaoGrupo == "A")
                               {%>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Vitorias)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Empates)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados)%>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="Hidden5" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos)%>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="Hidden6" />

                            </td>

                            <td>
                                <asp:Label ID="Label3" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       } %>
                    </table>
                </fieldset>
            </td>
           </tr>
       <tr>
            <td>
                <fieldset>
                    <legend>Grupo E</legend>
                    <table>
                        <tr>
                            <th>Pais
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
                        </tr>

                        <% foreach (var item in Model)
                           {
                               if (item.DescricaoGrupo == "A")
                               {%>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Vitorias)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Empates)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados)%>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="Hidden7" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos)%>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="Hidden8" />

                            </td>

                            <td>
                                <asp:Label ID="Label4" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       } %>
                    </table>
                </fieldset>
            </td>
            <td>
                <fieldset>
                    <legend>Grupo F</legend>
                    <table>
                        <tr>
                            <th>Pais
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
                        </tr>

                        <% foreach (var item in Model)
                           {
                               if (item.DescricaoGrupo == "A")
                               {%>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Vitorias)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Empates)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados)%>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="Hidden9" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos)%>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="Hidden10" />

                            </td>

                            <td>
                                <asp:Label ID="Label5" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       } %>
                    </table>
                </fieldset>
            </td>
        </tr>
       <tr>
            <td>
                <fieldset>
                    <legend>Grupo G</legend>
                    <table>
                        <tr>
                            <th>Pais
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
                        </tr>

                        <% foreach (var item in Model)
                           {
                               if (item.DescricaoGrupo == "A")
                               {%>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Vitorias)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Empates)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados)%>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="Hidden11" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos)%>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="Hidden12" />

                            </td>

                            <td>
                                <asp:Label ID="Label6" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       } %>
                    </table>
                </fieldset>
            </td>
            <td>
                <fieldset>
                    <legend>Grupo H</legend>
                    <table>
                        <tr>
                            <th>Pais
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
                        </tr>

                        <% foreach (var item in Model)
                           {
                               if (item.DescricaoGrupo == "A")
                               {%>
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Pais)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Vitorias)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Empates)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.Derrotas)%>
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsRealizados)%>
                                <input type="hidden" value="<%: item.GolsRealizados %>" name="GolsRealizados" id="Hidden13" />
                            </td>
                            <td>
                                <%: Html.DisplayFor(modelItem => item.GolsSofridos)%>
                                <input type="hidden" value="<%: item.GolsSofridos %>" name="GolsSofridos" id="Hidden14" />

                            </td>

                            <td>
                                <asp:Label ID="Label7" runat="server" OnLoad="getSaldoGols()"></asp:Label>
                            </td>
                        </tr>
                        <% }
                       } %>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Content>