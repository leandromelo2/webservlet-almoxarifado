<%-- 
    Document   : cadastroproduto
    Created on : 22/09/2020, 22:46:53
    Author     : leandro melo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AlmoxarifadoWeb</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javacript" src="resources/bootstrap/js/bootstrap.min.js"></script>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
<!--        <a href="index.html"> Página Inicial</a><br/>
        <a href="produtos.jsp" id="link"> Produtos Cadastrados </a> <br/> 
        
        <h4>Cadastro de produtos</h4>
-->
        <form method="post" action= "ProdutoServletNew">
            <table>
                <tr>               
                    <th>Codigo:</th> 
                    <th><input type="text" name="codigo"/></th>                          
                </tr>
                <tr> 
                    <th>Nome:</th>
                    <th> <input type="text" name="nome"/></th>                    
                </tr>
                <tr>
                    <th>Marca:</th>
                    <th><input type="text" name="marca"/></th>
                </tr>
                <tr>
                    <th>Categoria:</th>
                    <th><input type="text" name="categoria"  maxlength="50"/></th>                    
                </tr>
                <tr>
                    <th>Descrição:</th>
                    <th><textarea name="descricao" rows="4" cols="30" maxlength="50"></textarea></th>
                </tr>
                <tr>
                    <th><input type="submit" class="btn btn-primary" value="cadastrar"/></th>
                </tr>               
            </table>
        </form>    
    </body>
</html>
