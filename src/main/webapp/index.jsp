<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="melhoresReceitas" class="br.edu.utfpr.recipes.controller.MelhoresReceitasController" scope="request" />
<c:set var="receitas" value="${melhoresReceitas.escolheReceitasParaExibir()}"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="head.jsp"/>
        <title>Recipes</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="scripts/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/jquery-ui.min.js"></script>
        <script src="bootstrap/js/star-rating.js" type="text/javascript"></script>
        <link rel="stylesheet" href="bootstrap/css/star-rating.css" media="all" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/theme-krajee-fa.css" media="all" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/theme-krajee-svg.css" media="all" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/theme-krajee-uni.css" media="all" type="text/css"/>
    </head>
    <script>
        function ir(id){            
            location.href = "VisualizacaoReceita.jsp?receita_id=" + id;
        }
    </script>
    <body>
        <c:import url="menu.jsp?menu=home"/>
        <div class="container">

            <div class="page-header">
                <c:if test="${message!=null}">
                    <h4 class="alert-success"> ${message}</h4>
                    <c:remove var="message"/>
                </c:if>
                <c:if test="${message_error!=null}">
                    <h4 class="alert-danger"  style="padding: 4px;"> <i class="icon-warning-sign"></i> <c:out value="${message_error}" /></h4>
                    <c:remove var="message_error"/>
                </c:if>
                <div style="text-align: center">
                    <h1>Receitas Melhor Qualificadas</h1>
                </div>
                <div class="col-md-12" style="margin-top: 3%">
                    <div class="row featurette" style="float: left; width: 50%; cursor: pointer" onclick="ir(${receitas.get(0).id})">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="ExibeImagem?receita_id=${receitas.get(0).id}&tipo=mini" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h3 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">${receitas.get(0).nome}</h3>
                            <div class="col-md-12" style="float: left">                
                                <input id="rating_hide0" name="rating_hide0" class="rating" value="${receitas.get(0).mediaQualificacao()}" data-size="xs" data-show-caption="false" readonly>
                                <div style="float: left; width: 100%;">Rendimento: ${receitas.get(0).rendimento} porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: ${receitas.get(0).tempoPreparo} Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: ${receitas.get(0).categoria}</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: ${receitas.get(0).dificuldade}</div>
                            </div>
                        </div>
                    </div>
                    <div class="row featurette" style="float: left; width: 50%; cursor: pointer" onclick="ir(${receitas.get(1).id})">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="ExibeImagem?receita_id=${receitas.get(1).id}&tipo=mini" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h3 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">${receitas.get(1).nome}</h3>
                            <div class="col-md-12" style="float: left">                
                                <input id="rating_hide" name="rating_hide" disabled="" class="rating" value="${receitas.get(1).mediaQualificacao()}" data-size="xs" data-show-caption="false" readonly>
                                <div style="float: left; width: 100%;">Rendimento: ${receitas.get(1).rendimento} porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: ${receitas.get(1).tempoPreparo} Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: ${receitas.get(1).categoria}</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: ${receitas.get(1).dificuldade}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 3%">
                    <div class="row featurette" style="float: left; width: 50%; cursor: pointer" onclick="ir(${receitas.get(2).id})">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="ExibeImagem?receita_id=${receitas.get(2).id}&tipo=mini" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h3 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">${receitas.get(2).nome}</h3>
                            <div class="col-md-12" style="float: left"> 
                                <input id="rating_hide" name="rating_hide" disabled="" class="rating" value="${receitas.get(2).mediaQualificacao()}" data-size="xs" data-show-caption="false" readonly>
                                <div style="float: left; width: 100%;">Rendimento: ${receitas.get(2).rendimento} porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: ${receitas.get(2).tempoPreparo} Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: ${receitas.get(2).categoria}</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: ${receitas.get(2).dificuldade}</div>
                            </div>
                        </div>
                    </div>
                    <div class="row featurette" style="float: left; width: 50%; cursor: pointer" onclick="ir(${receitas.get(3).id})">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="ExibeImagem?receita_id=${receitas.get(3).id}&tipo=mini" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h3 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">${receitas.get(3).nome}</h3>
                            <div class="col-md-12" style="float: left">  
                                <input id="rating_hide" name="rating_hide" disabled="" class="rating" value="${receitas.get(3).mediaQualificacao()}" data-size="xs" data-show-caption="false" readonly>
                                <div style="float: left; width: 100%;">Rendimento: ${receitas.get(3).rendimento} porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: ${receitas.get(3).tempoPreparo} Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: ${receitas.get(3).categoria}</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: ${receitas.get(3).dificuldade}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 3%">
                    <div class="row featurette" style="float: left; width: 50%; cursor: pointer" onclick="ir(${receitas.get(4).id})">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="ExibeImagem?receita_id=${receitas.get(4).id}&tipo=mini" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h3 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">${receitas.get(4).nome}</h3>
                            <div class="col-md-12" style="float: left">     
                                <input id="rating_hide" name="rating_hide" disabled="" class="rating" value="${receitas.get(4).mediaQualificacao()}" data-size="xs" data-show-caption="false" readonly>
                                <div style="float: left; width: 100%;">Rendimento: ${receitas.get(4).rendimento} porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: ${receitas.get(4).tempoPreparo} Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: ${receitas.get(4).categoria}</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: ${receitas.get(4).dificuldade}</div>
                            </div>
                        </div>
                    </div>
                    <div class="row featurette" style="float: left; width: 50%; cursor: pointer" onclick="ir(${receitas.get(5).id})">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="ExibeImagem?receita_id=${receitas.get(5).id}&tipo=mini" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h3 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">${receitas.get(5).nome}</h3>
                            <div class="col-md-12" style="float: left">       
                                <input id="rating_hide" name="rating_hide" disabled="" class="rating" value="${receitas.get(5).mediaQualificacao()}" data-size="xs" data-show-caption="false" readonly>
                                <div style="float: left; width: 100%;">Rendimento: ${receitas.get(5).rendimento} porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: ${receitas.get(5).tempoPreparo} Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: ${receitas.get(5).categoria}</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: ${receitas.get(5).dificuldade}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <span style="padding: 50px"></span>
    </body>
</html>