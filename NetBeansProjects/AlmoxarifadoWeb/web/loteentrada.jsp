<%-- 
    Document   : loteentrada
    Created on : 23/10/2020, 22:33:06
    Author     : melo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="ifpe" uri="br.recife.edu.ifpe.customtags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lote de Entrada</title>
    </head>
    <body>
        <a href="index.html" id="link"> Página Inicial </a> <br/> <br/>
        
        <h1>Cadastro de Lote de Entrada</h1>
        
        <ifpe:carregaprodutos/>

        
        <table>
            <tr><th>Código</th><th>Nome</th><th>Marca</th><th>Categoria</th>
               
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
