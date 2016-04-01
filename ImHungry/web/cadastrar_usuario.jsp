<%-- 
    Document   : search
    Created on : 12/03/2014, 14:01:52
    Author     : josimar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="/head.jsp?title=Cadastre-se!"/>

        <script language="javascript">

            function carregando(div_id, message) {
                document.getElementById(div_id).innerHTML = "<h4>" + message + "<img src='/loading.gif'/></h4>";
            }


        </script>
    </head>
    <body>
        <c:import url="/menu.jsp?menu=Cadastre-se!"/>
        <div class="container-fluid">
            <div class="row-fluid">

                <div class="span9">
                    <div class="content"> 
                        <br>
                        <h3>Cadastre-se!</h3>
                        <c:if test="${message!=null}">
                            <h4 class="alert-success">{message}</h4>
                        </c:if>
                        <c:if test="${message_error!=null}">
                            <h4 class="alert-danger"  style="padding: 4px;"> <i class="icon-warning-sign"></i> <c:out value="${message_error}" /></h4>
                        </c:if>
                        <form class="form-horizontal" action="<c:url value="UsuarioManager"/>" method="post" accept-charset="ISO-8859-1" onsubmit="carregando(this, 'carregando')">
                            <div class="control-group">
                                <label class="control-label" for="login">Nome <i class="icon-user"></i></label>
                                <div class="controls">
                                    <input type="text" id="login" name="nome" value="${nome}" placeholder="Nome">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="email">Email <i></i></label>
                                <div class="controls">
                                    <input type="email" id="email" required name="email" value="${email}" placeholder="exemplo@exemplo.com">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputPassword">Senha <i class="icon-lock"></i></label>
                                <div class="controls">
                                    <input type="password" id="inputPassword" name="senha"  placeholder="******">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputPassword">Repita Senha <i class="icon-lock"></i></label>
                                <div class="controls">
                                    <input type="password" id="inputPassword" name="senha2"  placeholder="******">
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <input type="hidden" name="action" value="cadastro"/>
                                    <button type="submit" class="btn"><i class="icon-ok"></i>Cadastrar</button>
                                    <a href="index.jsp" class="btn btn-warning">Cancelar</a>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
