<%-- 
    Document   : VisualizacaoReceita
    Created on : 26/04/2016, 20:05:59
    Author     : xaaaandao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="scripts/jquery.min.js"></script>
        <title>Torta de bacon - Receita da Vovó</title>
    </head>
    <body>
        <form class="form-horizontal" role="form">
            <!-- Título -->
            <div class="form-group">
                <label class="control-label col-md-offset-1" for="titulo">
                    <h1>
                        Torta de bacon
                    </h1>
                </label>
            </div>      
            <!-- Foto -->
            <img src="torta.png" class="img-rounded col-md-offset-4" width="439" height="439">
            <!-- Rendimento-->
            <div class="form-group">
                <label class="control-label col-md-offset-1" for="tempo_preparo">
                    <h3>
                        Tempo de preparo:
                        <small>
                            1 hora.
                        </small>
                    </h3>
                </label>
            </div>            
            <!-- Rendimento-->
            <div class="form-group">
                <label class="control-label col-md-offset-1" for="rendimento">
                    <h3>
                        Rendimento:
                        <small>
                            4 porções.
                        </small>
                    </h3>
                </label>
            </div>
            <!-- Utensílios -->
            <div class="form-group">
                <label class="control-label col-md-offset-1" for="utensilios">
                    <h3>
                        Utensílios:
                    </h3>
                </label>
            </div>                 
            <div class="form-group">
                <label class="control-label col-md-offset-2">
                    <h5>
                        Espátula, Faca, Forma, Forno, Garfo.
                    </h5>
                </label> 
            </div>
            <!-- Ingredientes -->
            <div class="form-group">
                <label class="control-label col-md-offset-1" for="ingredientes">
                    <h3>
                        Ingredientes:
                    </h3>
                </label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="quantidade">
                    <h5>
                        500
                    </h5>
                </label>
                <label class="control-label col-md-offset-0" for="unidade">
                    <h5>
                        gramas
                    </h5>
                </label>           
                <label class="control-label col-md-offset-0" for="ingrediente">
                    <h5>
                        bacon em tiras
                    </h5>
                </label>           
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="quantidade">
                    <h5>
                        3
                    </h5>
                </label>
                <label class="control-label col-md-offset-0" for="unidade">
                    <h5>
                        unidades
                    </h5>
                </label>           
                <label class="control-label col-md-offset-0" for="ingrediente">
                    <h5>
                        batata média
                    </h5>
                </label>           
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="ingrediente">
                    <h5>
                        Sal
                    </h5>
                </label>           
                <label class="control-label col-md-offset-0" for="unidade">
                    <h5>
                        a gosto
                    </h5>
                </label>           
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="ingrediente">
                    <h5>
                        Pimenta do reino
                    </h5>
                </label>           
                <label class="control-label col-md-offset-0" for="unidade">
                    <h5>
                        a gosto
                    </h5>
                </label>           
            </div>
            <!-- Modo de preparo -->
            <div class="form-group">
                <label class="control-label col-md-offset-1" for="modo_preparo">
                    <h3>
                        Modo de preparo:
                    </h3>
                </label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="modo_preparo">
                    <h5>
                        1 - Forre a forma com o bacon, e deixe metade da tira do bacon para fora.
                    </h5>
                </label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="modo_preparo">
                    <h5>
                        2 - Preencha toda a forma.
                    </h5>
                </label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="modo_preparo">
                    <h5>
                        3 - Corte as batatas em rodelas.
                    </h5>
                </label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="modo_preparo">
                    <h5>
                        4 - Adicione as batatas cortadas na forma.
                    </h5>
                </label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="modo_preparo">
                    <h5>
                        5 - Adicione pimenta e sal a gosto, lembrando que o bacon já contém o sal.
                    </h5>
                </label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="modo_preparo">
                    <h5>
                        6 - Adicione o queijo cheedar ralado.
                    </h5>
                </label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="modo_preparo">
                    <h5>
                        7 - Repita o processo 4 a 6, quantas camadas você quiser.
                    </h5>
                </label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="modo_preparo">
                    <h5>
                        8 - Por fim, cubra com as partes da tiras que ficaram para fora da forma.
                    </h5>
                </label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="modo_preparo">
                    <h5>
                        9 - Coloque essa forma dentro de outra forma, pois irá escorrer gordura do bacon.
                    </h5>
                </label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-offset-2" for="modo_preparo">
                    <h5>
                        10 - Leve ao forno até o bacon ficar dourado.
                    </h5>
                </label>
            </div>
        </form>
    </body>
</html>
