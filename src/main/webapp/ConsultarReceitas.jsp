<%-- 
    Document   : ConsultarReceitas
    Created on : 26/04/2016, 14:48:53
    Author     : Leonardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Receitas</title>
    </head>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="jquery.min.js"></script>
    <script src="cadastroreceitas.js"></script>
    <body>
    <form class="form-horizontal" role="form" action="ConsultaReceitas" method="post">
        <div class="form-group"  id="alert1" style="float: left; width: 100%">
              <h2 class="control-label col-md-2" for="titulo" style="float: left;">Pesquisa:</h2>
              <input type="text" class="form-control" name="pesquisa" id="pesquisa" style="margin-left: 20px; margin-top: 24px; width: 500px; float: left"> 
              <button type="button" class="btn btn-default" style="float: left; margin-top: 24px; margin-left: 5px;">pesquisar</button>
        </div>
    </form>

      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider" style="width: 100%; float: left">

      <div class="row featurette" style="width: 100%; float: left; margin-left: 226px;">
        <div class="col-md-5" style="float: left; width: 120px; height: 120px; padding-left: 0px">
            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="img/laranja.jpg" style="width: 100px; height: 100px; background-repeat: no-repeat; background-size: 100%; background-position: center center">
        </div>
        <h2 class="featurette-heading" style="margin-top: 0px; width: 50%; float: left">Bolo de Laranja</h2>
        <div style="float: left; width: 50%">Rendimento: 6 porções</div>
        <div style="float: left; width: 50%; margin-top: 5px;">Tempo de preparo: 1h</div>
        <div style="float: left; width: 50%; margin-top: 5px;"><a class="btn btn-default" href="#" role="button">Ler mais »</a></div>
      </div>

      <hr class="featurette-divider" style="width: 100%; float: left">
      
      <div class="row featurette" style="width: 100%; float: left; margin-left: 226px;">
        <div class="col-md-5" style="float: left; width: 120px; height: 120px; padding-left: 0px">
            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="img/doce.jpg" style="width: 100px; height: 100px; background-repeat: no-repeat; background-size: 100%; background-position: center center">
        </div>
        <h2 class="featurette-heading" style="margin-top: 0px; width: 50%; float: left">Doce de Leite</h2>
        <div style="float: left; width: 50%">Rendimento: 3 porções</div>
        <div style="float: left; width: 50%; margin-top: 5px;">Tempo de preparo: 50min</div>
        <div style="float: left; width: 50%; margin-top: 5px;"><a class="btn btn-default" href="#" role="button">Ler mais »</a></div>
      </div>

      <hr class="featurette-divider" style="width: 100%; float: left">
      
      <div class="row featurette" style="width: 100%; float: left; margin-left: 226px;">
        <div class="col-md-5" style="float: left; width: 120px; height: 120px; padding-left: 0px">
            <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="img/suco.jpg" style="width: 100px; height: 100px; background-repeat: no-repeat; background-size: 100%; background-position: center center">
        </div>
        <h2 class="featurette-heading" style="margin-top: 0px; width: 50%; float: left">Suco de Uva</h2>
        <div style="float: left; width: 50%">Rendimento: 2 porções</div>
        <div style="float: left; width: 50%; margin-top: 5px;">Tempo de preparo: 10min</div>
        <div style="float: left; width: 50%; margin-top: 5px;"><a class="btn btn-default" href="#" role="button">Ler mais »</a></div>
      </div>

      <hr class="featurette-divider" style="width: 100%; float: left">

      <!-- /END THE FEATURETTES -->



    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  

<svg style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;" preserveAspectRatio="none" viewBox="0 0 500 500" height="500" width="500"><defs><style type="text/css"></style></defs><text style="font-weight:bold;font-size:25pt;font-family:Arial, Helvetica, Open Sans, sans-serif" y="25" x="0">500x500</text></svg></body>
</html>
