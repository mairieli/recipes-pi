<%-- 
    Document   : PerfilUsuario
    Created on : 14/06/2016, 20:30:01
    Author     : Leonardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="head.jsp"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <script src="scripts/jquery.min.js"></script>
        <script src="scripts/jquery-ui.js"></script>
        <script src="scripts/autocompleter.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="scripts/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/jquery-ui.min.js"></script>
        <script src="bootstrap/js/star-rating.js" type="text/javascript"></script>
        <link rel="stylesheet" href="bootstrap/css/star-rating.css" media="all" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/theme-krajee-fa.css" media="all" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/theme-krajee-svg.css" media="all" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/theme-krajee-uni.css" media="all" type="text/css"/>
        <title>Perfil</title>
    </head>
    <body>
        <c:import url="menu.jsp?menu=nova"/>
        <div class="container">
            <div class="col-md-6" style="background-color: rgb(119, 119, 119); color: rgb(243, 237, 237); width: 30%">
                <h1>Perfil de Usuário</h1>
                <div class="col-md-5" style="width: 100%">
                    <label class="col-lg-9" for="nome" style="width: 100%; font-size: 20px; float: left">Nome: Leonardo Corrá</label>
                    <label class="control-label col-md-2" for="email"style="width: 100%; font-size: 20px; float: left">Email: leonardo@email.com</label>
                </div>
            </div>
            <div class="col-md-6" style="width: 35%; float: left">
                <h1 style="text-align: center;">Receitas cadastradas</h1>
                <div class="col-md-12 col-md-offset-1" style="margin-left: 0px; float: left;"> 
                    <hr>
                    <div class="col-md-4" style="float: left; width: 100px; height: 100px; padding-left: 0px">
                        <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="img/suco_uva.jpg" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                    </div>
                    <div class="col-md-8">                    
                        <h3 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">Suco de uva</h3>
                        <div class="col-md-12" style="float: left">                
                            <input id="rating_hide" name="rating_hide" disabled="" class="rating" value="" data-size="xs" data-show-caption="false" readonly>
                            <div style="float: left; width: 100%;">Rendimento: 5 porções</div>
                            <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: 10 Minutos</div>
                            <div style="float: left; width: 100%; margin-top: 5px;">Categoria: Bebidas</div>
                            <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: Media</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-md-offset-1" style="margin-left: 0px; float: left;"> 
                    <hr>
                    <div class="col-md-4" style="float: left; width: 100px; height: 100px; padding-left: 0px">
                        <img data-holder-rendered="true" class="featurette-image img-responsive center-block" src="img/bolo_fuba.jpg" style="background-repeat: no-repeat; background-size: 100%; background-position: center center">
                    </div>
                    <div class="col-md-8">                    
                        <h3 class="featurette-heading" style="margin-top: 0px; float: left; margin-left: 12px;">Bolo de fubá</h3>
                        <div class="col-md-12" style="float: left">                
                            <input id="rating_hide" name="rating_hide" disabled="" class="rating" value="" data-size="xs" data-show-caption="false" readonly>
                            <div style="float: left; width: 100%;">Rendimento: 10 porções</div>
                            <div style="float: left; width: 100%; margin-top: 5px;">Tempo de preparo: 60 Minutos</div>
                            <div style="float: left; width: 100%; margin-top: 5px;">Categoria: Doces</div>
                            <div style="float: left; width: 100%; margin-top: 5px;">Dificuldade: Media</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6" style="width: 35%; float: left">
                <h1 style="text-align: center">Comentários feitos</h1>
                <div class="col-md-12 col-md-offset-1" style="margin-left: 0px; float: left;">
                    <div class="col-md-12 col-md-offset-1">
                        <div class="col-md-10"> 
                            <hr>
                            <h4><label class="label label-primary">comentado em receita suco</label>
                                <small>02:02:03 02-03-2016</small></h4>
                        </div>
                        <span class="text-justify col-md-10">
                            Lição 1: “Se te oferecerem um lugar em um foguete, não pergunte
                            onde o assento fica”. De acordo com a COO do Facebook, este conselho
                            foi dado por Eric Schimidt, então CEO do Google, quando ela estava
                            em dúvida se aceitava ou não a proposta de trabalhar na empresa.
                        </span>
                    </div>

                    <!--Comentario 3-->
                    <div class="col-md-12 col-md-offset-1">
                        <div class="col-md-10"> 
                            <hr>
                            <h4><label class="label label-primary">Comentado em receita bolo</label>
                                <small>10:23:54 02-05-2016</small></h4>
                        </div>
                        <span class="text-justify col-md-10">
                            "Flashear" um modem (do inglês "Flash") no seu Android é fácil,
                            por meio de um software chamado Odin. Como com qualquer outro
                            procedimento para modificar seu telefone, trata-se de um procedimento
                            arriscado, ficando sob sua inteira responsabilidade. Assim,
                            leia as instruções com cuidado.
                            Baixe um modem que você quer flashear em seu telefone. Um "modem",
                            neste caso, é um arquivo específico para seu telefone, definido
                            por região. Procure por uma lista de modens para seu telefone e
                            as companhias de sua região. Você pode buscar no Google por
                            “[seu modelo de telefone] [sua companhia e sua região] e os termos
                            "modem" e "download”.
                            Sites como o XDA Developers ou fóruns conhecidos sobre Android são fontes recomendáveis.
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
