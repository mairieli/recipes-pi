<%-- 
    Document   : VisualizacaoReceita
    Created on : 26/04/2016, 20:05:59
    Author     : xaaaandao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="daor" class="br.edu.utfpr.recipes.dao.DaoReceita" scope="request" />
<jsp:useBean id="daoTagR" class="br.edu.utfpr.recipes.dao.DaoTagReceita" scope="request" />
<c:set var="tempo" value="${0}"/>
<c:set var="r" value="${daor.findById(param.receita_id)}" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <c:import url="head.jsp"/>
        <title>${r.nome}</title>
    </head>
    <body>
        <c:import url="menu.jsp?menu=pesquisa"/>
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
                                <c:forEach items="${r.getItemReceitaList()}" var="item">
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
        </div>
    </body>
</html>
