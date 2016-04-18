<%-- 
    Document   : uploade_image_recipe
    Created on : 14/04/2016, 22:07:51
    Author     : josimar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Imagem da Receita</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    </head>
    <body>
        <c:if test="${message!=null}">
            <h4 class="alert-success"> <c:out value="${message}" /></h4>
            <c:remove var="message"/>
        </c:if>
        <c:if test="${message_error!=null}">
            <h4 class="alert-danger"  style="padding: 4px;"> <i class="icon-warning-sign"></i> <c:out value="${message_error}" /></h4>
            <c:remove var="message_error"/>
        </c:if>
        <h1>Inserir Imagem da Receita</h1>
        <form class="form-horizontal" role="form" action="ImageUpload" method="post" ENCTYPE="multipart/form-data">
            <!-- Título da receita -->
            <div class="form-group">
                <label class="control-label col-md-2" for="campos">(*)Campos Obrigatórios</label>
            </div>
            <div class="form-group"  id="imagem">
                <label class="control-label col-md-2" for="titulo">Imagem*:</label>
                <div class="col-md-4">
                    <input type="file" class="form-control" name="imagem" id="titulo" required>
                </div>
            </div>
            <div class="form-group"  id="alert1">
                <div class="col-md-4">
                    <input type="hidden" name="redeita_id" value="${param.receita_id}">
                    <input type="submit" class="btn btn-primary"  >
                </div>
            </div>
        </form>
    </body>
</html>
