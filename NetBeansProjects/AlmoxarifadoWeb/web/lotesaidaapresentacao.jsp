<%-- 
    Document   : lotesaidaapresentacao
    Created on : 25/10/2020, 22:59:18
    Author     : melo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ifpe" uri="br.recife.edu.ifpe.customtags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <a href="lotesaida.jsp" id="link"> Cadastro de lote de saída</a> <br/>
        
        <h4>Apresentação de lotes de saídas</h4>
        
        <h3><c:out value="${msglotesaida}"/></h3>
        <c:remove var="msglotesaida" scope="session"/>
        
        <ifpe:carregalotesaida/>
        
        <table border='1'>
            <tr><th>Data</th><th>Codigo</th><th>quantidade total</th><th>visualizar itens</th></tr>
                    <c:forEach var="item" items="${lotesSaidaInseridos}">
                
                        <tr>
                            <td>${item.data}</td>
                            <td>${item.codigo}</td>
                            <td>${item.quantidadeTotal}</td>
                            <td><a href="#" onclick="carregaItens(${item.codigo})">visualiza itens</a></td>
                        </tr>

                    </c:forEach>
        </table>    
        
        <script>
            var meuDiv;
            
            function carregaItens(codigo){
                
                fetch("LoteSaidaServlet?codigo="+codigo,{method:"get"}).then(function(response){
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
                            td1.innerHTML = objeto.itens[i].codigo;
                            let td2 = document.createElement("td");
                            td2.innerHTML = objeto.itens[i].nomeProduto;
                            let td3 = document.createElement("td");
                            td3.innerHTML = objeto.itens[i].quantidade;
                            
                            tr.appendChild(td1);
                            tr.appendChild(td2);
                            tr.appendChild(td3);
                            tabela.appendChild(tr);
                        }
                        
                        let botao = document.createElement("button");
                        botao.appendChild(document.createTextNode("fechar"));
                        
                        meuDiv.appendChild(botao);
                        
                        botao.addEventListener("click",function(){
                            document.body.removeChild(meuDiv);
                            meuDiv = "";
                        });
                        
                    });
                });
            }
            
        </script>
        
    </body>
</html>
