<%-- 
    Document   : cadastrofuncionario
    Created on : 11/10/2020, 17:51:01
    Author     : melo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AW-CadastroFuncionario</title>
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
                <tr>
                    <th>Departamento:</th>
                    <th><input type="text" name="Departamento"/></th>
                </tr>
                <th><input type="submit" value="cadastrar"/></th>
                </tr>               
            </table>
        </form>    
    </body>
</html>
