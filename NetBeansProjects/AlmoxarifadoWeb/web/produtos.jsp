<%-- 
    Document   : produtos
    Created on : 22/09/2020, 23:49:13
    Author     : leandro melo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produtos</title>
    </head>
    <body>
        <h1>Produtos cadastrados (JSP)</h1>
        <%
            String mensagem = (String)session.getAttribute("msg");
            if(mensagem != null){
                out.println("<h2>"+mensagem+"</h2>");
            }
        %>
        
        <!--<h2><%= mensagem%></h2>-->
        
        
    </body>
</html>
