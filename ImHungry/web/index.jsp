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
        <c:import url="head.jsp?title=Faça seu Login!"/>

        <script language="javascript">

            function carregando(div_id, message) {
                document.getElementById(div_id).innerHTML = "<h4>" + message + "<img src='/loading.gif'/></h4>";
            }


        </script>
    </head>
    <body>
        <c:import url="menu.jsp?menu=login"/>
        <div class="container-fluid">
            <div class="row-fluid">

                <div class="span9">
                    <div class="content"> 
                        <br>
                        <h4>Faça seu login.</h4>
                        <c:if test="${message!=null}">
                            <h4 class="alert-success"> <c:out value="${message}" /></h4>
                            <c:remove var="message"/>
                        </c:if>
                        <c:if test="${message_error!=null}">
                            <h4 class="alert-danger"  style="padding: 4px;"> <i class="icon-warning-sign"></i> <c:out value="${message_error}" /></h4>
                            <c:remove var="message_error"/>
                        </c:if>
                        <form class="form-horizontal" action="UsuarioManager" method="post" accept-charset="UTF-8" onsubmit="carregando(this, 'carregando')">


                            <div class="control-group">
                                <label class="control-label" for="email">Email <i class="icon-user"></i></label>
                                <div class="controls">
                                    <input type="email" id="login"required name="email" value="${email}" placeholder="exemplo@exemplo.com">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="inputPassword">Senha <i class="icon-lock"></i></label>
                                <div class="controls">
                                    <input type="password" id="inputPassword" name="senha" required placeholder="Senha">
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <input type="hidden" name="action" value="login"/>
                                    <button type="submit" class="btn"><i class="icon-ok"></i> Logar</button>
                                </div>
                            </div>

                        </form>
                        <hr/>
                        <h2>Ainda não tem uma conta?</h2>
                        <a href="cadastrar_usuario.jsp"  class="btn btn-large btn-primary">Cadastre-se!</a>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>

        <c:import url="rodape.jsp"/>
    </body>
</html>
