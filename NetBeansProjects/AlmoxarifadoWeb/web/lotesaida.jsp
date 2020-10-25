<%-- 
    Document   : lotesaida
    Created on : 24/10/2020, 21:52:17
    Author     : melo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="ifpe" uri="br.recife.edu.ifpe.customtags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lote Saída</title>
    </head>
    <body>
        <a href="index.html" id="link"> Página Inicial </a> <br/><br/>
        
        <h4>Cadastro de Lote de Saída</h4>
       
        <ifpe:carregaprodutos/>
        
        
        <h4>Produtos Cadastrados</h4>
        <table border="2">
            <tr><th>Código</th><th>Nome</th><th>Marca</th><th>Categoria</th></tr>
               
            <c:forEach var="pAux" items="${produtos}">
                    <tr>
                        <td>${pAux.codigo}</td>
                        <td>${pAux.nome}</td>
                        <td>${pAux.marca}</td>
                        <td>${pAux.categoria}</td>
                    </tr>
                </c:forEach>
        </table>
        
        
    </body>
</html>










