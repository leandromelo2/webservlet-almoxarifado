<%-- 
    Document   : funcionarios
    Created on : 11/10/2020, 22:05:51
    Author     : melo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Funcionário cadastrado!</h1>
        <%
            String mensagem = (String)session.getAttribute("msg");
            if(mensagem != null){
                out.println("<h2>"+mensagem+"</h2>");
            }
        %>
        
        <!--<h2><%= mensagem%></h2>-->
    </body>
</html>
