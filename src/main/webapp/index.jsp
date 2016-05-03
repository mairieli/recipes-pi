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
                <h1>Hello World!</h1>

            </div>
        </div>
    </body>
</html>
