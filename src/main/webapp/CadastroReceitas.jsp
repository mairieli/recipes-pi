<%-- 
    Document   : CadastroReceitas
    Created on : 09/04/2016, 16:44:06
    Author     : xaaaandao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastro de Receita - Receita da Vovó</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="jquery.min.js"></script>
    <script src="cadastroreceitas.js"></script>
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
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Batedeira">Batedeira</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Bandeja">Bandeja</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Cafeteira">Cafeteira</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Chaleira">Chaleira</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Chapa">Chapa</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Concha">Concha</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Copo">Copo</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Colher de cafe">Colher de café</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Colher de cha">Colher de chá</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Colher de sopa">Colher de sopa</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Descascador de legumes"></label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Escorredor de macarrao">Escorredor de macarrão</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Escumadeira">Escumadeira</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Espatula">Espátula</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Faca">Faca</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Forma">Forma</label>                
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Forno">Forno</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Fogao">Fogão</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Fouet">Fouet</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Freezer">Freezer</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Frigideira">Frigideira</label>                
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Funil">Funil</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Garfo">Garfo</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Grill">Grill</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Liquidificador">Liquidificador</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Micro-ondas">Micro-ondas</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Mixer">Mixer</label>
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Prato">Prato</label>                
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Panela">Panela</label>                
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Panela de Pressao">Panela de Pressão</label>                
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Peneira">Peneira</label>                
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Ralador">Ralador</label>                
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Sanduicheira">Sanduicheira</label>                
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Taca">Taça</label>                
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Tabua">Tábua</label>                
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Torradeira">Torradeira</label>                
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Tigela">Tigela</label>                
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Triturador">Triturador</label>                
        <label class="checkbox-inline "><input type="checkbox" name="tag" value="Xicara">Xícara</label>
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

