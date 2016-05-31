<%-- 
    Document   : index
    Created on : 28/04/2016, 01:48:42
    Author     : josimar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h1>Top Receitas</h1>
                </div>
                <div class="col-md-12" style="margin-top: 3%">
                    <div class="row featurette" style="float: left; width: 50%">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="img/bolo_chocolate-521x380.jpg" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h2 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">Bolo</h2>
                            <div class="col-md-12" style="float: left">                
                                <div style="float: left; width: 100%;">Rendimento: 8 porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: 50 Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: Sobremesa</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: Media</div>
                                <div style="float: left; width: 100%; margin-top: 5px;"><a class="btn btn-default" href="" role="button">Ler mais »</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="row featurette" style="float: left; width: 50%">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="img/cafe-2.jpg" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h2 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">Cafe</h2>
                            <div class="col-md-12" style="float: left">                
                                <div style="float: left; width: 100%;">Rendimento: 5 porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: 20 Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: Bebidas</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: Media</div>
                                <div style="float: left; width: 100%; margin-top: 5px;"><a class="btn btn-default" href="" role="button">Ler mais »</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 3%">
                    <div class="row featurette" style="float: left; width: 50%">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="img/torta.jpg" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h2 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">Torta</h2>
                            <div class="col-md-12" style="float: left">                
                                <div style="float: left; width: 100%;">Rendimento: 10 porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: 40 Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: Salgados</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: Media</div>
                                <div style="float: left; width: 100%; margin-top: 5px;"><a class="btn btn-default" href="" role="button">Ler mais »</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="row featurette" style="float: left; width: 50%">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="img/cachorro_quente.jpg" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h2 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">cachorro quente</h2>
                            <div class="col-md-12" style="float: left">                
                                <div style="float: left; width: 100%;">Rendimento: 4 porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: 45 Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: Lanches</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: Media</div>
                                <div style="float: left; width: 100%; margin-top: 5px;"><a class="btn btn-default" href="" role="button">Ler mais »</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 3%">
                    <div class="row featurette" style="float: left; width: 50%">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="img/sorvete.jpg" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h2 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">Sorvete</h2>
                            <div class="col-md-12" style="float: left">                
                                <div style="float: left; width: 100%;">Rendimento: 20 porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: 4 horas</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: Sobremesa</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: Media</div>
                                <div style="float: left; width: 100%; margin-top: 5px;"><a class="btn btn-default" href="" role="button">Ler mais »</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="row featurette" style="float: left; width: 50%">
                        <div class="col-md-4" style="float: left; width: 120px; height: 120px; padding-left: 0px">
                            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="img/suco.jpg" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                        </div>
                        <div class="col-md-8">                    
                            <h2 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">Suco</h2>
                            <div class="col-md-12" style="float: left">                
                                <div style="float: left; width: 100%;">Rendimento: 15 porções</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: 10 Minutos</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Categoria: Bebidas</div>
                                <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: Media</div>
                                <div style="float: left; width: 100%; margin-top: 5px;"><a class="btn btn-default" href="" role="button">Ler mais »</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
