<%-- 
    Document   : CadastroReceitas
    Created on : 09/04/2016, 16:44:06
    Author     : xaaaandao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Receita - Receita da VovÃ³</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <h1>Cadastro de Receita</h1>
        <form class="form-horizontal" role="form">
            <!-- Título da receita -->
            <div class="form-group">
                <label class="control-label col-md-2" for="titulo">Título:</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="titulo">
                </div>
            </div>
            <!-- Quantidade Unidade Ingrediente -->
            <div class="form-group">
                <label class="control-label col-md-2" for="ingrediente">Ingrediente:</label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-1" for="ingredientecomp1"></label>
                <div class="col-md-1">
                    <input type="text" class="form-control" id="quantidade1" placeholder="quantidade">
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control" id="unidademedida1" placeholder="ex: colher de sopa, colher de chá">
                </div>
                <div class="col-md-5">
                    <input type="text" class="form-control" id="ingrediente1" placeholder="ingrediente">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-1" for="ingredientecomp2"></label>
                <div class="col-md-1">
                    <input type="text" class="form-control" id="quantidade2" placeholder="quantidade">
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control" id="unidademedida2" placeholder="ex: colher de sopa, colher de chá">
                </div>
                <div class="col-md-5">
                    <input type="text" class="form-control" id="ingrediente2" placeholder="ingrediente">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-1" for="ingredientecomp3"></label>
                <div class="col-md-1">
                    <input type="text" class="form-control" id="quantidade3" placeholder="quantidade">
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control" id="unidademedida3" placeholder="ex: colher de sopa, colher de chá">
                </div>
                <div class="col-md-5">
                    <input type="text" class="form-control" id="ingrediente3" placeholder="ingrediente">
                </div>
            </div>
            <!-- Tempo de Preparo -->
            <div class="form-group">
                <label class="control-label col-md-2" for="tempopreparo">Tempo de Preparo:</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="tempopreparo" placeholder="Horas ou Minutos">
                </div>
            </div>
            <!-- Rendimento -->
            <div class="form-group">
                <label class="control-label col-md-2" for="rendimento">Rendimento:</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="rendimento" placeholder="Em Porções">
                </div>
            </div>
            <!-- Categoria da Receita -->
            <div class="form-group">
                <label class="control-label col-md-2" for="dificuldade">Categoria:</label>
                <div class="col-md-4">
                    <select class="form-control" id="categoria">
                      <option>Aves</option>
                      <option>Bebidas</option>
                      <option>Bolos E Tortas</option>
                      <option>Carnes</option>
                      <option>Doces E Sobremesas</option>
                      <option>Lanches</option>
                      <option>Massas</option>
                      <option>Molhos E Acompanhamentos</option>
                      <option>Peixes E Frutos do Mar</option>
                      <option>Saladas</option>
                      <option>Sopas</option>
                    </select> 
                </div>
            </div>
            <!-- Dificuldade da Receita -->
            <div class="form-group">
                <label class="control-label col-md-2" for="dificuldade">Dificuldade:</label>
                <div class="col-md-4">
                    <select class="form-control" id="dificuldade">
                      <option>Fácil</option>
                      <option>Médio</option>
                      <option>Díficil</option>
                    </select> 
                </div>
            </div>
            <!-- Modo de preparo -->
            <div class="form-group">
                <label class="control-label col-md-2" for="modopreparo">Modo de preparo:</label>
            </div>
            <label class="control-label col-md-1" for="espacocategoria"></label>
            <div class="form-group">
                <textarea class="control-label col-md-8" row="8" id="modopreparo"></textarea>
            </div>
        </form>
        <!-- Botão -->
        <button type="submit" class="btn-success col-lg-offset-9 btn-lg">Enviar receita!</button>
    </body>
</html>