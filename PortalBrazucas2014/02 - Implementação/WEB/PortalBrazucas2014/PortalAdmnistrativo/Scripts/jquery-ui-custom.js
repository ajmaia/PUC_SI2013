function editRow(image, action) {
    /// <summary>
    /// Função para editar uma linha e retorna os dados.
    /// </summary>
    /// <param name="image">Objeto da está executando a ação.</param>
    /// <param name="action">Ação que será executada para retornar os dados da linha.</param>

    //  Busca a linha em que está a imagem.
    var row = $(image).parents("tr:first");

    //  Executa uma ação para preenche a linha com os dados atuais.
    $.ajax({
        url: action,
        type: "GET",
        success: function (data) {
            row.html(data);
        }
    });
}

function BuscarResource(key) {
    var valor = "";
    jQuery.ajax({ url: "/Home/BuscarResource?resourceKey=" + key, async: false,
        success: function (ajaxResposta) {
            valor = ajaxResposta;
        }
    });
    return valor;
}
function cancelRow(image, action) {
    /// <summary>
    /// Função para cancelar a edição de uma linha e retorna os dados.
    /// </summary>
    /// <param name="image">Objeto da está executando a ação.</param>
    /// <param name="action">Ação que será executada para retornar os dados da linha.</param>

    //  Busca a linha em que está a imagem.
    var row = $(image).parents("tr:first");

    //  Executa uma ação para preenche a linha com os dados atuais.
    $.ajax({
        url: action,
        type: "GET",
        success: function (data) {
            row.html(data);
        }
    });
}

function saveRow(image, action, partialView) {
    /// <summary>
    /// Função para salvar a edição de uma linha.
    /// </summary>
    /// <param name="image">Objeto da está executando a ação.</param>
    /// <param name="action">Ação que será executada para retornar os dados da linha.</param>
    /// <param name="partialView">PartialView de retorno dos dados..</param>

    //  Busca a linha em que está a imagem.
    var row = $(image).parents("tr:first");

    //  Cria uma objeto no formato Json coms os dados para serem enviados.
    var dataJson = "'PartialView': '" + partialView + "'";
    $("input[type='text'],input[type='hidden'],select", row).each(function (index, item) {
        var item = $(item);
        if (item.attr("name")) {
            dataJson += ", '" + item.attr("name") + "': '" + item.val() + "'";
        }
    });
    var data = eval("({" + dataJson + "})");

    //  Envia os dados para serem salvos.
    $.ajax({
        url: action,
        data: data,
        type: "POST",
        success: function (data) {
            //  Verifica se houve algum erro de validação.
            if (data.indexOf("validation-summary-errors") >= 0) {
                
                //  Exbi uma alerta com os erros de validação.
                var validation = $("<div id='validation'></div>")// TODO: Colocar resource
                    .appendTo(document.body)
                    .html(data)
                    .dialog({
                        modal: true,
                        title: "Validações" // TODO: Colocar resource
                    });
                $(".validation-summary-errors", validation).show();
            }
            else {
                //  Atualiza a linha.
                row.html(data);

                //  Exibi uma mensagem de sucesso.
                var success = $("<div id='success'></div>")
                    .appendTo(document.body)
                    .html("<br/>Dados Alterados com Sucesso.") // TODO: Colocar resource
                    .dialog({
                        modal: true,
                        title: "Sucesso" // TODO: Colocar resource
                    });
            }
        }
    });
}

 (function ($) {
    $.fn.addValueFrom = function (list) {
        /// <summary>
        /// Extensão para addicionar valores a um select multiplo
        /// </summary>
        /// <param name="list">Conjuto de objetos.</param>

        var select = $(this);
//        if (select.tagName != "SELECT")
//            select = $("select:first", select);

        //  Para cada item da lista marca como selecionado na lista de opções.
        list.each(function () {

            //  O valor selecionado é definido pelo id do checkbox.
            var dados = $(this).attr("name").toString().split('|');
            var value = dados[0];

            var description;
            if (dados.length > 1)
                description = dados[1];
            else
                description = dados[0];

            //  Busca pelo valor da opção.
            var item = $("option[value='" + value + "']", select);
            if (item.length == 0) {
                $("<option selected></option>")
                    .attr("value", value)
                    .attr("text", description)
                    .appendTo(select);
            }
            else {
                $("option[value='" + value + "']", select).each(function () {
                    this.selected = true;
                });
            }
        });
        select.change();
    }
})(jQuery);

(function ($) {

    $.fn.focalizarPrimeiroCampo = function () {
        /// <summary>
        /// Coloca no foco no primeiro campo encontrado.
        /// </summary>
        $("input:first", this).focus();
    };

    $.fn.atualizar = function () {
        /// <summary>
        /// Coloca no foco no primeiro campo encontrado.
        /// </summary>
        $(this).each(function () {
            if ($(this).Url) {
                $(this).loadWithLoading($(this).Url);
            }
        });
    };

    $.fn.desabilitar = function () {
        /// <summary>
        /// Coloca no foco no primeiro campo encontrado.
        /// </summary>
        $(this).each(function () {
            $(this).disabled = false;
        });
        return this;
    };

    $.fn.habilitar = function () {
        /// <summary>
        /// Coloca no foco no primeiro campo encontrado.
        /// </summary>
        $(this).each(function () {
            $(this).disabled = true;
        });
        return this;
    };

    $.fn.isHabilitado = function () {
        /// <summary>
        /// Coloca no foco no primeiro campo encontrado.
        /// </summary>
        return $(this).attr("disabled") == "true";
    };

    $.fn.expandir = function (item, cssWhenShow, cssWhenHide) {
        /// <summary>
        /// Expandi um item oculto ou oculta.
        /// </summary>
        if (this.is(':visible')) {
            $(item).attr("class", cssWhenHide);
            this.hide();
        }
        else {
            $(item).attr("class", cssWhenShow);
            this.css("display", "block");
            this.show();
        }
    };

    $.fn.altura = function (valorPadrao) {
        /// <summary>
        /// Busca a altura de um objeto, caso não seja vísivel utiliza um valor padrão ou 0.
        /// </summary>
        /// <param name="valorPadrao">valor padrão caso o objeto não seja vísivel.</param>
        /// <returns>Retorna a altura de um objeto.</returns>
        if (this.css("display") == "none") {
            if (isNaN(valorPadrao))
                return 0;
            else
                return valorPadrao;
        }
        else
            return this.height();
    };

    $.fn.carregarItens = function (data, mesclaDescricao, hierarquia) {
        /// <summary>Carrega os itens de uma caixa de seleção.</summary>
        /// <param name="data" type="JSON">Dados no formato JSON.</param>
        /// <param name="mesclaDescricao" type="Boolean">Define se o valor deve ter a descrição em mesclada. Ex.: <option value="12;Descricao">Descricao</option> </param>

        var dados = data;
        var dispararEvento = false;
        return this.each(function () {
            var lista = $(this);

            //  Insere cada item do retorno.
            $.each(dados, function (index, itemData) {

                var valor = itemData.ID;
                if (mesclaDescricao)
                    valor += ";" + itemData.Descricao
                  
                var stringItem = "option[value='" + valor + "']";
                if(hierarquia)
                {
                    stringItem = "option[value='" + valor + "' idPai='" + itemData.IdPai + "']"
                }
                if ($(stringItem, lista).length == 0)
                {
                    var opcao = $('<option>')
                        .data("item", itemData)
                        .appendTo(lista)
                        .val(valor)
                        .text(itemData.Descricao);
                    if(hierarquia)
                    {
                        opcao.attr("idPai", itemData.IdPai);
                    }
                    //  Verifica se o item está marcado.
                    if (itemData.Marcado) {
                        opcao.attr("selected", "selected");
                        dispararEvento = true;
                    }
                }
            });

            if (dispararEvento)
                lista.change();
        });
    };

    jQuery.fn.extend({
        exibirCarregando: function () {
            this.each(function () {
                var itemjQuery = $(this);
                var position = itemjQuery.position;
                var itemOffset = itemjQuery.offset();
                var width = itemjQuery.width() + 18;
                var height = itemjQuery.height();
                if (width < 100)
                    width = 100;
                if (height < 100)
                    height = 100;

                var top = itemjQuery.position().top;
                var parentItem = itemjQuery.parents(".ui-dialog");
                if (parentItem.length > 0)
                    top  = top;
                var left = itemjQuery.position().left;

                if (itemjQuery.isVisible()) {
                    $("#ajaxBusy")
                        .clone()
                        .appendTo(itemjQuery)
                        .addClass("ajaxBusy")
                        .show()
                        .width(width)
                        .height(height)
                        .css("display", "block")
                        .css("position", "absolute")
                        .css("top", top)
                        .css("left", left);
                }
            });
            return this;
        },
        ocultarCarregando: function () {
            $("#ajaxBusy", this).hide();
        },
        loadWithLoading: function (url, params, callback, changeUrl) {
            return this.each(function () {
                window.status = url;
                var itemjQuery = $(this);
                var itemOffset = itemjQuery.offset();
                $(this).exibirCarregando();
                itemjQuery.load(url, params, function (data) {
                    var urlData = url.split(' ');
                    if (data.indexOf("<!--conteudo-->") > 0 && urlData.length > 1 && data.indexOf("=\"" + urlData[1].substring(1) + "\"") > 0) {
                        data = data.substring(data.indexOf("=\"" + urlData[1].substring(1) + "\"") - 8);
                        data = data.substring(0, data.indexOf("<!--conteudo-->"));
                    }
                    var script = "";
                    while (data.indexOf("<script") > 0) {
                        script += data.substring(data.indexOf("<script"), data.indexOf("</script>") + 9);
                        data = data.substring(data.indexOf("</script>") + 10);
                    }
                    if ($(this).html() == "")
                    {
                        $(this).html(data);
                    }
                    else
                    {
                        $(this).html($(this).html() + script);
                    }
                   
                    if (callback)
                        itemjQuery.each(callback);
                    itemjQuery.ocultarCarregando();

                    if (changeUrl && history.pushState) {
                        var x = url.indexOf(" #");
                        if (x > 0)
                            url = url.substring(0, x)
                        history.pushState({ foo: "bar" }, "", url)
                    }
                });
            });
        },
        isVisible: function () {
            return this.each(function () {
                return true; // $(this).css("display") != "hidden";
            });
        }
    });

    $.fn.preencherListaAjax = function (metodoJson, valores, executeOnChange, mesclaDescricao, emptyItem, emptyItemDescription, hierarquia) {
        /// <summary>Preenche uma caixa de seleção com um conjunto de dados via AJAX.</summary>
        /// <param name="metodoJson" type="String">Url do método que retorna os dados.</param>
        /// <param name="valores" type="String">valores padrão.</param>
        /// <param name="mesclaDescricao" type="Boolean">Define se o valor deve ter a descrição em mesclada. Ex.: <option value="12;Descricao">Descricao</option> </param>
        return this.each(function () {
            var listaItens = $(this);

            //  Limpar a caixa de seleção.
            listaItens.html("");
            //listaItens.desabilitar();

            //  Exibe a mensagem de "carregando".
            var carregando = $("<option value=''>Carregando</option>")
                .appendTo(listaItens);

            //  Busca os dados em background.
            $.ajax({
                url: metodoJson,
                dataType: 'json',
                cache:false,
                success: function (data) {

                    //  Carrega todos os dados.
                    listaItens.carregarItens(data, mesclaDescricao, hierarquia);

                    //  Remove o item "carregando".
                    if (emptyItem)
                    {   
                        if(emptyItemDescription == null)
                            carregando.text("");
                        else
                            carregando.text(emptyItemDescription);
                    }
                    else
                        carregando.remove();

                    //listaItens.habilitar();
                    if (valores) {
                        var marcados = valores.split(',');
                        for (x = 0; x < marcados.length; x++) {
                            var valor;
                            if (mesclaDescricao)
                                valor = marcados[x];
                            else
                                valor = marcados[x].split(';')[0];
                            if (valor.indexOf("\\") > 0) {
                                $("option", listaItens).each(function (index, item) {
                                    if (item.value == valor) {
                                        $(item).attr("selected", "selected")
                                    }
                                });
                            }
                            else {
                                $("option[value='" + valor.replace("\\", "\\\\") + "']", listaItens).each(function () {
                                    this.selected = true;
                                });
                            }
                        }
                    }

                    $(listaItens).combobox();

                    //  Executa o evento de mudança.
                    if (executeOnChange)
                        listaItens.change();
                }
            });
        });
    };

    $.fn.scrollHorizontal = function () {
        date = new Date();
        if (!$(this).data("scrollHorizontal"))
        {
            $(this).data("scrollHorizontal", true);

            var id = $(this).attr("id");
            var parent = $("#" + id)
            var container = $(parent.children()[0]);
            var left = $("<div id='" + id + "_left'></div>")
                    .addClass("move")
                    .css("position", "relative")
                    .insertAfter(parent)
                    .hide()
                    .css("top", -parent.height())
                    .height(parent.height())
                    .mouseover(function () {
                        clearInterval(moviment);
                        moviment = setInterval("scrollLeft -= " + speed + "; $('#" + id + "').scrollLeft(scrollLeft); if (scrollLeft <= 0) { clearInterval(moviment); $('#" + id + "_left').hide(); };", interval);
                        right.show();
                    })
                    .mouseout(function () {
                        clearInterval(moviment);
                    }).click(function () {
                        scrollLeft -= $(container.children()[0]).outerWidth();
                    });

            var right = $("<div id='" + id + "_right'></div>")
                    .addClass("move")
                    .css("position", "relative")
                    .css("float", "right")
                    .css("top", -parent.height())
                    .height(parent.height())
                    .insertAfter(parent)
                    .mouseover(function () {
                        clearInterval(moviment);
                        moviment = setInterval("scrollLeft += " + speed + "; $('#" + id + "').scrollLeft(scrollLeft); if (scrollLeft >= " + total + " - $('#" + id + "').width()) { clearInterval(moviment); $('#" + id + "_right').hide(); };", 1);
                        left.show();
                    })
                    .mouseout(function () {
                        clearInterval(moviment);
                    })
                    .click(function () {
                        scrollLeft += $(container.children()[0]).outerWidth();
                    });

            var total = 0;
            $("div", container).each(function () {
                total += $(this).width() + 10;
            });
            total += 23;
            container.width(total);
        }
    }
    
    var timeout;
/*
    $.fn.autoCompleteMultiple2 = function () {
        var listBox = $(this);

        var container = listBox.parent();

        var idListBox = container.attr("id");
        var idListBoxItens = idListBox + "_itens";
        var idListBoxTerm = idListBox + "_term";

        $("<option selected>Testes 1 " + container.attr("id") + "</option>").appendTo(listBox);
        $("<option selected>Testes 2</option>").appendTo(listBox);
        $("<option>Testes 3</option>").appendTo(listBox);

        //  Oculta o caixa de seleção atual.
        listBox.hide();

        //  Cria o campo de texto aberto.
        var textBoxTerm = $("<input id='" + idListBoxTerm + "' />")
            .appendTo(container)
            .data("listBox", this);

        //  Cria o botão de pop-up.
        $("<button />")
            .addClass("icone")
            .appendTo(container)
            .html("<img alt='Abrir pop-up para pesquisa com vários filtros' src='/Content/themes/base/images/16/icone_visualizar.gif'/>");

        //  Cria o botão de seleção.
        var buttonSelection = $("<button />")
            .addClass("icone")
            .appendTo(container)
            .click(function () {
                window.status  = $("#" + idListBoxItens).length;
                if ($("#" + idListBoxItens).length == 0)
                    textBoxTerm.focus();
                else
                    textBoxTerm.focusout();
            })
            .html("<img alt='Visualizar lista de itens selecionados' src='/Content/themes/base/images/16/icone_down.gif'/>");

        textBoxTerm
            .focus( function () {
                //if ($(".ui-autocomplete:visible").length == 0) {
                //    clearTimeout(timeout);
                    this.listBox = $(this).data("listBox");
                        var itens = $("option", this.listBox);
                        if (itens.length > 0) {
                            
                            //  Cria a lista de itens para exibição.
                            var ul = $('<ul id="' + idListBoxItens + '" class="ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all" style="z-index: 1; display: block;"></ul>')
                                .css("top", $(this).offset().top + $(this).height() + 4)
                                .css("left", $(this).offset().left)
                                .width($(this).width() + 2)
                                .appendTo(document.body);
                            
                            //  Preenche cada item.
                            itens.each(function (index, item) {
                                createItemAutoComplete(ul, { ID: item, Descricao: this.text}, this.listBox);
                            });
                        }
                        $(this).val("");
                    }
                //}
            })
            .focusout( function () {
                timeout = setTimeout("showTotalItens('" + idListBoxItens + "', '" + idListBox + "','" + idListBoxTerm + "');", 200)
            })
            .keypress( function (event) {
                window.status = event.which;
            })
            .autocomplete({
                source: function (request, response) {
                    $.getJSON("/Fornecedor/ListarJson?fornecedor=" + request.term, response);
                },
                search: function () {
                    // custom minLength
                    var term = this.value;
                    if (term.length < 3) {
                        return false;
                    }
                    else {
                        $("#" + idListBoxItens).remove();
                        return true;
                    }
                },
                select: function (event, ui) {
                    var itemSelecao;
                    if (event.srcElement.tagName == "IMG")
                        itemSelecao = $(event.srcElement);
                    else
                        itemSelecao = $("img", $(event.srcElement));
                    var item = $("option:selected[value='" + ui.item.ID + "']", $("#" + idListBox));
                    var checked;
                    if (item.length > 0) {
                        item.remove();
                        checked = "icone_ok_des.gif";
                    }
                    else {
                        $("<option></option>")
                            .val(ui.item.ID)
                            .html(ui.item.Descricao)
                            .attr("selected", "selected")
                            .appendTo($("#" + idListBox + " select"));
                        checked = "icone_ok.gif";
                    }
                    itemSelecao.attr("src", "/jit/Content/themes/base/images/16/" + checked);

                    //$("#" + idListBoxTerm).focus();
                    return false;
                }
            }).data("autocomplete")._renderItem = function (ul, item) {
                createItemAutoComplete(ul, item, $("#" + idListBox));
            };
            
            textBoxTerm.focusout()
    };
    */
})(jQuery);
/*
function createItemAutoComplete(ul, item, lixBox)
{
    var checked = "icone_ok_des.gif";
    if ($("option:selected[value='" + item.ID + "']", listBox).length > 0)
        checked = "icone_ok.gif";
    else
        if ($("option[text='" + item.ID + "']", listBox).length > 0)
            checked = "icone_ok.gif";
    return $("<li></li>")
	    .data("item.autocomplete", item)
	    .appendTo(ul)
	    .append("<a><img src='/Content/themes/base/images/16/" + checked + "' align='top'/> " + item.Descricao + "</a>");
}

function showTotalItens(idListBoxItens, idListBox, idListBoxTerm)
{
    $("#" + idListBoxItens).remove();
    var itens = $("#" + idListBox + " option:selected").length;
    var textBox =  $("#" + idListBoxTerm);
    switch (itens)
    {
        case 0:
            textBox.val("");
            break;
        case 1:
            textBox.val("1 item selecionado");
            break;
        default:
            textBox.val(itens + " itens selecionados");
            break;
    }
}
*/
var scrollLeft = 0;
var moviment;
var interval = 1;
var speed = 1;
var date;


(function ($) {
    $.widget("ui.combobox", {
        _create: function () {
            if ($(this.element).css("display") != "none")
            {
                var self = this,
					    select = this.element.hide(),
					    selected = select.children(":selected"),
					    value = selected.length > 0 ? selected.text() : "";
                var input = this.input = $("<input>")
                    .attr("id", select.attr("id") + "_input")
					.insertAfter(select)
					.val(value)
					.autocomplete({
					    delay: 0,
					    minLength: 0,
					    source: function (request, response) {
					        var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
					        response(select.children("option").map(function () {
					            var text = $(this).text();
					            if ((!request.term || matcher.test(text)))
					                return {
					                    label: text.replace(
											new RegExp(
												"(?![^&;]+;)(?!<[^<>]*)(" +
												$.ui.autocomplete.escapeRegex(request.term) +
												")(?![^<>]*>)(?![^&;]+;)", "gi"
											), "<b>$1</b>"),
					                    value: text,
					                    option: this
					                };
					        }));
					    },
					    select: function (event, ui) {
					        ui.item.option.selected = true;
					        self._trigger("selected", event, {
					            item: ui.item.option
					        });
					        select.change();
					    },
					    change: function (event, ui) {
					        if (!ui.item) {
					            var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex($(this).val()) + "$", "i"),
								valid = false;
					            select.children("option").each(function () {
					                if ($(this).text().match(matcher)) {
					                    this.selected = valid = true;

					                    return false;
					                }
					            });
					            if (!valid) {
					                // remove invalid value, as it didn't match anything
					                if ($('option[value=""]', select).val()) {
					                    $(this).val("");
					                    select.val("");
					                }
					                else {
					                    var value = $('option:selected', select);
					                    $(this).val(value.text());
					                    if (select.isHabilitado())
					                        $(this).habilitar();
					                    else
					                        $(this).desabilitar();
					                }
					                input.data("autocomplete").term = "";
					                return false;
					            }
					        }
					    }
					})
					.addClass("ui-widget ui-widget-content ui-corner-left");
            select.change(function () {
                input.val($("option:selected", this).text());
            });
            input.data("autocomplete")._renderItem = function (ul, item) {
                return $("<li></li>")
						.data("item.autocomplete", item)
						.append("<a>" + item.label + "</a>")
						.appendTo(ul);
            };

            this.button = $("<button type='button'>&nbsp;</button>")
					.attr("tabIndex", -1)
					.attr("title", BuscarResource("ShowAll"))
					.insertAfter(input)
					.button({
					    icons: {
					        primary: "ui-icon-triangle-1-s"
					    },
					    text: false
					})
					.removeClass("ui-corner-all")
					.addClass("ui-corner-right ui-button-icon")
					.click(function () {
					    // close if already visible
					    if (input.autocomplete("widget").is(":visible")) {
					        input.autocomplete("close");
					        return;
					    }

					    // work around a bug (likely same cause as #5265)
					    $(this).blur();

					    // pass empty string as value to search for, displaying all results
					    input.autocomplete("search", "");
					    input.focus();
					});
            }
        },
        destroy: function () {
            if (this.input) {
                this.input.remove();
                this.button.remove();
            }
            this.element.show();
            $.Widget.prototype.destroy.call(this);
        }
    });
})(jQuery);

(function ($) {
    $.widget("ui.multiplaSelecao", {
        _create: function () {
            if ($(this.element).css("display") != "none")
            {
                var self = this,
					    select = this.element.hide(),
					    selected = select.children(":selected"),
					    value = selected.val() ? selected.text() : "";
                var input = this.input = $("<input>")
                        .attr("id", select.attr("id") + "_input")
					    .insertAfter(select)
					    .val(value)
					    .autocomplete({
					        delay: 0,
					        minLength: 0,
					        source: function (request, response) {
					            var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
					            response(select.children("option").map(function () {
					                var text = $(this).text();
                                    
					                if (this.value && (!request.term || matcher.test(text)))
					                    return {
					                        label: text.replace(
											    new RegExp(
												    "(?![^&;]+;)(?!<[^<>]*)(" +
												    $.ui.autocomplete.escapeRegex(request.term) +
												    ")(?![^<>]*>)(?![^&;]+;)", "gi"
											    ), "<b>$1</b>"),
					                        value: text,
					                        option: this
					                    };
					            }));
					        },
                            select: function (event, ui) {
                                //  Verifica se existe a opção de selecionar todos os itens.
                                var itenSelectAll = $("option[value='0']", select)
                                if (itenSelectAll.length == 0)
                                    itenSelectAll = $("option[value='']", select)

                                var itemSelecao;
                                if (event.srcElement.tagName == "IMG")
                                    itemSelecao = $(event.srcElement);
                                else
                                    itemSelecao = $("img", $(event.srcElement));
                                var item = $(ui.item.option);
                                var idPai = item.attr("idPai");
                                var checked;
                                if (item.attr("selected") == "true" || item.attr("selected") == "selected") {
                                    item.removeAttr("selected");
                                    checked = "icone_ok_des.gif";
                                    
                                    // Parte que faz a hierarquia
                                    if(idPai)
                                    {
                                        $("option[value='" + idPai + "']", select).removeAttr("selected");
                                        $("IMG[id='checkbox_" + idPai + "']").attr("src", "/Content/themes/base/images/16/" + checked);
                                        
                                        if(idPai == item.val()) //Se o item é um pai
                                        {
                                           $("option[idPai='" + idPai + "']", select).each(function () {
                                                $(this).removeAttr("selected");
                                                $("IMG[id='checkbox_" + $(this).val() + "']").attr("src", "/Content/themes/base/images/16/" + checked);
                                            });
                                        }
                                    }       

                                }
                                else {
                                    item.attr("selected", "true");
                                    checked = "icone_ok.gif";

                                    //  Se existe a opção selecionar todos, então deve desmarcá-la, quando um item for marcado
                                    //  ou desmarcar todos os itens quando ela for selecionada.
                                    if (itenSelectAll.length > 0)
                                    {
                                        var valueSelectAll = itenSelectAll.val();
                                        if (ui.item.option.value == valueSelectAll)
                                        {
                                            $("option[value!='" + valueSelectAll + "']", select).removeAttr("selected");
                                            $(".ui-autocomplete img").attr("src", "/Content/themes/base/images/16/icone_ok_des.gif");
                                        }
                                        else
                                        {
                                            $("option[value='" + valueSelectAll + "']", select).removeAttr("selected");
                                            $(".ui-autocomplete img:first").attr("src", "/Content/themes/base/images/16/icone_ok_des.gif");
                                        }
                                    }
                                    // Parte que faz a hierarquia
                                    if(idPai)
                                    {
                                        if(idPai == item.val()) //Se o item é um pai
                                        {
                                            $("option[idPai='" + idPai + "']", select).each(function () {
                                                $(this).attr("selected", "true");
                                                $("IMG[id='checkbox_" + $(this).val() + "']").attr("src", "/Content/themes/base/images/16/" + checked);
                                            });
                                        }
                                    }
                                }
                                
                                itemSelecao.attr("src", "/Content/themes/base/images/16/" + checked);
                                input.focus();
                                select.change();
                                return true;
                            },
                            change: function (event, ui) {
					            if (!ui.item) {
					                var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex($(this).val()) + "$", "i"),
								    valid = false;
					                select.children("option").each(function () {
					                    if ($(this).text().match(matcher)) {
					                        this.selected = valid = true;

					                        return false;
					                    }
					                });
					                if (!valid) {
					                    // remove invalid value, as it didn't match anything
					                    if ($('option[value=""]', select).val()) {
					                        $(this).val("");
					                        select.val("");
					                    }
					                    input.data("autocomplete").term = "";
					                    return false;
					                }
					            }
					        }
					    })
					    .addClass("ui-widget ui-widget-content ui-corner-left");
                input.data("autocomplete").close = function (event) {
                    clearTimeout(this.closing);
                    if (event) {
                        var srcElement = event.srcElement ? event.srcElement : event.target;
                        if (srcElement && srcElement.tagName != "A" && srcElement.tagName != "UL" && srcElement.tagName != "IMG") {
                            if (this.menu.element.is(":visible")) {
                                this.menu.element.hide();
                                this.menu.deactivate();
                                this._trigger("close", event);
                            }
                        }
                    }
                };

                input.focus(function () {
                    $(this).val("");
                });
                input.blur(function () {
                    select.change();
                });
                select.data("input", input);

                /// <element>SELECT</element>
                /// <event>OnChange</event>
                select.change(function () {
                    /// <summary>
                    /// Função para tratar as mudanças de seleção da lista de opções.
                    /// </summary>

                    var self = $(this);
                    var input = self.data("input");
                    //alert($(this).val());
                    
                    var itensSelected = $('option:selected', self);
                    var toolTip = "";
                    
                    var subtracao = 0;

                    //  Monta uma lista para dica de campo.
                    itensSelected.each(function () {
                        toolTip += jQuery.trim(this.text) + "\n";
                        if(this.text == ""){
                            subtracao = subtracao + 1;
                        }
                    });
                    input.attr("title", toolTip);
                         
                    //  Preenche o texto do campo de auto-complete.
                    switch ((itensSelected.length - subtracao))
                    {
                        case 0:
                            input.val("");
                            break;
                        case 1:
                            input.val(toolTip);
                            break;
                        default://TODO: implementar resources via json para colocar cache.
                       
                            input.val((itensSelected.length - subtracao) +   " " + BuscarResource("selecionados" ) + ".");
                            break;
                    }
                });

                input.data("autocomplete")._renderItem = function (ul, item) {
                    var checked = "icone_ok_des.gif";
                    if ($("option:selected[value='" + item.option.value + "']", select).length > 0)
                        checked = "icone_ok.gif";
                    else
                        if ($("option:selected[text='" + item.option.value + "']", select).length > 0)
                            checked = "icone_ok.gif";
                    var valor = input.val().toUpperCase();
                    var valorMarcado = "<b>" + valor + "</b>"
                    var idPai = ($("option[value='" + item.option.value + "']", select).attr("idPai"));
                    var style = "";
                    if(idPai)
                    {
                        if(idPai == item.option.value)
                        {
                            style = "style='font-weight: bold;'";
                        }
                        else
                        {
                           style = "style='padding-left: 25px;'";
                        }
                    }
                    return $("<li></li>")
	                    .data("item.autocomplete", item)
	                    .appendTo(ul)
	                    .append("<a " + style +"><img id='checkbox_" + item.option.value + "' src='/Content/themes/base/images/16/" + checked + "' align='top'/> " + item.label.toString().toUpperCase().replace(valor, valorMarcado) + "</a>");
                };


                this.button = $("<button type='button'>&nbsp;</button>")
					    .attr("tabIndex", -1)
					    .attr("title", BuscarResource("ShowAll"))
					    .insertAfter(input)
					    .button({
					        icons: {
					            primary: "ui-icon-triangle-1-s"
					        },
					        text: false
					    })
					    .removeClass("ui-corner-all")
					    .addClass("ui-corner-right ui-button-icon")
					    .click(function () {
					        // close if already visible
					        if (input.autocomplete("widget").is(":visible")) {
					            input.autocomplete("close");
					            return;
					        }

					        // work around a bug (likely same cause as #5265)
					        $(this).blur();

					        // pass empty string as value to search for, displaying all results
					        input.autocomplete("search", "");
					        input.focus();
					    });
            }
        },
        destroy: function () {
            if (this.input)
                this.input.remove();
            if (this.button)
                this.button.remove();
            this.element.show();
            $.Widget.prototype.destroy.call(this);
        }
    });
})(jQuery);

(function ($) {
    $.widget("ui.combobox2", {
        _create: function () {
            var self = this,
					select = this.element.attr("multiple", "multiple").hide(),
					selected = select.children(":selected"),
					value = selected.val() ? selected.text() : "";
            var input = this.input = $("<input>")
                    .attr("id", select.attr("id") + "_input")
					.insertAfter(select)
					.val(value)
					.autocomplete({
					    delay: 0,
					    minLength: 0,
					    source: function (request, response) {
					        var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
					        response(select.children("option").map(function () {
					            var text = $(this).text();
					            if (this.value && (!request.term || matcher.test(text)))
					                return {
					                    label: text.replace(
											new RegExp(
												"(?![^&;]+;)(?!<[^<>]*)(" +
												$.ui.autocomplete.escapeRegex(request.term) +
												")(?![^<>]*>)(?![^&;]+;)", "gi"
											), "<b>$1</b>"),
					                    value: text,
					                    option: this
					                };
					        }));
					    },
					    select: function (event, ui) {
					        ui.item.option.selected = true;
					        self._trigger("selected", event, {
					            item: ui.item.option
					        });
					        select.change();
					    },
					    change: function (event, ui) {
					        if (!ui.item) {
					            var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex($(this).val()) + "$", "i"),
								valid = false;
					            select.children("option").each(function () {
					                if ($(this).text().match(matcher)) {
					                    this.selected = valid = true;

					                    return false;
					                }
					            });
					            if (!valid) {
					                // remove invalid value, as it didn't match anything
					                if ($('option[value=""]', select).val()) {
					                    $(this).val("");
					                    select.val("");
					                }
					                else {
					                    var value = $('option:selected', select);
					                    $(this).val(value.text());
					                }
					                input.data("autocomplete").term = "";
					                return false;
					            }
					        }
					    }
					})
					.addClass("ui-widget ui-widget-content ui-corner-left");
            input.data("autocomplete")._renderItem = function (ul, item) {
                var option = $("<li></li>")
				    .data("item.autocomplete", item)
				    .appendTo(ul)
				    .append("<a><input type='checkbox' value='" + item.value + "'>" + item.label + "</a>");
                return option;
            };

            this.button = $("<button type='button'>&nbsp;</button>")
					.attr("tabIndex", -1)
					.attr("title", BuscarResource("ShowAll"))
					.insertAfter(input)
					.button({
					    icons: {
					        primary: "ui-icon-triangle-1-s"
					    },
					    text: false
					})
					.removeClass("ui-corner-all")
					.addClass("ui-corner-right ui-button-icon")
					.click(function () {
					    // close if already visible
					    if (input.autocomplete("widget").is(":visible")) {
					        input.autocomplete("close");
					        return;
					    }

					    // work around a bug (likely same cause as #5265)
					    $(this).blur();

					    // pass empty string as value to search for, displaying all results
					    input.autocomplete("search", "");
					    input.focus();
					});
            this.box = $("<div style='float: left; border: 1px solid #666666; overflow: hidden; padding-bottom: 1px; padding-right: 1px;'></div>")
                    .attr("id", select.attr("id") + "_box")
                    .height(input.outerHeight())
                    .width(input.outerWidth())
					.insertBefore(this.input)
                    .css("position", "relative")
                    .click(function () {
                        $(this).hide();
                        input
                            .show()
                            .val("")
                            .focus();
                    })
                    .ready(function () {
                        select.change();
                    })
                    .mouseover(function () {
                        clearTimeout(intervalCombobox2);
                        $("input", $(this)).each(function () {
                            $(this).show();
                        });
                        $(this).height(this.scrollHeight + 2);
                    })
                    .mouseout(function () {
                        $("input", $(this)).each(function () {
                            var intervalCombobox2 = setTimeout($(this).hide(), 1000);
                        });
                        $(this).height(input.height() + 2);
                    });

            //  TODO: Revisa por questões de performance
            $(select).change(function () {
                var box = $("#" + select.attr("id") + "_box").html("");
                select.children("option:selected").each(function () {
                    var selected = $("<div style='border:  1px dotted silver; margin-left: 1px; margin-top: 1px; float: left; white-space: nowrap;'></div>")
                        .appendTo(box);
                    $("<input type='checkbox' checked='true' />")
                        .hide()
                        .val(this.value)
                        .appendTo(selected)
                        .click(function () {
                            if (!this.checked) {
                                select.children("option[value=" + this.value + "]").each(function () {
                                    this.selected = false;
                                });
                                $(this).parent().remove();
                            }
                        })
                    $("<label />")
                        .html(this.text)
                        .appendTo(selected);
                });
            });

            input.hide();
            input.blur(function () {
                var box = $("#" + select.attr("id") + "_box");
                input.hide();
                $(box).show();
            });
        },
        destroy: function () {
            this.input.remove();
            this.button.remove();
            this.element.show();
            $.Widget.prototype.destroy.call(this);
        }
    });

})(jQuery);
var intervalCombobox2 = false;



(function ($) {
    $.widget("ui.autoCompleteMultiple", {
        _popUpUrl: "",
        _popUpTitle: "",
        _create: function () {
            var self = this,
					select = this.element.hide(),
					selected = select.children(":selected"),
					value = selected.length > 0 ? selected.text() : "";

            var input = this.input = $("<input>")
                    .attr("id", select.attr("id") + "_input")
					.insertAfter(select)
					.autocomplete({
					    delay: 0,
					    minLength: 0,
					    source: function (request, response) {
					        var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
					        response(select.children("option").map(function () {
					            var text = $(this).text();
					            if ((!request.term || matcher.test(text)))
					                return {
					                    label: text.replace(
											new RegExp(
												"(?![^&;]+;)(?!<[^<>]*)(" +
												$.ui.autocomplete.escapeRegex(request.term) +
												")(?![^<>]*>)(?![^&;]+;)", "gi"
											), "<b>$1</b>"),
					                    value: text,
					                    option: this
					                };
					        }));
					    },
					    select: function (event, ui) {
					        ui.item.option.selected = true;
					        self._trigger("selected", event, {
					            item: ui.item.option
					        });
					        select.change();
					    },
					    change: function (event, ui) {
					        if (!ui.item) {
					            var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex($(this).val()) + "$", "i"),
								valid = false;
					            select.children("option").each(function () {
					                if ($(this).text().match(matcher)) {
					                    this.selected = valid = true;

					                    return false;
					                }
					            });
					            if (!valid) {
					                // remove invalid value, as it didn't match anything
					                if ($('option[value=""]', select).val()) {
					                }
					                else {
					                    var value = $('option:selected', select);
					                    //$(this).val(value.text());
					                    if (select.isHabilitado())
					                        $(this).habilitar();
					                    else
					                        $(this).desabilitar();
					                }
					                input.data("autocomplete").term = "";
					                return false;
					            }
					        }
					    }
					})
					.addClass("ui-widget ui-widget-content ui-corner-left");

            //  Cria o botão de seleção.
            this.button = $("<button />")
                .addClass("icone")
				.insertAfter(input)
				.click(function () {
					// close if already visible
					if (input.autocomplete("widget").is(":visible")) {
					    input.autocomplete("close");
					    return;
					}

					// work around a bug (likely same cause as #5265)
					$(this).blur();

					// pass empty string as value to search for, displaying all results
					input.autocomplete("search", "");
					input.focus();
				})
                .html("<img alt='Visualizar lista de itens selecionados' src='/Content/themes/base/images/16/icone_down.gif'/>");

            this.input
                .focus( function () {
                    input.val("");
				    input.autocomplete("search", "");
                })
                .focusout( function () {
                    var itens = $("option:selected", select);
				    switch(itens.length) {
                        case 0:
                            $(this).val("");
                            break;
                        case 1:
                            $(this).val(itens.html());
                            break;
                        default:
                            $(this).val(itens.length + " " + BuscarResource("itensSelecionados"));
                            break;
                    }
                })
                .focusout();

            this._popUpUrl = popUpUrl;
            popUpUrl = ""
            if (this._popUpUrl && this.popUpUrl != "")
            {
                //  Cria o botão de pop-up.
                $("<button />")
                    .addClass("icone")
                    .data("url", this._popUpUrl)
                    .data("title", popUpTitle)
				    .insertAfter(input)
                    .html("<img alt='Abrir o pop-up para pesquisa com opções de filtros' src='/Content/themes/base/images/16/icone_visualizar.gif'/>")
                    .click( function () {

                        jQuery.support.cors = true; // force cross-site scripting (as of jQuery 1.5)
                        $(document.body)
                            .css("overflow", "hidden")
                            .exibirCarregando();

                        var popup = $('<div></div>')
                            .appendTo(document.body)
                            .dialog({
                                close: function () {
                                    $(this).remove();
                                    $(document.body).css("overflow", "auto");
                                },
                                modal: true,
                                width: 800,
                                height: 620,
                                title: $(this).data("title")
                            });

                        valorCampoFornecedores = select.parent().attr("id");
                        var urlPopUp = this._popUpUrl;
                        $.ajax({
                            url: $(this).data("url"),
                            crossDomain: true,
                            success: function (data) {
                                popup.html(data);
                                $(document.body).ocultarCarregando();
                            },
                            cache: false
                        });
                    });
            }

            select.change(function () {
                input.focusout();
                return false;
            });
            
            input
                .keypress( function (event) {
                    if (event.which == 32) {
                        if ($(this).data("autocomplete").menu.active)
                        {
                            itemSelected = $($(this).data("autocomplete").menu.active);
                            itemData = itemSelected.data("item.autocomplete");
                            itemData.option.selected = !itemData.option.selected;
                            if (itemData.option.selected)
                                $("img", itemSelected).attr("src", "/Content/themes/base/images/16/icone_ok.gif");
                            else
                                $("img", itemSelected).attr("src", "/Content/themes/base/images/16/icone_ok_des.gif");

                            return false;
                        }
                    }

                })
                .data("autocomplete")._renderItem = function (ul, item) {
                    var imageUrl;
                    if (item.option.selected)
                        imageUrl = "/Content/themes/base/images/16/icone_ok.gif"
                    else
                        imageUrl = "/Content/themes/base/images/16/icone_ok_des.gif"
                    return $("<li></li>")
					    .data("item.autocomplete", item)
					    .append("<a><img align='top' src='" + imageUrl + "'> " + item.label + "</a>")
					    .appendTo(ul)
                        .click ( function () {
                            item.option.selected = !item.option.selected;
                            term = input.val();
                            input.focus();
                            input.val(term);
				            input.autocomplete("search", term);
                            if (item.option.selected)
                                $("img", $(this)).attr("src", "/Content/themes/base/images/16/icone_ok.gif");
                            else
                                $("img", $(this)).attr("src", "/Content/themes/base/images/16/icone_ok_des.gif");
                            return false;
                        });
                };
        },
        destroy: function () {
            this.input.remove();
            this.button.remove();
            this.element.show();
            $.Widget.prototype.destroy.call(this);
        }
    });
})(jQuery);


function createDependent(source, target) {
    if ($("#" + source).hasClass('input-validation-error'))
        $("#" + target).addClass('input-validation-error');
}


function popupConfirmacao(mensagem, funcao, args, funcaoNaoOK, argsNaoOk) {
    //Seta valores Default.
    var tituloConfirm = "Confirmar Operação";
    var botaoConfirma = "Confirmar";
    var botaoCancela = "Cancelar";

    // Busca valores do resource.
    tituloConfirm = BuscarResource("TituloConfirmacao");
    botaoConfirma = BuscarResource("Confirma");
    botaoCancela = BuscarResource("Cancela");

    $('#PopUpConfirmacao').dialog({ buttons: [
            {
                text: botaoConfirma,
                click: function () {
                    if ($.isFunction(funcao)) {
                        funcao(args);
                    }
                    $(this).dialog("close");
                }
            },
            {
                text: botaoCancela,
                click: function () {
                    if ($.isFunction(funcaoNaoOK)) {
                        funcaoNaoOK(argsNaoOk);
                    }
                    $(this).dialog("close");
                }
            }
        ]
    },
        { title: tituloConfirm },
        { modal: true },
        { open: function () { $("#MensagemConfirmacao").html(mensagem); } });
}