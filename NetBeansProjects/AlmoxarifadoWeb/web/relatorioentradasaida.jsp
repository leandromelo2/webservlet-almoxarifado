<%-- 
    Document   : relatorioentradasaida
    Created on : 26/10/2020, 11:18:44
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
        <a href="index.html" id="link"> Página Inicial </a> <br/> <br/>
        <h4>Relatorio de lotes de entrada e saída</h4>
        
        
        <ifpe:carregaloteentradasaida/>
        
         <h4>Lotes de Entrada</h4>
        <table border='1'>
            <tr><th>Data</th><th>Codigo</th><th>quantidade total</th></tr>
                    <c:forEach var="item" items="${lotesEntradaInseridos}">
                
                        <tr>
                            <td>${item.data}</td>
                            <td>${item.codigo}</td>
                           
                            <td>${item.quantidadeTotal}</td>
                          
                        </tr>

                    </c:forEach>
        </table> 
                <ifpe:carregaloteentradasaida/>
          <h4>Lotes de Saída</h4>
        <table border='1'>
            <tr><th>Data</th><th>Codigo</th><th>quantidade total</th></tr>
                    <c:forEach var="item" items="${lotesSaidaInseridos}">
                
                        <tr>
                            <td>${item.data}</td>
                            <td>${item.codigo}</td>
                            
                            <td>${item.quantidadeTotal}</td>
                          
                        </tr>

                    </c:forEach>
        </table> 
        
 
</html>
