<%-- 
    Document   : cadastrofuncionario
    Created on : 11/10/2020, 17:51:01
    Author     : melo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>AW-CadastroFuncionario</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <script type="text/javacript" src="resources/bootstrap/js/bootstrap.min.js"></script>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Cadastro de funcionário</h1>
        <form method="post" action= "FuncionarioServlet">
            <table>
                <tr>               
                    <th>Codigo:</th> 
                    <th><input type="text" name="codigo"/></th>                          
                </tr>
                <tr> 
                    <th>Nome:</th>
                    <th> <input type="text" name="nome"/></th>                    
                </tr>
<!--              
            <tr>
                    <th>Departamento:</th>
                    <th><input type="text" name="Departamento"/></th>
                </tr>
-->
                <tr>
                    <th>Departamento:</th>
                    <th> <select type="text" name="departamento"> 
                            <option value="almoxarifado">Almoxarifado</option> 
                            <option value="vendas">Vendas</option> 
                            <option value="departamento pessoal">Departamento Pessoal</option> 
                            <option value="departamento financeiro">Departamento Financeiro</option> 
                        </select>   
                    </th>
                </tr>
                <th><input type="submit" value="cadastrar"/></th>
                </tr>               
            </table>
        </form>    
    </body>
</html>
