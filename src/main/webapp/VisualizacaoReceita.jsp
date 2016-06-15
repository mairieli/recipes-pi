<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="daor" class="br.edu.utfpr.recipes.dao.DaoReceita" scope="request" />
<jsp:useBean id="daoTagR" class="br.edu.utfpr.recipes.dao.DaoTagReceita" scope="request" />
<jsp:useBean id="daoItemR" class="br.edu.utfpr.recipes.dao.DaoItemReceita" scope="request" />
<c:set var="tempo" value="${0}"/>
<c:set var="r" value="${daor.findById(param.receita_id)}" scope="request"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="bootstrap/css/star-rating.css" media="all" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/theme-krajee-fa.css" media="all" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/theme-krajee-svg.css" media="all" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/theme-krajee-uni.css" media="all" type="text/css"/>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="bootstrap/js/star-rating.js" type="text/javascript"></script>
        <c:import url="head.jsp"/>
        <title>${r.nome}</title>
        <script src="http://code.jquery.com/jquery-latest.js">
        </script>
        <script src="scripts/visualizacaoReceita.js"></script>
        <script>
            $(document).ready(function () {
                $('#enviar').click(function () {
                    $.ajax({
                        url: 'VisualizacaoReceitas',
                        type: 'POST',
                        data: 'raceita_id=' + ${r.id} + '&rating_hide=' + $('#rating_hide').val(),
                        success: function (data) {
                            $('#resultado').html(data);
                        }
                    });
                });
            });
        </script>
        <style type="text/css">
            body {
                overflow-x: hidden;
            }
            #resultado{
                color: #006600;
                padding: 3px;
            }
        </style>
    </head>
    <body>
        <c:import url="menu.jsp?menu=visualiza"/>
        <div class="container">

            <!-- Foto -->
            <div class="col-md-12" align="center">
                <img src="ExibeImagem?receita_id=${r.id}&tipo=normal" class="img-responsive">
            </div>
            <!-- Título -->
            <div class="col-md-10 col-md-offset-1">
                <label class="control-label" for="titulo">
                    <h1>
                        ${r.nome}
                    </h1>
                </label>
                <label class="control-label" for="excluir">
                    <c:if test="${usuarioLogado.admin}" >
                        <form method="post" action="ExcluirReceitaServlet">
                            <input type="hidden" name="receita_id" value="${r.id}">
                            <button type="submit" class="btn btn-danger" style="margin-bottom: 15px">Excluir</button>
                        </form>
                    </c:if>
                </label>
            </div>
            <div class="col-md-10 col-md-offset-1">
                <div class="caption">
                    <span class="label label-primary"></span>
                </div>
                <form name="form1" id="form1">
                    <c:set var="cookieName" value="rating-recipes_${r.id}-${usuarioLogado.id}" />
                    <c:set var="votar" value="" />
                    <c:forEach items="${cookie}" var="currentCookie">
                        <c:if test="${currentCookie.key == cookieName}">
                            <c:set var="votar" value="readonly" />
                        </c:if>
                    </c:forEach>
                    <input id="rating_hide"  class="rating hide" value="${r.mediaQualificacao()}" data-size="sm" data-show-caption="false" type="text" ${votar}>
                    <input type="button" id="enviar" value="Avaliar" />
                    <div class="success"><h6 id="resultado" ></h6></div>
                </form>

            </div>

            <!-- Rendimento-->
            <div class="col-md-12 col-md-offset-1">
                <label class="control-label" for="tempo_preparo">
                    <h3>
                        Tempo de Preparo:
                    </h3>
                </label>
                <label class="control-label" for="tempo_preparo">
                    <h4>
                        <c:if test="${r.tempoPreparo <= 60}">
                            ${r.tempoPreparo} Minutos
                        </c:if>
                        <c:if test="${r.tempoPreparo > 60}">
                            <fmt:formatNumber value="${r.tempoPreparo/60}" pattern="##0"/> Horas 
                            <c:if test="${r.tempoPreparo mod 60 > 0}">
                                e ${r.tempoPreparo mod 60} Minutos
                            </c:if>
                        </c:if>
                    </h4>
                </label>
            </div>
            <!-- Categoria -->
            <div class="col-md-12 col-md-offset-1">
                <label class="control-label" for="categoria">
                    <h3>
                        Categoria:
                    </h3>
                </label>
                <label class="control-label" for="categoria">
                    <h4>
                        ${r.categoria}
                    </h4>
                </label>
            </div>      
            <!-- Dificuldade -->
            <div class="col-md-12 col-md-offset-1">
                <label class="control-label" for="categoria">
                    <h3>
                        Dificuldade:
                    </h3>
                </label>
                <label class="control-label" for="categoria">
                    <h4>
                        ${r.dificuldade}
                    </h4>
                </label>
            </div>     
            <!-- Rendimento-->
            <div class="col-md-12 col-md-offset-1">
                <label class="control-label" for="rendimento">
                    <h3>
                        Rendimento:
                    </h3>
                </label>
                <label class="control-label" for="rendimento">
                    <h4>
                        ${r.rendimento} Porções
                    </h4>
                </label>
            </div>
            <!-- Utensílios -->
            <c:set var="utensilios" value="${daoTagR.buscaPorReceita(r)}"/>
            <c:if test="${!utensilios.isEmpty()}">
                <div class="col-md-12 col-md-offset-1">
                    <div>
                        <label class="control-label" for="utensilios">
                            <h3>
                                Utensílios:
                            </h3>
                        </label>
                    </div>                 
                    <div>
                        <label class="control-label">
                            <ul>
                                <h4>
                                    <c:forEach items="${daoTagR.buscaPorReceita(r)}" var="tagR">
                                        <li>${tagR.tag.nome}</li>
                                        </c:forEach>
                                </h4>
                            </ul>
                        </label> 
                    </div>
                </div>
            </c:if>
            <!-- Ingredientes -->
            <div class="col-md-12 col-md-offset-1">
                <div>
                    <label class="control-label" for="ingredientes">
                        <h3>
                            Ingredientes:
                        </h3>
                    </label>
                </div>
                <div>
                    <label class="control-label" for="ingrediente">
                        <ul>
                            <h4>
                                <c:forEach items="${daoItemR.buscaPorReceita(r)}" var="item">
                                    <li>${item.quantidade} ${item.unidadeMedida} de ${item.ingrediente.nome}</li>
                                    </c:forEach>
                            </h4>
                        </ul>
                    </label>
                </div>
            </div>
            <!-- Modo de preparo -->
            <div class="col-md-12 col-md-offset-1">
                <div>
                    <label class="control-label" for="modo_preparo">
                        <h3>
                            Modo de Preparo:
                        </h3>
                    </label>
                </div>
                <div>
                    <label class=" text-justify col-md-10" for="modo_preparo">
                        ${r.modoPreparo}
                    </label>
                </div>
            </div>

            <!-- Fazer Comentário -->
            <div class="col-md-12 col-md-offset-1" style="margin-top: 20px">
                <hr class="col-md-10">
                <form id="form-comentario" role="form" action="ComentarioServlet" method="post">
                    <input type="hidden" name="receita_id" value="${r.id}">
                    <div class="form-group col-md-10">
                        <textarea class="form-control" rows="4" name="comentario" id="comentario"></textarea>
                    </div> 
                    <div class="col-md-10">
                        <button type="submit" class="btn btn-success">Enviar Comentário</button>
                    </div>
                </form>
            </div>

            <!--Comentario 1-->
            <div class="col-md-12 col-md-offset-1">
                <div class="col-md-10"> 
                    <hr>
                    <h4><label class="label label-primary">Fulaninho</label>
                        <small>23:15:01 15-06-2016</small></h4>
                </div>
                <span class="text-justify col-md-10">
                    A certificação de metodologias...
                </span>
                <div class="col-md-10" style="margin-top: 5px">
                    <form method="post" action="">
                        <input type="hidden" name="receita_id" value="${r.id}">
                        <button type="submit" class="btn btn-sm btn-danger">Excluir</button>
                    </form>
                </div>
            </div>

            <!--Comentario 2-->
            <div class="col-md-12 col-md-offset-1">
                <div class="col-md-10"> 
                    <hr>
                    <h4><label class="label label-primary">Ciclaninho</label>
                        <small>02:02:03 02-03-2016</small></h4>
                </div>
                <span class="text-justify col-md-10">
                    Lição 1: “Se te oferecerem um lugar em um foguete, não pergunte
                    onde o assento fica”. De acordo com a COO do Facebook, este conselho
                    foi dado por Eric Schimidt, então CEO do Google, quando ela estava
                    em dúvida se aceitava ou não a proposta de trabalhar na empresa.
                </span>
                <div class="col-md-10" style="margin-top: 5px">
                    <form method="post" action="">
                        <input type="hidden" name="receita_id" value="${r.id}">
                        <button type="submit" class="btn btn-sm btn-danger">Excluir</button>
                    </form>
                </div>
            </div>

            <!--Comentario 3-->
            <div class="col-md-12 col-md-offset-1">
                <div class="col-md-10"> 
                    <hr>
                    <h4><label class="label label-primary">Beltraninho</label>
                        <small>10:23:54 02-05-2016</small></h4>
                </div>
                <span class="text-justify col-md-10">
                    "Flashear" um modem (do inglês "Flash") no seu Android é fácil,
                    por meio de um software chamado Odin. Como com qualquer outro
                    procedimento para modificar seu telefone, trata-se de um procedimento
                    arriscado, ficando sob sua inteira responsabilidade. Assim,
                    leia as instruções com cuidado.
                    Baixe um modem que você quer flashear em seu telefone. Um "modem",
                    neste caso, é um arquivo específico para seu telefone, definido
                    por região. Procure por uma lista de modens para seu telefone e
                    as companhias de sua região. Você pode buscar no Google por
                    “[seu modelo de telefone] [sua companhia e sua região] e os termos
                    "modem" e "download”.
                    Sites como o XDA Developers ou fóruns conhecidos sobre Android são fontes recomendáveis.
                </span>
            </div>

        </div>
    </body>
</html>
