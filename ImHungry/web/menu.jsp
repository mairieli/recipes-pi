<%-- 
    Document   : menu
    Created on : 29/10/2013, 15:52:36
    Author     : josimar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
             <p class="navbar-text pull-right">
                         <a href="#" class="navbar-link"></a>  
                        <strong style="color: #FFFBEF"> I'm Hungry  </strong> - 
                    </p>   
            <%--<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>--%>
            <a class="brand" href="#" title="I'm Hungry">I'm Hungry/${param.menu}</a>
            <ul class="nav">
                <li><a href="cadastrar_usuario.jsp">Cadastre-se</a></li>
            </ul>   
           




        </div>
    </div>
</div>
<br/>
<br/>
