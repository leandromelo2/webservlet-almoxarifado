<%-- 
    Document   : funcionarios
    Created on : 09/10/2020, 22:05:51
    Author     : melo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Funcionários Cadastrados</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javacript" src="resources/bootstrap/js/bootstrap.min.js"></script>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <a href="index.html" id="link"> Página Inicial </a> <br/>
        <a href="cadastrofuncionario.jsp" id="link"> Cadastro de funcionário</a> <br/>
        <a href="listarfuncionarios.jsp" id="link"> Lista de funcionarios cadastrados</a>
        <h3>Funcionário cadastrado!</h3>
        <%
            String msgfcadastrado = (String)session.getAttribute("msgfcadastrado");
            if(msgfcadastrado != null){
                out.println("<h4>"+msgfcadastrado+"</h4>");
            }
        %>
  
        
        
  
  
        
    </body>
</html>
