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
                <c:if  test="${UsuarioLogado!=null}">
                    Logado Como: <a href="#" class="navbar-link"></a>  
                    <strong style="color: #FFFBEF">${UsuarioLogado.nome}</strong> - 
                    <a href="../UsuarioManager" title="Sair" ><i class="icon-off icon-white"> </i>  Sair</a> 
                </c:if>


            </p>   
            <%--<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>--%>
            <a class="brand" href="#" title="I'm Hungry">I'm Hungry/${param.menu}</a>

            <ul class="nav">
                <c:if  test="${UsuarioLogado !=null}">


                    <li <c:if test="${param.menu=='Inicio'}">class="active"</c:if>><a href="<c:url value="/index.jsp"/>"><i class="icon-home icon-white"> </i> Inicio</a></li>
                    </c:if>
            </ul>   



            <ul class="nav">                  
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        Menu
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="active" ><a href="#">submenu 1</a></li>
                        <li ><a href="#">submenu 2</a></li>
                       
                        </ul>
                    </li>
                   
            </ul> 




        </div>
    </div>
</div>
<br/>
<br/>
