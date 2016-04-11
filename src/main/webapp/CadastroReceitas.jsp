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
        <script type="text/javascript" language="javascript">
          function mostrarTag(ID){
              document.getElementById(ID).style.display = "block";
          }
          function ocultarTag(ID){
              document.getElementById(ID).style.display = "none";
              $("#dive").hide("slow");
          }
          function validaForm (){
                i = 0;
                if(document.getElementById("titulo").value == ""){
                    document.getElementById("alert1").className = "control-label col-md-2 alertRed ";
                    document.getElementById("titulo").focus();
                    i = 1;
                }else{
                   document.getElementById("alert1").className = "control-label col-md-2 "; 
                }
                
                if(document.getElementById("quantidade1").value == "") {
                    document.getElementById("alert2").className = "control-label col-md-2 alertRed ";
                    document.getElementById("quantidade1").focus();
                    i = 1;
                }else{
                   document.getElementById("alert2").className = "control-label col-md-2 "; 
                }
                
                if(document.getElementById("unidade_medida1").value == "") {
                    document.getElementById("alert2").className = "control-label col-md-2 alertRed ";
                    document.getElementById("unidade_medida1").focus(); 
                    i = 1;
                }else{
                   document.getElementById("alert2").className = "control-label col-md-2 "; 
                }
                if(document.getElementById("ingrediente1").value == "") {
                   document.getElementById("alert2").className = "control-label col-md-2 alertRed ";
                    document.getElementById("ingrediente1").focus();
                    i = 1; 
                }else{
                   document.getElementById("alert2").className = "control-label col-md-2 "; 
                }
                if(document.getElementById("quantidade2").value == "") {
                    document.getElementById("alert2").className = "control-label col-md-2 alertRed ";
                    document.getElementById("quantidade2").focus(); 
                    i = 1;
                }else{
                   document.getElementById("alert2").className = "control-label col-md-2 "; 
                }
                if(document.getElementById("unidade_medida2").value == "") {
                    document.getElementById("alert2").className = "control-label col-md-2 alertRed ";
                    document.getElementById("unidade_medida2").focus();
                    i = 1; 
                }else{
                   document.getElementById("alert2").className = "control-label col-md-2 "; 
                }
                if(document.getElementById("ingrediente2").value == "") {
                    document.getElementById("alert2").className = "control-label col-md-2 alertRed ";
                    document.getElementById("ingrediente2").focus();
                    i = 1;  
                }else{
                   document.getElementById("alert2").className = "control-label col-md-2 "; 
                }
                if(document.getElementById("quantidade3").value == "") {
                    document.getElementById("alert2").className = "control-label col-md-2 alertRed ";
                    document.getElementById("quantidade3").focus(); 
                    i = 1;   
                }else{
                   document.getElementById("alert2").className = "control-label col-md-2 "; 
                }
                if(document.getElementById("unidade_medida3").value == "") {
                    document.getElementById("alert2").className = "control-label col-md-2 alertRed ";
                    document.getElementById("unidade_medida3").focus();
                    i = 1; 
                }else{
                   document.getElementById("alert2").className = "control-label col-md-2 "; 
                }
                if(document.getElementById("ingrediente3").value == "") {
                    document.getElementById("alert2").className = "control-label col-md-2 alertRed ";
                    document.getElementById("ingrediente3").focus();
                    i = 1; 
                }else{
                   document.getElementById("alert2").className = "control-label col-md-2 "; 
                }
                if(document.getElementById("rendimento").value == "") {
                    document.getElementById("alert3").className = "control-label col-md-2 alertRed ";
                    document.getElementById("rendimento").focus(); 
                    i = 1;
                }else{
                   document.getElementById("alert3").className = "control-label col-md-2 "; 
                }
                if(document.getElementById("categoria").value == "Nenhum") {
                    document.getElementById("alert4").className = "control-label col-md-2 alertRed ";
                    document.getElementById("categoria").focus();
                    i = 1;   
                }else{
                   document.getElementById("alert4").className = "control-label col-md-2 "; 
                }
                if(document.getElementById("dificuldade").value == "Nenhuma") {
                    document.getElementById("alert5").className = "control-label col-md-2 alertRed ";
                    document.getElementById("dificuldade").focus(); 
                    i = 1;
                }else{
                   document.getElementById("alert5").className = "control-label col-md-2 "; 
                }
                if(document.getElementById("modo_preparo").value == "") {
                    document.getElementById("alert6").className = "control-label col-md-2 alertRed ";
                    document.getElementById("modo_preparo").focus(); 
                    i = 1;
                }else{
                   document.getElementById("alert6").className = "control-label col-md-2 "; 
                }
                if(i == 1){    
                    return false
                }
           }
        </script>    
    </head>
    <body>
        <h1>Cadastro de Receita</h1>
        <form class="form-horizontal" role="form" action="CadastroReceitas" method="post" onsubmit="return validaForm(this)">
            <!-- Título da receita -->
            <div class="form-group">
                <label class="control-label col-md-2" for="campos">(*)Campos Obrigatórios</label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2" id="alert1" for="titulo">Título*:</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="titulo" id="titulo">
                </div>
            </div>
            <!-- Quantidade Unidade Ingrediente -->
            <div class="form-group">
                <label class="control-label col-md-2" id="alert2" for="ingrediente">Ingrediente*:</label>
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
                <label class="control-label col-md-2" id="alert3" for="rendimento">Rendimento*:</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="rendimento" id="rendimento" placeholder="Em Porções">
                </div>
            </div>
            <!-- Categoria da Receita -->
            <div class="form-group">
                <label class="control-label col-md-2" id="alert4" for="dificuldade">Categoria*:</label>
                <div class="col-md-4">
                    <select class="form-control" name="categoria" id="categoria">
                      <option>Nenhum</option> 
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
                <label class="control-label col-md-2" id="alert5" for="dificuldade">Dificuldade*:</label>
                <div class="col-md-4">
                    <select class="form-control" name="dificuldade" id="dificuldade">
                      <option>Nenhuma</option>
                      <option>Fácil</option>
                      <option>Médio</option>
                      <option>Díficil</option>
                    </select> 
                </div>
            </div>
            <!-- Modo de preparo -->
            <div class="form-group">
                <label class="control-label col-md-2" id="alert6" for="modo_preparo">Modo de preparo*:</label>
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

