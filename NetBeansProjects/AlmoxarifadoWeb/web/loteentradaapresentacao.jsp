<%-- 
    Document   : loteentradaapresentacao
    Created on : 24/10/2020, 13:44:47
    Author     : melo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ifpe" uri="br.recife.edu.ifpe.customtags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LoteEntradaApresentação</title>
        <style>
            .modal{
                position:absolute;
                background:window;
                top:100px;
                left:100px; 
                width: 50%;
            }
        </style>
    </head>
    <body>
        <a href="index.html" id="link"> Página Inicial </a> <br/><br/>
        
        <h4>Lotes Inseridos </h4>
        
        <h3><c:out value="${msglote}"/></h3>
        <c:remove var="msglote" scope="session"/>
        
        <ifpe:carregalotesentrada/> <%--Lotes de entrada inserido na pagina JSP--%>
        <table border="1">
            <tr><th>Data</th><th>Código</th><th>Quantidade total</th><th>Visualizar item</th></tr>
            <c:forEach var="item" items="${lotesEntradaInseridos}">
                
                <tr>
                    <td>${item.data}</td>
                    <td>${item.codigo}</td>
                    <td>${item.quantidadeTotal}</td>
                    <td><a href="#" onclick="carregaItens(${item.codigo})"> visualizar itens</a></td>
                </tr>
                <script>
                    
                    var meuDiv;
            
            function carregaItens(codigo){
                
                fetch("LoteEntradaServlet?codigo="+codigo,{method:"get"}).then(function(response){
                    response.text().then(function(text){
                        let objeto = JSON.parse(text);
                        
                        meuDiv = document.createElement("div");
                        meuDiv.setAttribute("class","modal");
                        
                        document.body.appendChild(meuDiv);
                        
                        meuDiv.innerHTML = objeto.codigo+"<br>"+objeto.descricao+"<br>";
                        
                        let tabela = document.createElement("table");
                        tabela.setAttribute("border","1");
                        
                        meuDiv.appendChild(tabela);
                        
                        
                        for(let i = 0; i < objeto.itens.length; i++){
                            let tr = document.createElement("tr");
                           
                            
                            let td1 = document.createElement("td");
                            td1.setAttribute("style","width:150px")
                            td1.innerHTML = objeto.itens[i].codigo;
                            let td2 = document.createElement("td");
                            td2.setAttribute("style","width:150px")
                            td2.innerHTML = objeto.itens[i].nomeProduto;
                            let td3 = document.createElement("td");
                            td3.setAttribute("style","width:150px")
                            td3.innerHTML = objeto.itens[i].quantidade;
                            
                            tr.appendChild(td1);
                            tr.appendChild(td2);
                            tr.appendChild(td3);
                            tabela.appendChild(tr);
                        }
                        
                        let botao = document.createElement("button");
                        botao.appendChild(document.createTextNode("   fechar   "));
                        
                        meuDiv.appendChild(botao);
                        
                        botao.addEventListener("click",function(){
                            document.body.removeChild(meuDiv);
                            meuDiv = "";
                        
    
                        });
                        
                    });
                });
            }
                    
                </script>

            </c:forEach>
        </table>
        
            
            
        
    </body>
</html>
