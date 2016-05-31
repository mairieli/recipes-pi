function validateEmail(id) {
    var email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
    if (!email_regex.test($("#" + id).val())) {
        var div = $("#" + id).closest("div");
        div.removeClass("has-success");
        $("#glypcn" + id).remove();
        div.addClass("has-error has-feedback");
        div.append('<span id="glypcn' + id + '" class="glyphicon glyphicon-remove form-control-feedback"></span>');
        return false;
    } else {
        var div = $("#" + id).closest("div");
        div.removeClass("has-error");
        $("#glypcn" + id).remove();
        div.addClass("has-success has-feedback");
        div.append('<span id="glypcn' + id + '" class="glyphicon glyphicon-ok form-control-feedback"></span>');
        return true;
    }
}

$(document).ready(
        function () {
            //Botão deve ter o id=submit
            $("#submit").click(function () {
                //Campo e-mail deve ter o id=email
                if (!validateEmail("email")) {
                    return false;
                }
                //Formulario deve ter o id=form
                $("form#form").submit();
            });
        }
);