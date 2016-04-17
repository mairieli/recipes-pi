<%-- 
    Document   : CadastroReceitas
    Created on : 09/04/2016, 16:44:06
    Author     : xaaaandao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastro de Receita</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="jquery.min.js"></script>
    <script src="CadastroReceitas.js"></script>
    <style>
        body {
            overflow-x: hidden;
        }
    </style>
</head>
<body>
    <h1>Cadastro de Receita</h1>
    <form class="form-horizontal" role="form" action="CadastroReceitas" method="post" onsubmit="cadRealizado()">
        <!-- Título da receita -->
        
        <div class="form-group"  id="alert1">
            <label class="control-label col-md-2" for="titulo">Título*:</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="titulo" id="titulo">
            </div>
        </div>
        <!-- Quantidade Unidade Ingrediente -->
        <div class="form-group">
            <label class="control-label col-md-2" for="ingrediente">Ingrediente*:</label>
            <div class="col-md-3">
                <button class="btn btn-success" id="add" type="button">Adicionar</button>
            </div>
            <label class="col-md-8"></label>
            <div id="items">
                <div class="form-group" id="alert2">
                    <div class="col-md-12">
                        <label class="col-md-2"></label>
                        <div class="col-md-1">
                            <input type="text" class="form-control" name="quantidade0" id="quantidade0" placeholder="quantidade">
                        </div>
                        <div class="col-md-3">
                            <input type="text" class="form-control" name="unidade_medida0" id="unidade_medida0" placeholder="ex: colher de sopa, colher de chá">
                        </div>
                        <div class="col-md-5">
                            <input type="text" class="form-control" name="ingrediente0" id="ingrediente0" placeholder="ingrediente">
                        </div>
                    </div>
                </div>
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
        <div class="form-group" id="alert3">
            <label class="control-label col-md-2" for="rendimento">Rendimento*:</label>
            <div class="col-md-4">
                <input type="text" class="form-control" name="rendimento" id="rendimento" placeholder="Em Porções">
            </div>
        </div>
        <!-- Categoria da Receita -->
        <div class="form-group" id="alert4">
            <label class="control-label col-md-2" for="dificuldade">Categoria*:</label>
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
        <div class="form-group" id="alert5">
            <label class="control-label col-md-2" for="dificuldade">Dificuldade*:</label>
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
        <div class="form-group" id="alert6">
            <label class="control-label col-md-2" for="modo_preparo">Modo de preparo*:</label>
            <div class="col-md-8">
                <textarea class="form-control" row="10" name="modo_preparo" id="modo_preparo"></textarea>
            </div>
        </div>        
    </div>
    <!-- Adicionar TAG's -->
    <div class="form-group">
        <button type="button" class="btn btn-info col-lg-offset-2 btn-lg" onclick="mostrarTAG('div_tag1', 'div_tag2', 'div_tag3');";>TAG</button>
    </div>
    <div class="form-group col-md-10" id="div_tag1" style="display:none">
        <label class="col-md-1"></label>
        <label class="checkbox-inline "><input type="checkbox" value="">Batedeira</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Bandeja</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Cafeteira</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Chaleira</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Chapa</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Concha</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Copo</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Colher de café</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Colher de chá</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Colher de sopa</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Descascador de legumes</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Escorredor de macarrão</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Escumadeira</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Espá¡tula</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Faca</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Forma</label>                
        <label class="checkbox-inline "><input type="checkbox" value="">Forno</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Fogão</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Fouet</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Freezer</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Frigideira</label>                
        <label class="checkbox-inline "><input type="checkbox" value="">Funil</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Garfo</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Grill</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Liquidificador</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Micro-ondas</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Mixer</label>
        <label class="checkbox-inline "><input type="checkbox" value="">Prato</label>                
        <label class="checkbox-inline "><input type="checkbox" value="">Panela</label>                
        <label class="checkbox-inline "><input type="checkbox" value="">Panela de Pressão</label>                
        <label class="checkbox-inline "><input type="checkbox" value="">Peneira</label>                
        <label class="checkbox-inline "><input type="checkbox" value="">Ralador</label>                
        <label class="checkbox-inline "><input type="checkbox" value="">Sanduicheira</label>                
        <label class="checkbox-inline "><input type="checkbox" value="">Taça</label>                
        <label class="checkbox-inline "><input type="checkbox" value="">Tábua</label>                
        <label class="checkbox-inline "><input type="checkbox" value="">Torradeira</label>                
        <label class="checkbox-inline "><input type="checkbox" value="">Tigela</label>                
        <label class="checkbox-inline "><input type="checkbox" value="">Triturador</label>                
        <label class="checkbox-inline "><input type="checkbox" value="">Xícara</label>                
    </div>
    <!-- Botão -->        
    <div class="form-group">
        <button type="button" onclick="validaForm(this)" class="btn btn-success col-lg-offset-9 btn-lg">Enviar receita!</button>
    </div>
    <div class="modal" tabindex="-1" role="dialog" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" onclick="fecharModal()" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Confirmação de cadastro</h4>
                </div>
                <div class="modal-body">
                    <p>Você deseja cadastrar esta receita?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="fecharModal()">Não</button>
                    <button type="submit" class="btn btn-primary">Sim</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</form>
</body>

