<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="daoReceita" class="br.edu.utfpr.recipes.dao.DaoReceita" scope="request" />
<jsp:useBean id="daoComentario" class="br.edu.utfpr.recipes.dao.DaoComentario" scope="request" />
<jsp:useBean id="daoUsuario" class="br.edu.utfpr.recipes.dao.DaoUsuario" scope="request" />
<c:set var="usuario" value="${daoUsuario.findById(param.usuario_id)}" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="head.jsp"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <script src="scripts/jquery.min.js"></script>
        <script src="scripts/jquery-ui.js"></script>
        <script src="scripts/autocompleter.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="scripts/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/jquery-ui.min.js"></script>
        <script src="bootstrap/js/star-rating.js" type="text/javascript"></script>
        <link rel="stylesheet" href="bootstrap/css/star-rating.css" media="all" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/theme-krajee-fa.css" media="all" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/theme-krajee-svg.css" media="all" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/theme-krajee-uni.css" media="all" type="text/css"/>
        <script>
            function irReceita(id) {
                location.href = "VisualizacaoReceita.jsp?receita_id=" + id;
            }
            function irComentario(comentarioId, receitaId) {
                location.href = "VisualizacaoReceita.jsp?receita_id=" + receitaId + "#comentario" + comentarioId;
            }
        </script>
        <title>${usuario.nome}</title>
    </head>
    <body>
        <c:import url="menu.jsp"/>
        <c:set var="comentarios" value="${daoComentario.buscaComentarioPorUsuario(usuario)}"/>
        <c:set var="receitas" value="${daoReceita.buscaReceitaPorUsuario(usuario)}"/>

        <div class="container">

            <div class="col-md-6" style="width: 30%">
                <div class="panel panel-primary">

                    <div class="panel-heading">
                        <h2 style="text-align: center">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span> ${usuario.nome}
                        </h2>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12">
                            <h4>
                                <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp;&nbsp;${usuario.email}
                            </h4>

                            <h4>
                                <span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span>
                                &nbsp;${fn:length(receitas)} 
                                <c:choose>
                                    <c:when test="${fn:length(receitas) == 1}">Receita</c:when>
                                    <c:otherwise>Receitas</c:otherwise>
                                </c:choose>
                            </h4>

                            <h4>
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                &nbsp;${fn:length(comentarios)} 
                                <c:choose>
                                    <c:when test="${fn:length(comentarios) == 1}">Comentário</c:when>
                                    <c:otherwise>Comentários</c:otherwise>
                                </c:choose>
                            </h4>
                        </div>
                    </div>

                </div>
            </div>

            <c:if test="${fn:length(receitas) > 0}">
                <div class="col-md-6" style="width: 35%; float: left">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 style="text-align: center">Receitas</h1>
                        </div>

                        <div class="panel-body">
                            <c:forEach items="${receitas}" var="receita">
                                <div class="col-md-12" style="float: left; cursor: pointer" onclick="irReceita(${receita.id})"> 
                                    <hr>
                                    <div style="float: left; width: 100px; height: 100px; padding-left: 0px">
                                        <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="ExibeImagem?receita_id=${receita.id}&tipo=mini" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                                    </div>
                                    <div class="col-md-8">
                                        <h4 class="featurette-heading" style="margin-top: 0px; margin-left: 12px">${receita.nome}</h4>
                                        <div class="col-md-12" style="float: left">
                                            <input id="rating_hide" name="rating_hide" class="rating" value="${receita.mediaQualificacao()}" data-size="xs" data-show-caption="false" readonly>
                                            <label class="label label-default">${receita.categoria}</label>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test="${fn:length(comentarios) > 0}">
                <div class="col-md-6" style="width: 35%; float: left">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 style="text-align: center">Comentários</h1>
                        </div>

                        <div class="panel-body">
                            <c:forEach items="${comentarios}" var="comentario">
                                <div style="cursor: pointer" onclick="irComentario(${comentario.id}, ${comentario.receita.id})">
                                    <div class="col-md-12"> 
                                        <hr>
                                        <h4 style="font-weight:bold">${comentario.receita.nome}</h4>
                                    </div>
                                    <span class="text-justify col-md-12" style="overflow:hidden; max-height:140px">
                                        ${comentario.comentario}
                                    </span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>

        </div>
    </body>
</html>
