<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="daoIP" class="br.edu.utfpr.recipes.dao.DaoIngrediente" scope="request" />
<!DOCTYPE html>

<html>
    <head>
        <link rel="shortcut icon" href="../img/recipe_search.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../scripts/jquery.min.js"></script>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <title>Aprovação de Receitas</title>
        <style>
            body {
                overflow-x: hidden;
            }
        </style>
        
        <script src="../scripts/jquery-1.10.2.js"></script>
        <script src="../bootstrap/js/bootstrap.js"></script>
        
    </head>
    <body>
        <c:import url="/menu.jsp?menu=aprovacao"/>
        <div class="container">
            <c:if test="${message!=null}">
                <h4 class="alert-success"> ${message}</h4>
                <c:remove var="message"/>
            </c:if>
            <c:if test="${message_error!=null}">
                <h4 class="alert-danger"  style="padding: 4px;"> <i class="icon-warning-sign"></i> <c:out value="${message_error}" /></h4>
                <c:remove var="message_error"/>
            </c:if>
        </div>
        <h1 class="text-center">Aprovação de Ingredientes</h1>
        <c:if test="${daoIP.buscaIngredientesPendentes().size() == 0}">
            <h3 class="text-center">
                Nada para aprovar no momento
            </h3>
        </c:if>
        <c:forEach items="${daoIP.buscaIngredientesPendentes()}" var="i">
            <form class="container" action="AprovacaoIngredienteServlet" method="post">
                <div class="col-md-12 col-md-offset-2">
                    <div class="col-md-6">
                        <label class="control-label">
                            <h4>
                                ${i.nome}
                            </h4>
                        </label>
                    </div>
                    <div class="col-md-6">
                        <button type="submit" class="btn btn-success">
                            Aprovar
                        </button>
                        <input type="hidden" name="ingrediente_id" value="${i.id}">
                    </div>
                </div>

        </form>
    </c:forEach>
</body>
</html>
