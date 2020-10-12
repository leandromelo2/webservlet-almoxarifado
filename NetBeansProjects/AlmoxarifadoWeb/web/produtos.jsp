<%-- 
    Document   : produtos
    Created on : 22/09/2020, 23:49:13
    Author     : leandro melo
--%>

<%@page import="br.recife.edu.ifpe.model.repositorios.RepositorioProdutos"%>
<%@page import="br.recife.edu.ifpe.model.classes.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produtos</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javacript" src="resources/bootstrap/js/bootstrap.min.js"></script>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Produtos cadastrados (JSP)</h1>
        <%
            String mensagem = (String)session.getAttribute("msg");
            if(mensagem != null){
                out.println("<h2>"+mensagem+"</h2>");
            }
        %>
        
        <!--<h2><%= mensagem%></h2>-->
        <div class="container">
            <button onclick="modalopen()"class="btn btn-info btn-lg" data-toggle="modal"  data-target="#myModal">novo produto</button>
            <div class="modal fade" id="myModal"role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class= "modal-header" id="modal" style="position: absolute; top: 150px; left: 200px;border: 1px black solid; background: white">

                            <jsp:include page="cadastroproduto.jsp"/>
                            <br/>
                            <button onclick="modalclose()">close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        
        <%
            List<Produto> produtos = RepositorioProdutos.getCurrentInstance().readAll();
        %>
        
        <table class="border">
            <tr>
                <th style="width:150px ">Código</th><th style="width:150px">Nome</th><th style="width:150px">Marcar</th><th style="width:150px">Categoria</th><th style="width:300px">Operações</th>
            </tr>
            
            <%
                for(Produto p: produtos){
            %>
            
            <tr>
                <td><%= p.getCodigo() %></td>
                <td><%= p.getNome() %></td>
                <td><%= p.getMarca() %></td>
                <td><%= p.getCategoria() %></td>
            </tr>
            <%
                }
            %>
            
        </table>

        
         
        <script>

            var modal = document.getElementById("modal");

            document.body.removeChild(modal);

            function modalclose() {
                document.body.removeChild(modal);
            }
            
            function modalopen() {
                document.body.appendChild(modal);
            }
        </script>
            
        
    </body>
</html>
