<%-- 
    Document   : CadastroUsuario
    Created on : 12/05/2016, 21:50:39
    Author     : Leonardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Usuario - Recipes</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <c:import url="menu.jsp"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h1 class="text-center login-title">Cadastro</h1>
                    <div class="account-wall">
                        <form class="form-signin" method="post" action="">
                            <input type="text" id="nome" name="nome" class="form-control" placeholder="nome" required autofocus>
                            <input type="text" id="email" name="email" class="form-control" placeholder="email" required>
                            <input type="password" id="senha" name="senha" class="form-control" placeholder="senha" required>
                            <input type="password" id="validSenha" name="validSenha" class="form-control" placeholder=" repetir senha" required>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">
                                Cadastrar</button>
                            <span class="clearfix"></span>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</div>
</html>
