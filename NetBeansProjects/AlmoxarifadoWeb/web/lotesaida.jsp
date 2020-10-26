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
        <style>
            .plus{
                font-size:15pt;
                text-decoration:none;
                color:blue;
                font-weight: bold;
                
            }
        </style>
        
    </head>
    <body>
        <a href="index.html" id="link"> Página Inicial </a> <br/><br/>
        
        <h4>Cadastro de Lote de Saída</h4>
       
        <ifpe:carregaprodutos/>
        
        <h4><c:out value="${msglotesaida}" /></h4>
        <c:remove var="msglotesaida" scope="session" />
                
               
        
        <h4>Produtos Cadastrados</h4>
        <table border="2">
            <tr><th>Código</th><th>Nome</th><th>Marca</th><th>Categoria</th><th>Quantidade em estoque</th><th>Inserir</th></tr>
               
            <c:forEach var="pAux" items="${produtos}">
                    <tr>
                        <td>${pAux.codigo}</td>
                        <td>${pAux.nome}</td>
                        <td>${pAux.marca}</td>
                        <td>${pAux.categoria}</td>
                        <td>""</td>
                        <td><a href="#" class="plus" onclick="adiciona(${pAux.codigo})">+</a></td>
                    </tr>
                </c:forEach>
        </table>
        
        
        <c:if test="${loteSaida !=null}">


            <h2>Produtos inseridos no lote de saída</h2>
            <table border="2">
                <tr><th>Código</th><th>Nome</th><th>Marca</th><th>Categoria</th><th>Quantidade</th><th>Inserir</th></tr>

                <c:forEach var="i" items="${loteSaida.itens}">
                    <tr>
                        <td>${i.produto.codigo}</td>
                        <td>${i.produto.nome}</td>
                        <td>${i.produto.marca}</td>
                        <td>${i.produto.categoria}</td>
                        <td>${i.quantidade}</td>
                        <td><a href="#" class="plus" onclick="diminui(${i.produto.codigo})">-</a>
                            | <a href="#" class="plus" onclick="adiciona(${i.produto.codigo})">+</a></td>
                    </tr>
                </c:forEach>
            </table>
            
        </c:if>
        
        <script>
            function adiciona(codigo) {
                fetch("LoteSaidaServlet?operacao=mais&codigo="+codigo,{method: "put"})
                        .then(function () {
                            location.reload();
                        });
            }
            function diminui(codigo) {
                fetch("LoteSaidaServlet?operacao=menos&codigo="+codigo,{method: "put"})
                        .then(function () {
                            location.reload();
                        });
            }
        </script>
        
    </body>
</html>









