<%-- 
    Document   : estoque
    Created on : 26/10/2020, 02:12:37
    Author     : melo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ifpe" uri="br.recife.edu.ifpe.customtags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <a href="index.html">Página Inicial</a>
        
        <h1>Produtos em estoque</h1>
        
        <ifpe:carregaestoque/>
        
        <table border="2">
            <tr><td>Código</td><td>Nome do Produto</td><td>Quantidade em estoque</td></tr>
            
            <c:forEach var="item" items="${estoque.itens}">
                <tr>
                    <td><c:out value="${item.codigo}"/></td>
                    <td><c:out value="${item.produto.nome}"/></td>
                    <td><c:out value="${item.quantidade}"/></td>
                </tr>
            </c:forEach>
            
        </table>
        
        
    </body>
</html>
