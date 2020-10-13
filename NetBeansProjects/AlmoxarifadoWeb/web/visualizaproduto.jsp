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
<!--        <h4>Produto Cadastrado</h4>-->
        
        <%
            Produto produto = (Produto)request.getAttribute("produto");
            if (produto != null) {
        %>
        <table border="1">
            <tr>
                <th>Código</th><td style="width:300px" ><%= produto.getCodigo()%></td>
            </tr>
            <tr>
                <th>Nome</th><td><%= produto.getNome()%></td>
            </tr>
            <tr>
                <th>Marca</th><td><%= produto.getMarca()%></td>
            </tr>
            <tr>
                <th>Categoria</th><td><%= produto.getCategoria()%></td>
            </tr>
            <tr>
                <th>Descrição</th><td><%= produto.getDescricao()%></td>
            </tr>
        </table>
        <% }%>        
    </body>
</html>