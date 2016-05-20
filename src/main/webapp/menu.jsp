<%-- 
    Document   : menu
    Created on : 28/04/2016, 01:49:04
    Author     : josimar
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
        <a class="navbar-brand" href="index.jsp"><img src="img/recipe_search.png" style="float: left"/>Recipes</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li <c:if test="${param.menu eq 'home'}"> class="active" </c:if>><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"> </span> Início <span class="sr-only">(current)</span></a></li>
          <li <c:if test="${param.menu eq 'nova'}"> class="active" </c:if>><a href="CadastroReceitas.jsp"><span class="glyphicon glyphicon-plus" aria-hidden="true"> </span> Nova Receita</a></li>
          <li  <c:if test="${param.menu eq 'pesquisa'}"> class="active" </c:if>><a href="ConsultarReceitas.jsp"><span class="glyphicon glyphicon-search" aria-hidden="true"> </span> Pesquisar Receita</a></li>
          <li  <c:if test="${param.menu eq 'pesquisa'}"> class="active" </c:if>><a href="admin/AprovacaoIngrediente.jsp"><span class="glyphicon glyphicon-stats" aria-hidden="true"> </span> Ingredientes Pendentes</a></li>
        <!--<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>-->
      </ul>
      <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="#">
                    Logout
                </a>
            </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>