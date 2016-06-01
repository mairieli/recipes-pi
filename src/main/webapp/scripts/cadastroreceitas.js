/* Campo Ingrediente Dinamico */
$(document).ready(function ($) {
    var i = 1;
    $("#add").click(function (e) {
        var divIng = '<div class="form-group col-md-12 ing' + i + '" id="alertIngrediente' + i + '">';
        $("#items").append(divIng);
        var labelAxu = '<label class="col-md-2"></label>';
        $(".ing" + i).append(labelAxu);
        var divQuantidade = '<div class="col-md-1 quantidade' + i + '"></div>';
        $(".ing" + i).append(divQuantidade);
        var divUnidade = '<div class="col-md-3 unidade' + i + '"></div>';
        $(".ing" + i).append(divUnidade);
        var divIngrediente = '<div class="col-md-5 ingrediente' + i + '"></div>';
        $(".ing" + i).append(divIngrediente);

        var inputQuantidade = '<input type="text" id="quantidade' + i + '" class="form-control" name="quantidade' + i + '" placeholder="quant." pattern="[0-9]+$">';
        $(".quantidade" + i).append(inputQuantidade);

        var inputUnidade = '<input type="text" id="unidade_medida' + i + '" class="form-control" name="unidade_medida' + i + '" placeholder="ex: colher de chá, unidades">'
        $(".unidade" + i).append(inputUnidade);

        var inputIngrediente = '<input type="text" id="ingrediente' + i + '" class="form-control" name="ingrediente' + i + '" placeholder="ingrediente">'
        $(inputIngrediente).appendTo('.ingrediente' + i).autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "BuscaIngrediente",
                    type: "GET",
                    data: {
                        term: request.term
                    },
                    dataType: "json",
                    success: function (data) {
                        response(data);
                    }
                });
            }
        });
        var botaoRemover = '<button class="delete btn btn-danger">Remover</button></div>';
        $(".ing" + i).append(botaoRemover);

        i = i + 1;
    });

    $("body").on("click", ".delete", function (e) {
        $(this).parent("div").remove();
    });

});

/* Mostrar TAG que pode ser opcional */
function mostrarTAG(id1) {
    var div1 = document.getElementById(id1);
    if (div1.style.display !== "none") {
        div1.style.display = "none";
    } else {
        div1.style.display = "block";
    }
}

function validaForm() {
    var i = {valor: 0};
    verificaCampo(i, "titulo", "alert1", "");
    
    var quantidades = [];
    var inputs = document.getElementsByTagName("input");
    for (var a = 0; a < inputs.length; a++) {
        if (inputs[a].name.indexOf('unidade_') == 0) {
            var tamanho = inputs[a].name.lenght;
            quantidades.push(inputs[a].name.substring(14, tamanho));
        }
    }

    for (var a = 0; a < quantidades.length; a++) {
        if (document.getElementById('quantidade' + quantidades[a]).value == "" || document.getElementById('unidade_medida' + quantidades[a]).value == "" || document.getElementById('ingrediente' + quantidades[a]).value == "" || isNaN(document.getElementById('quantidade' + quantidades[a]).value)) {
            document.getElementById("alertIngrediente" + quantidades[a]).className = "form-group ing" + quantidades[a] + " has-error";
            i.valor = 1;
        } else {
            document.getElementById("alertIngrediente" + quantidades[a]).className = "form-group ing" + quantidades[a];
        }
    }

    if (document.getElementById("rendimento").value == "" || isNaN(document.getElementById("rendimento").value)) {
        document.getElementById("alert3").className = "form-group has-error";
        i.valor = 1;
    } else {
        document.getElementById("alert3").className = "form-group";
    }

    if (document.getElementById("tempo_preparo").value == "" || isNaN(document.getElementById("tempo_preparo").value)) {
        document.getElementById("alert9").className = "form-group has-error";
        i.valor = 1;
    } else {
        document.getElementById("alert9").className = "form-group";
    }

    verificaCampo(i, "categoria", "alert4", "Nenhum");
    verificaCampo(i, "dificuldade", "alert5", "Nenhuma");
    verificaCampo(i, "modo_preparo", "alert6", "");
    

    if (i.valor == 1) {
        return false;
    } else {
        document.getElementById("myModal").style.display = "block";
    }
}

function verificaCampo(i, id, alert, valor) {
    if (document.getElementById(id).value == valor) {
        document.getElementById(alert).className = "form-group has-error";
        i.valor = 1;
    } else {
        document.getElementById(alert).className = "form-group";
    }
}

function fecharModal() {
    document.getElementById("myModal").style.display = "none";
}
function carregando(div_id, message) {
    document.getElementById(div_id).innerHTML = "<h3 class=\"alert-info\">" + message + "<img src='img/loading.gif'/></h3>";
}
