/* Campo Ingrediente Dinamico */
$(document).ready(function ($) {
    var i = 1;
    $("#add").click(function (e) {
        $("#items").append('<div class="form-group col-md-12"><label class="col-md-2"></label><div class="col-md-1"><input type="text" class="form-control" name="quantidade' + i + '" placeholder="quant."></div><div class="col-md-3"><input type="text" class="form-control" name="unidade_medida' + i + '" placeholder="ex: colher de sopa, colher de chá"></div><div class="col-md-5"><input type="text" class="form-control" name="ingrediente' + i + '" placeholder="ingrediente"></div><button  class="delete btn btn-danger">Remover</button></div>');
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

    /* Ingrediente verificados juntos: */
    if (document.getElementById("quantidade0").value == "" || document.getElementById("unidade_medida0").value == "" || document.getElementById("ingrediente0").value == "") {
        document.getElementById("alert2").className = "form-group has-error";
        i.valor = 1;
    } else {
        document.getElementById("alert2").className = "form-group";
    }

    verificaCampo(i, "rendimento", "alert3", "");
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

function cadRealizado() {
    alert("Cadastro realizado com sucesso!");
}