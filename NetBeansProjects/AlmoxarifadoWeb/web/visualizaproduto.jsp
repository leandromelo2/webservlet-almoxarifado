<%-- 
    Document   : visualizarproduto
    Created on : 12/10/2020, 15:57:21
    Author     : leandro melo
--%>
<%@page import="br.recife.edu.ifpe.model.classes.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizar Produto</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javacript" src="resources/bootstrap/js/bootstrap.min.js"></script>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h4>Detalhes do produtos</h4> </br>
        
        <%
            Produto produto = (Produto)request.getAttribute("produto");
            if (produto != null) {
        %>
        
        <table style="width:400px"  >            
            <tr style="border:1px solid black">
                <th>Código:</th><td><%= produto.getCodigo()%></td>
            </tr>
            <tr style="border:1px solid black">
                <th>Nome:</th><td><%= produto.getNome()%></td>
            </tr>
            <tr style="border:1px solid black">
                <th>Marca:</th><td><%= produto.getMarca()%></td>
            </tr>
            <tr style="border:1px solid black">
                <th>Categoria:</th><td><%= produto.getCategoria()%></td>
            </tr>
            <tr style="border:1px solid black; length:500px;">
                <th>Descrição:</th><td><%= produto.getDescricao()%></td>
            </tr>
        </table>
            
        <% }%>        
    </body>
</html>