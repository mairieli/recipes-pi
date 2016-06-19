<%-- 
    Document   : PaginaErroGeral
    Created on : 19/06/2016, 02:45:08
    Author     : josimar
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>ERRO</title>
        <c:import url="head.jsp"/>
    </head>
    <body>
        <c:import url="menu.jsp"/>
        <div class="container">
            <h1>Desculpe, ocorreu um erro,  clique <a href="index.jsp">AQUI</a> para tentar voltar pro ínicio.</h1></div>
        <img class="center-block" src="img/500.png" alt="imagem de erro 500"/>
    </body>
</html>
