<%-- 
    Document   : index
    Created on : 13/03/2014, 12:01:18
    Author     : josimar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="head.jsp?title=Bem Vindo!"/>
       
    </head>
    <body>
        <c:import url="menu.jsp?menu=Inicio"/>
        <c:if test="${message!=null}">
            <h4 class="alert-success"> <c:out value="${message}" /></h4>
        </c:if>
        <c:if test="${message_error!=null}">
            <h4 class="alert-danger"  style="padding: 4px;"> <i class="icon-warning-sign"></i> <c:out value="${message_error}" /></h4>
        </c:if>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span9">
                    <div class="content">
                        <h3>Bem Vindo</h3>
                       
                       
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>
       
         <c:import url="rodape.jsp"/>
    </body>
</html>

<c:remove var="message"/>
<c:remove var="message_error"/>