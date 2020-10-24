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
            <tr><th>Código</th><th>Nome</th><th>Marca</th><th>Categoria</th><th>inserir</th></tr>
               
                <c:forEach var="pAux" items="${produtos}">
                    <tr>
                        <td>${pAux.codigo}</td>
                        <td>${pAux.nome}</td>
                        <td>${pAux.marca}</td>
                        <td>${pAux.categoria}</td>
                    <td><a href="#" class="plus" onclick="adiciona(${pAux.codigo})">+</a></td>
                     </tr>
                </c:forEach>
        </table>
       <h2>produtos inserdos no lote de entrada</h2>
            <table border="1">
                <tr><th>Código</th><th>Nome</th><th>Marca</th><th>Categoria</th>
                    <th>Quantidade</th><th>inserir</th></tr>
                        <c:forEach var="i" items="${loteEntrada.itens}">
                    <tr>
                        <td>${i.produto.codigo}</td>
                        <td>${i.produto.nome}</td>
                        <td>${i.produto.marca}</td>
                        <td>${i.produto.categoria}</td>
                        <td>${i.quantidade}</td>
                        <td><a href="#" class="plus" onclick="diminui(${i.produto.codigo})">-</a>
                            |<a href="#" class="plus" onclick="adiciona(${i.produto.codigo})">+</a></td>
                    </tr>
                </c:forEach>
            </table>
        
        <script>
            function adiciona(codigo) {
                fetch("LoteEntradaServlet?operacao=mais&codigo=" + codigo, {method: "put"})
                        .then(function () {
                            location.reload();
                        });
                        
            }
                        
        </script>
        
    </body>
</html>
