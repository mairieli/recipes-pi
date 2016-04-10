<%-- 
    Document   : CadastroReceitas
    Created on : 09/04/2016, 16:44:06
    Author     : xaaaandao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Receita - Receita da VovÃ³</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script>
          function mostrarTag(ID){
              document.getElementById(ID).style.display = "block";
          }
          function ocultarTag(ID){
              document.getElementById(ID).style.display = "none";
              $("#dive").hide("slow");
          }
        </script>    
    </head>
    <body>
        <h1>Cadastro de Receita</h1>
        <form class="form-horizontal" role="form" action="CadastroReceitas" method="POST">
            <!-- Título da receita -->
            <div class="form-group">
                <label class="control-label col-md-2" for="titulo">Título:</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="titulo" id="titulo">
                </div>
            </div>
            <!-- Quantidade Unidade Ingrediente -->
            <div class="form-group">
                <label class="control-label col-md-2" for="ingrediente">Ingrediente:</label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-1" for="ingrediente_completo1"></label>
                <div class="col-md-1">
                    <input type="text" class="form-control" name="quantidade1" id="quantidade1" placeholder="quantidade">
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control" name="unidade_medida1" id="unidade_medida1" placeholder="ex: colher de sopa, colher de chá">
                </div>
                <div class="col-md-5">
                    <input type="text" class="form-control" name="ingrediente1" id="ingrediente1" placeholder="ingrediente">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-1" for="ingrediente_completo2"></label>
                <div class="col-md-1">
                    <input type="text" class="form-control" name="quantidade2" id="quantidade2" placeholder="quantidade">
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control" name="unidade_medida2" id="unidade_medida2" placeholder="ex: colher de sopa, colher de chá">
                </div>
                <div class="col-md-5">
                    <input type="text" class="form-control" name="ingrediente2" id="ingrediente2" placeholder="ingrediente">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-1" for="ingrediente_completo3"></label>
                <div class="col-md-1">
                    <input type="text" class="form-control" name="quantidade3" id="quantidade3" placeholder="quantidade">
                </div>
                <div class="col-md-3">
                    <input type="text" class="form-control" name="unidade_medida3" id="unidade_medida3" placeholder="ex: colher de sopa, colher de chá">
                </div>
                <div class="col-md-5">
                    <input type="text" class="form-control" name="ingrediente3" id="ingrediente3" placeholder="ingrediente">
                </div>
            </div>
            <!-- Tempo de Preparo -->
            <div class="form-group">
                <label class="control-label col-md-2" for="tempopreparo">Tempo de Preparo:</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="tempo_preparo" id="tempo_preparo" placeholder="Horas ou Minutos">
                </div>
            </div>
            <!-- Rendimento -->
            <div class="form-group">
                <label class="control-label col-md-2" for="rendimento">Rendimento:</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="rendimento" id="rendimento" placeholder="Em Porções">
                </div>
            </div>
            <!-- Categoria da Receita -->
            <div class="form-group">
                <label class="control-label col-md-2" for="dificuldade">Categoria:</label>
                <div class="col-md-4">
                    <select class="form-control" name="categoria" id="categoria">
                      <option>Aves</option>
                      <option>Bebidas</option>
                      <option>Bolos E Tortas</option>
                      <option>Carnes</option>
                      <option>Doces E Sobremesas</option>
                      <option>Entradas</option>
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
                    <select class="form-control" name="dificuldade" id="dificuldade">
                      <option>Fácil</option>
                      <option>Médio</option>
                      <option>Díficil</option>
                    </select> 
                </div>
            </div>
            <!-- Modo de preparo -->
            <div class="form-group">
                <label class="control-label col-md-2" for="modo_preparo">Modo de preparo:</label>
            </div>
            <label class="control-label col-md-1" for="espaco_categoria"></label>
            <div class="form-group">
                <textarea class="control-label col-md-8" row="8" name="modo_preparo" id="modo_preparo"></textarea>
            </div>
            <!-- Botão -->        
            <div class="form-group">
                <button type="submit" class="btn-success col-lg-offset-9 btn-lg">Enviar receita!</button>
            </div>
        </form>
    </body>

