$(document).ready(function () {
    $(function () {
        $("#ingrediente0").autocomplete({
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
    });
});