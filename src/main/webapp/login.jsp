<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Recipes</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <c:import url="menu.jsp"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h1 class="text-center login-title">Login</h1>
                    <div class="account-wall">
                        <form class="form-signin" method="post" action="login">
                            <input type="text" id="email" name="email" class="form-control" placeholder="email" required autofocus>
                            <input type="password" id="senha" name="senha" class="form-control" placeholder="senha" required>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">
                                Entrar</button>
                            <span class="clearfix"></span>
                        </form>
                    </div>
                    <a href="#" class="text-center new-account">Criar uma conta</a>
                </div>
            </div>
        </div>
    </body>
</div>
</html>
