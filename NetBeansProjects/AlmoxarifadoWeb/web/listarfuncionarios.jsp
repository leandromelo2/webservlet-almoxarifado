<%-- 
    Document   : visualizarfuncionarios
    Created on : 12/10/2020, 12:01:31
    Author     : melo
--%>

<%@page import="br.recife.edu.ifpe.model.repositorios.RepositorioFuncionario"%>
<%@page import="br.recife.edu.ifpe.model.classes.Funcionario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizar Funcionários</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javacript" src="resources/bootstrap/js/bootstrap.min.js"></script>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        <a href="index.html" id="link"> Página Inicial </a> <br/>
        <a href="cadastrofuncionario.jsp" id="link"> Cadastro de funcionário</a> <br/>
        <h3>Visualização de funcionários cadastrados</h3>
    <%
        List<Funcionario> funcionarios = RepositorioFuncionario.getCurrentInstance().readAll();
    %>
    
    <table class="border" >
        <tr>
            <th style="width:100px"class="d-block p-2 bg-primary text-white">codigo</th> <th style="width:400px " class="p-2 bg-primary text-white">nome</th> <th class="p-2 bg-primary text-white"style="width:200px" >departamento</th>  

        </tr>
       <%
       for (Funcionario f: funcionarios){
       
       %>
       <tr>
           <td class="border"><%= f.getCodigo() %></td>
           <td class="border"><%= f.getNome()%></td>
           <td class="border"><%= f.getDepartamento()%></td>
       </tr>
       <%
       }
       %>
        
        
    </table>
    
    
    
    
    </body>
</html>
