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
        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <!-- JS, Popper.js, and jQuery -->
        <!--    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>-->
        <!--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>-->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script type="text/javacript" src="resources/bootstrap/js/bootstrap.min.js"></script>  

    </head>
    
    <body>
    <a href="index.html" id="link"> Página Inicial </a> <br/>  
        <h3>Produtos cadastrados (Página JSP)</h3>
        <%
            String mensagem = (String) session.getAttribute("msg");
            if (mensagem != null) {
               out.print("<script>");
             out.println("alert('" + mensagem + " ');");
                session.removeAttribute("msg");
                out.print("</script>");
 
            
           
            }
        %>

<!--<h2><%= mensagem%></h2>-->

        <%-- Modal versão 1  --%>   
        <!--        
                <div class="container">
                    <button onclick="modalopen()"class="btn btn-info btn-lg" data-toggle="modal"  data-target="#myModal">novo produto</button>
                    <div class="modal fade" id="myModal"role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class= "modal-header" id="modal" style="position: absolute; top: 150px; left: 200px;border: 1px black solid; background: white">
        
                                  
                                    <br/>
                                    <button onclick="modalclose()">close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        -->
        
        <!-- Button trigger modal -->
        
<!--        <button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCenter">Cadastrar produto</button>-->
        <button  onclick="modalopen()" class="btn btn-primary" data-toggle="modal" data-target="#ModalCenter">Cadastrar produto</button>

        <!-- Modal -->
        <div id="ModalCenter" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLongTitle">Cadastro de Produto</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        
                        <jsp:include page="cadastroproduto.jsp"/>
                        
                    </div>
                    <div class="modal-footer">
<!--                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>-->
                        <button onclick="modalclose()" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        
                        <!--<button type="button" class="btn btn-primary" value="cadastrar">Cadastrar</button>-->
                    </div>
                </div>
            </div>
        </div> 
                        
                        <!-- Modal2 visualizar -->
<!--        <div id="ModalCenter2" class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="ModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLongTitle">Cadastro de Produto</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                   <%--     <%@include file="visualizaproduto.jsp" %>   --%>
                        <%--<jsp:include page="visualizarproduto.jsp"/>--%>
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button onclick="modalclose2()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" value="cadastrar">Cadastrar</button>
                    </div>
                </div>
            </div>
        </div>            
-->

<!--<div id="ModalCenter2" style="position: absolute; top: 200px; left: 200px;border: 1px black solid; background: white" aria-hidden="true">-->
 
<div id="ModalCenter2" style="position: absolute; top: 50px; left: 400px; background: write" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document2">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ModalLongTitle">Detalhes do produto</h5>
                
            </div>
            <div class="modal-body">
                <%@include file="visualizaproduto.jsp" %>
            </div>
            <div class="modal-footer">
         <button onclick="modal2close()"class="btn btn-secondary">Fechar</button>
         
                        
        </div>
       </div> 
    </div>
</div>

            
            
<div class="container">
        <%
            List<Produto> produtos = RepositorioProdutos.getCurrentInstance().readAll();
        %>

        <!--<table class="border" style="position: absolute; top: 150px; left: 20px;border: 1px black solid; background: white" >-->
        <table class="border" style="top: 150px; left: 20px">
            <tr>
                <th style="width:100px ">Código</th><th style="width:120px">Nome</th><th style="width:120px">Marcar</th><th style="width:120px">Categoria</th><th style="width:200px">Operações</th>
             </tr>

            <%
                for (Produto p : produtos) {
            %>

            <tr>
                <td class="border"><%= p.getCodigo()%></td>
                <td class="border"><%= p.getNome()%></td>
                <td class="border"><%= p.getMarca()%></td>
               <td class="border"><%= p.getCategoria()%></td>
               <td class="border"><a href="ProdutoServletNew?codigo=<%= p.getCodigo()%>&redirect=visualiza">visualizar</a></td>    
            </tr>
            <%
                }
            %>

        </table>
             
</div>

        <script>

            var modalcenter = document.getElementById("ModalCenter");

            
            
            var modalcenter2 = document.getElementById("ModalCenter2");
            
            <%
                String redirect = request.getParameter("redirect");
                
                if(redirect == null){
            %>
                document.body.removeChild(modalcenter);
                document.body.removeChild(modalcenter2);
             
            <% }else if(redirect.equals("visualiza")){ %>
                document.body.removeChild(modalcenter);
            <% }else{ %>
                document.body.removeChild(modalcenter2);
            <% } %>

            function modalclose() {
                document.body.removeChild(modalcenter);
            }
            
            function modal2close() {
                document.body.removeChild(modalcenter2);
            }

            function modalopen() {
                document.body.appendChild(modalcenter);
            }

        </script>


    </body>
</html>
