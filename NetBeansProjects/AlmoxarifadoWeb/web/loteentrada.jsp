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
        <style>
            .plus{
                font-size:15pt;
                text-decoration:none;
                color:blue;
                font-weight:bold;
            }
            
        </style>
    </head>
    <body>
        <a href="index.html" id="link"> Página Inicial </a> <br/> <br/>
        
        <h4>Cadastro de Lote de Entrada</h4>
        <h3><c:out value="${msglote}"/></h3>
        <c:remove var="msglote" scope="session"/>
        
        <ifpe:carregaprodutos/>

        <h4>Produtos cadastrados</h4>
        <table border="2">
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
        
        
        <c:if test="${loteEntrada != null}"> <%-- tabela dos  'produtos inseridos no lote de entrada' só aparece se for diferente de null  --%>
       <h2>produtos inseridos no lote de entrada</h2>
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
                        <td><a href="#" class="plus" onclick="diminui(${i.produto.codigo})"> - </a>
                            |<a href="#" class="plus" onclick="adiciona(${i.produto.codigo})"> + </a></td>
                    </tr>
                </c:forEach>
            </table>
            <button onclick="cadastrar()">cadastrar</button>
       </c:if>
       
        <script>
            function adiciona(codigo) {
                fetch("LoteEntradaServlet?operacao=mais&codigo=" + codigo, {method: "put"})
                        .then(function () {
                            location.reload();
                        });
            }
            function diminui(codigo) {
                fetch("LoteEntradaServlet?operacao=menos&codigo=" + codigo, {method: "put"})
                        .then(function () {
                            location.reload();
                        });
            }
            function cadastrar() {
                fetch("LoteEntradaServlet", {method: "post"})
                        .then(function (response) {
                            if(response.status === 500)
                                location.reload();
                            else
//                                location.reload();
                                location.href = "loteentradaapresentacao.jsp";
                        }).catch(function(erro){
                            location.reload();
                        });
            }
                        
        </script>
        
    </body>
</html>
