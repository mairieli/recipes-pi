<%-- 
    Document   : VisualizacaoReceita
    Created on : 26/04/2016, 20:05:59
    Author     : xaaaandao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="daor" class="br.edu.utfpr.recipes.dao.DaoReceita" scope="request" />
<c:set var="r" value="${daor.findById(param.receita_id)}" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="head.jsp"/>
        <title>${r.nome} - Receita da Vovó</title>
    </head>
    <body>
        <c:import url="menu.jsp?menu=pesquisa"/>
        <div class="container">
            <!-- Título -->
            <div class="form-group">
                <label class="control-label col-md-offset-1" for="titulo">
                    <h1>
                        ${r.nome}
                    </h1>
                </label>
            </div>      
            <!-- Foto -->
            <img src="ExibeImagem?receita_id=${r.id}&tipo=normal" class="img-rounded img-responsive" >
            <!-- Rendimento-->
            <div class="form-group">
                <label class="control-label col-md-offset-1" for="tempo_preparo">
                    <h3>
                        Tempo de preparo:
                        <small>
                            ${r.tempoPreparo} Minutos.
                        </small>
                    </h3>
                </label>
            </div>            
            <!-- Rendimento-->
            <div class="form-group">
                <label class="control-label col-md-offset-1" for="rendimento">
                    <h3>
                        Rendimento:
                        <small>
                            ${r.rendimento} porções.
                        </small>
                    </h3>
                </label>
            </div>
            <!-- Utensílios -->
            <div class="form-group">
                <label class="control-label col-md-offset-1" for="utensilios">
                    <h3>
                        Utensílios:
                    </h3>
                </label>
            </div>                 
            <div class="form-group">
                <label class="control-label col-md-offset-2">
                    <h5>
                        Espátula, Faca, Forma, Forno, Garfo.
                    </h5>
                </label> 
            </div>
            <!-- Ingredientes -->
            <div class="form-group">
                <label class="control-label col-md-offset-1" for="ingredientes">
                    <h3>
                        Ingredientes:
                    </h3>
                </label>
            </div>
            <div class="form-group">
                 <label class="control-label col-md-offset-2" for="ingrediente">
                <ul>
                    <c:forEach items="${r.getItemReceitaList()}" var="item">
                        <li>${item.quantidade} ${item.unidadeMedida} de ${item.ingrediente.nome}</li>
                    </c:forEach>
                </ul>
                 </label>
            </div>
            <!-- Modo de preparo -->
            <div class="form-group">
                <label class="control-label col-md-offset-1" for="modo_preparo">
                    <h3>
                        Modo de preparo:
                    </h3>
                </label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="modo_preparo">
                    <h5>
                        ${r.modoPreparo}
                    </h5>
                </label>
            </div>
           
        </div>
    </body>
</html>
