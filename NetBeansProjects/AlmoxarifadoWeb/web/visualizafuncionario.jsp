<%-- 
    Document   : visualizafuncionario
    Created on : 15/10/2020, 16:58:25
    Author     : melo
--%>

<%@page import="br.recife.edu.ifpe.model.classes.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizar Funcionario</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javacript" src="resources/bootstrap/js/bootstrap.min.js"></script>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h4>Detalhes do funcionario</h4> </br>
        
        <%
            Funcionario funcionario = (Funcionario)request.getAttribute("funcionario");
            if (funcionario != null) {
        %>
        
        <table style="width:400px"  >            
            <tr style="border:1px solid black">
                <th>Código:</th><td><%= funcionario.getCodigo()%></td>
            </tr>
            <tr style="border:1px solid black">
                <th>Nome:</th><td><%= funcionario.getNome()%></td>
            </tr>
            <tr style="border:1px solid black">
                <th>Marca:</th><td><%= funcionario.getDepartamento()%></td>
            </tr>           
        </table>
            
        <% }%>        
    </body>
</html>
