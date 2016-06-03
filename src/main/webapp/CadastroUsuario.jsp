<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <c:if test="${usuarioLogado != null}">
        <c:redirect url="index.jsp"/>
    </c:if>
    <head>
        <c:import url="head.jsp"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Usuario - Recipes</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="scripts/validaemail.js"></script>
    </head>
    <body>
        <c:import url="menu.jsp"/>
        <div class="container">
            <div class="row">
                <c:if test="${message!=null}">
                    <h4 class="alert-success"> ${message}</h4>
                    <c:remove var="message"/>
                </c:if>
                <c:if test="${message_error!=null}">
                    <h4 class="alert-danger"  style="padding: 4px;"> <i class="icon-warning-sign"></i> <c:out value="${message_error}" /></h4>
                    <c:remove var="message_error"/>
                </c:if>
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h1 class="text-center login-title">Cadastro</h1>
                    <div class="account-wall">
                        <form class="form-signin" method="post" action="CadastroDeUsuariosServlet">
                            <input type="text" id="nome" name="nome" class="form-control" placeholder="nome" required autofocus>
                            <div id="form">
                                <input type="text" id="email" name="email" class="form-control" placeholder="email" required>
                            </div>
                            <input type="password" id="senha" name="senha" class="form-control" placeholder="senha" required>
                            <input type="password" id="validSenha" name="validaSenha" class="form-control" placeholder=" repetir senha" required>
                            <button class="btn btn-lg btn-primary btn-block" type="submit" id="submit">
                                Cadastrar</button>
                            <span class="clearfix"></span>
                        </form>
                    </div><a href="login.jsp" class="text-center new-account">Login</a>                    
                </div>
            </div>
        </div>
    </body>
</html>