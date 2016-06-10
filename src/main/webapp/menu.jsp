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
            <a class="navbar-brand" href="<c:url value="/index.jsp"/>"><img src="<c:url value="/img/recipe_search.png"/>" style="float: left"/>Recipes</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li <c:if test="${param.menu eq 'home'}"> class="active" </c:if>><a href="<c:url value="/index.jsp"/>"><span class="glyphicon glyphicon-home" aria-hidden="true"> </span> Início <span class="sr-only">(current)</span></a></li>
                    <c:if test="${usuarioLogado != null}">
                    <li <c:if test="${param.menu eq 'nova'}"> class="active" </c:if>><a href="<c:url value="/CadastroReceitas.jsp"/>"><span class="glyphicon glyphicon-plus" aria-hidden="true"> </span> Nova Receita</a></li>
                    <li  <c:if test="${param.menu eq 'pesquisa'}"> class="active" </c:if>><a href="<c:url value="/ConsultarReceitas.jsp"/>"><span class="glyphicon glyphicon-search" aria-hidden="true"> </span> Pesquisar Receita</a></li>
                    <c:if test="${usuarioLogado.admin}" >  <li  <c:if test="${param.menu eq 'aprovacao'}"> class="active" </c:if>><a href="<c:url value="/admin/AprovacaoIngrediente.jsp"/>"><span class="glyphicon glyphicon-stats" aria-hidden="true"> </span> Ingredientes Pendentes</a></li> </c:if>   
                    <li  <c:if test="${param.menu eq 'sugerir'}"> class="active" </c:if>><a data-toggle="modal" data-target="#modalSugerirIngrediente" style="cursor: pointer"><span class="glyphicon glyphicon-plus" aria-hidden="true"> </span> Sugerir Ingrediente</a></li>
                    </c:if>
            </ul
>            <c:if test="${usuarioLogado != null}">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <p class="navbar-text">
                            Bem-vindo ${usuarioLogado.nome}!
                        </p>
                    </li>
                    <li>
                        <a href="<c:url value="/login"/>">
                            Logout
                        </a>
                    </li>
                </ul>
            </c:if>
        </div>
    </div>
</nav>  
<div class="modal fade" id="modalSugerirIngrediente" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Gostaria de sugerir um novo Ingrediente?</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="" method="post">
                    <div class="form-group">
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="ingrediente" id="ingrediente" placeholder="Ingrediente" required>
                        </div>
                        <button type="button" class="btn btn-success">Sugerir!</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>

