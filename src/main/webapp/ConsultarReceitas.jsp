<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="daor" class="br.edu.utfpr.recipes.dao.DaoReceita" scope="request" />

<!DOCTYPE html>
<html>
    <head>
        <c:import url="head.jsp"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Receitas</title>
        <script type="text/javascript" src="scripts/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/jquery-ui.min.js"></script>
        <script type="text/javascript" src="scripts/tag-it.js"></script>
        <link href="css/jquery.tagit.css" rel="stylesheet">
        <link href="css/tagit.ui-zendesk.css" rel="stylesheet">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="scripts/consultarreceita.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#pesquisa').tagit({
                    placeholderText: 'ingrediente',
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
                        removeConfirmation: true,
                        placeholderText: "Ingredientes"
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
                    <!--<h2 class="control-label col-md-2" for="titulo" style="float: left; margin-top:auto;text-align: -moz-center;margin-left: 10px;">Pesquisa:</h2>-->
                    <div>
                        <div class="col-md-9" style="width:70%; margin-left:85px; margin-top:13px;">
                            <input type="text" class="form-control" name="pesquisa" id="pesquisa" style="margin-left: 140px; margin-top: 24px; width: 67%;float: left" value="${filtro}"> 
                        </div>
                        <div>
                            <button type="submit" class="btn btn-default" style="float: left; margin-top: -47px; margin-left: 891px;">pesquisar</button>
                        </div>

                        <!-- Adicionar TAG's -->
                        <div class="form-group">
                            <div style="width: 895px; margin: 0px auto;">
                                <button type="button" class="btn btn-info col-lg-offset-2 btn-lg" style="float: left; margin-top:-54px; margin-left: 98%;" onclick="mostrarFiltro('div_tag1', 'div_tag2', 'div_tag3');";>Filtro</button>
                            </div>
                        </div>    
                        <div class="form-group col-md-8" id="div_tag1" style="display:none; margin: 0px auto; width: 919px; float: none;">
                            <div style="float: left;width: 100%;">
                                <div class="form-group" id="alert4">
                                    <label class="control-label col-md-1" for="Categoria">Categoria:</label>
                                    <div class="col-md-4">
                                        <select class="form-control" name="categoria" id="categoria" style="margin-left: 10%">
                                            <option>Nenhum</option> 
                                            <option>Aves</option>
                                            <option>Bebidas</option>
                                            <option>Bolos E Tortas</option>
                                            <option>Carnes</option>
                                            <option>Doces E Sobremesas</option>
                                            <option>Entradas</option>
                                            <option>Lanches</option>
                                            <option>Massas</option>
                                            <option>Molhos E Acompanhamentos</option>
                                            <option>Peixes E Frutos do Mar</option>
                                            <option>Saladas</option>
                                            <option>Sopas</option>
                                        </select> 
                                    </div>
                                </div>
                                <!-- Dificuldade -->
                                <div class="form-group" id="alert5">
                                    <label class="control-label col-md-1" for="Dificuldade">Dificuldade:</label>
                                    <div class="col-md-4">
                                        <select class="form-control" name="dificuldade" id="dificuldade" style="margin-left: 10%">
                                            <option>Nenhuma</option>
                                            <option>Fácil</option>
                                            <option>Médio</option>
                                            <option>Díficil</option>
                                        </select> 
                                    </div>
                                </div>

                                <div class="form-group" id="alert5">
                                    <label class="control-label col-md-1" style="text-align: left; width: 34.06%; margin-top: 1.1%" for="somente-ingrediente">Somente os ingredientes especificados:</label>
                                    <div class="col-md-1">
                                        <label class="checkbox-inline " style="margin-left: -20px;"><input type="checkbox" name="apenas_especificos" value="Sim" checked="true"></label> 
                                    </div>
                                </div>
                            </div>
                            <div class ="form-group" id="id1">
                                <label class="control-label col-md-2" style="width: 286px; float: left; text-align: left;" for="equipamentos">Equipamentos:</label>
                            </div>    

                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Batedeira">Batedeira</label> 
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Cafeteira">Cafeteira</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Chaleira">Chaleira</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Concha">Concha</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Copo">Copo</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Colher de cafe">Colher de café</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Colher de cha">Colher de chá</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Colher de sopa">Colher de sopa</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Descascador">Descascador</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Descascador de legumes">Descascador de legumes</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Escorredor de macarrao">Escorredor de macarrão</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Escumadeira">Escumadeira</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Espatula">Espátula</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Faca">Faca</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Forma">Forma</label>                                           
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Forno">Forno</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Fogao">Fogão</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Fouet">Fouet</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Freezer">Freezer</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Frigideira">Frigideira</label>                
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Funil">Funil</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Garfo">Garfo</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Grill">Grill</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Liquidificador">Liquidificador</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Micro-ondas">Micro-ondas</label>              
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Panela">Panela</label>                
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Panela de Pressao">Panela de Pressão</label>                
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Peneira">Peneira</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Processador">Processador</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Prato">Prato</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Ralador">Ralador</label>
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Sanduicheira">Sanduicheira</label>                
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Taca">Taça</label>                
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Tabua">Tábua</label>                
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Tigela">Tigela</label> 
                            <label class="checkbox-inline " style="width: 286px; float: left; margin-left: 0;"><input type="checkbox" name="tag" value="Xicara">Xícara</label> 
                        </div>     
                    </div>
                </div>
            </form>
            <hr class="featurette-divider" style="width: 100%; float: left; margin-top: -5px;">
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
                            <div style="float: left; width: 100%; margin-top: 5px;">Categoria: ${r.categoria}</div>
                            <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: ${r.dificuldade}</div>
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
