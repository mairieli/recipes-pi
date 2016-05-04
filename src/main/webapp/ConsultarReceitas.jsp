<%-- 
    Document   : ConsultarReceitas
    Created on : 26/04/2016, 14:48:53
    Author     : Leonardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="daor" class="br.edu.utfpr.recipes.dao.DaoReceita" scope="request" />
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Receitas</title>
        <script type="text/javascript" src="scripts/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/jquery-ui.min.js"></script>
        <script type="text/javascript" src="scripts/tag-it.js"></script>
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link href="css/jquery.tagit.css" rel="stylesheet">
        <link href="css/tagit.ui-zendesk.css" rel="stylesheet">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript">
            $(document).ready(function () {
                $('#pesquisa').tagit({
                    autocomplete: {
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
                        },
                        removeConfirmation: true
                    }});
            });
        </script>
    </head>
    <body>
        <c:import url="menu.jsp?menu=pesquisa"/>
        <div class="container">
            <c:if test="${vazia!=null}">
                <h4 class="alert-info" style="padding: 6px"> ${vazia}</h4>
                <c:remove var="vazia"/>
            </c:if>
            <c:if test="${nula!=null}">
                <h4 class="alert-danger" style="padding: 6px"> ${nula}</h4>
                <c:remove var="nula"/>
            </c:if>
            <c:if test="${message_error!=null}">
                <h4 class="alert-danger"  style="padding: 4px;"> <i class="icon-warning-sign"></i> <c:out value="${message_error}" /></h4>
                <c:remove var="message_error"/>
            </c:if>
            <form class="form-horizontal" role="form" action="BuscaReceitasServlet" method="post">
                <div class="form-group"  id="alert1" style="float: left; width: 100%">
                    <h2 class="control-label col-md-2" for="titulo" style="float: left; margin-top:auto;text-align: -moz-center;margin-left: 10px;">Pesquisa:</h2>
                    <div>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="pesquisa" id="pesquisa" style="margin-left: 20px; margin-top: 24px; width: 67%;float: left" value="${filtro}"> 
                        </div>
                        <div>
                            <button type="submit" class="btn btn-default" style="float: left; margin-top: 3px; margin-left: 5px;">pesquisar</button>
                        </div>
                    </div>
                </div>
            </form>

            <!-- START THE FEATURETTES -->

            <hr class="featurette-divider" style="width: 100%; float: left">
            <c:forEach items="${receitas}" var="r">
                <div class="row featurette" style="float: left; margin-left: 226px;">
                    <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                        <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="ExibeImagem?receita_id=${r.id}&tipo=mini" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                    </div>
                    <div class="col-md-8">                    
                        <h2 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">${r.nome}</h2>
                        <div class="col-md-12" style="float: left">                
                            <div style="float: left; width: 100%;">Rendimento: ${r.rendimento} porções</div>
                            <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: ${r.tempoPreparo} Minutos</div>
                            <div style="float: left; width: 100%; margin-top: 5px;"><a class="btn btn-default" href="VisualizacaoReceita.jsp?receita_id=${r.id}" role="button">Ler mais »</a></div>
                        </div>
                    </div>
                </div>

                <hr class="featurette-divider" style="width: 100%; float: left">
            </c:forEach>




            <svg style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;" preserveAspectRatio="none" viewBox="0 0 500 500" height="500" width="500"><defs><style type="text/css"></style></defs><text style="font-weight:bold;font-size:25pt;font-family:Arial, Helvetica, Open Sans, sans-serif" y="25" x="0">500x500</text></svg>
    </body>
</div>
</html>
