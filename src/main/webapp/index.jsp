<%-- 
    Document   : index
    Created on : 28/04/2016, 01:48:42
    Author     : josimar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="melhoresReceitas" class="br.edu.utfpr.recipes.servlets.MelhoresReceitasController" scope="request" />
<c:set var="receitas" value="${melhoresReceitas.escolheReceitasParaExibir()}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recipes</title>
        <c:import url="head.jsp"/>
    </head>
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
                    <div class="row featurette" style="float: left; width: 50%">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="ExibeImagem?receita_id=${receitas.get(0).id}&tipo=mini" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h3 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">${receitas.get(0).nome}</h3>
                            <div class="col-md-12" style="float: left">                
                                <div style="float: left; width: 100%;">Rendimento: 8 porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: ${receitas.get(0).tempoPreparo} Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: ${receitas.get(0).categoria}</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: ${receitas.get(0).dificuldade}</div>
                            </div>
                        </div>
                    </div>
                    <div class="row featurette" style="float: left; width: 50%">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="ExibeImagem?receita_id=${receitas.get(1).id}&tipo=mini" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h3 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">${receitas.get(1).nome}</h3>
                            <div class="col-md-12" style="float: left">                
                                <div style="float: left; width: 100%;">Rendimento: 8 porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: ${receitas.get(1).tempoPreparo} Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: ${receitas.get(1).categoria}</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: ${receitas.get(1).dificuldade}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 3%">
                    <div class="row featurette" style="float: left; width: 50%">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="ExibeImagem?receita_id=${receitas.get(2).id}&tipo=mini" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h3 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">${receitas.get(2).nome}</h3>
                            <div class="col-md-12" style="float: left">                
                                <div style="float: left; width: 100%;">Rendimento: 8 porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: ${receitas.get(2).tempoPreparo} Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: ${receitas.get(2).categoria}</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: ${receitas.get(2).dificuldade}</div>
                            </div>
                        </div>
                    </div>
                    <div class="row featurette" style="float: left; width: 50%">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="ExibeImagem?receita_id=${receitas.get(3).id}&tipo=mini" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h3 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">${receitas.get(3).nome}</h3>
                            <div class="col-md-12" style="float: left">                
                                <div style="float: left; width: 100%;">Rendimento: 8 porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: ${receitas.get(3).tempoPreparo} Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: ${receitas.get(3).categoria}</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: ${receitas.get(3).dificuldade}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 3%">
                    <div class="row featurette" style="float: left; width: 50%">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="ExibeImagem?receita_id=${receitas.get(4).id}&tipo=mini" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h3 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">${receitas.get(4).nome}</h3>
                            <div class="col-md-12" style="float: left">                
                                <div style="float: left; width: 100%;">Rendimento: 8 porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: ${receitas.get(4).tempoPreparo} Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: ${receitas.get(4).categoria}</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: ${receitas.get(4).dificuldade}</div>
                            </div>
                        </div>
                    </div>
                    <div class="row featurette" style="float: left; width: 50%">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="ExibeImagem?receita_id=${receitas.get(5).id}&tipo=mini" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h3 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">${receitas.get(5).nome}</h3>
                            <div class="col-md-12" style="float: left">                
                                <div style="float: left; width: 100%;">Rendimento: 8 porções</div>
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
