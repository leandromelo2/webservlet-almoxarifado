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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script type="text/javacript" src="resources/bootstrap/js/bootstrap.min.js"></script>  

    </head>
    
    <body>
    <a href="index.html" id="link"> Página Inicial </a> <br/>  
        <h3>Produtos cadastrados (Página JSP)</h3>
        <%
            String mensagem = (String) session.getAttribute("msg");
            if (mensagem != null) {
                out.println("<h4>" + mensagem + "</h4>");
                session.removeAttribute("msg");
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
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
            Cadastrar produto
        </button>

        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Cadastro de Produto</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <jsp:include page="cadastroproduto.jsp"/>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <!--<button type="button" class="btn btn-primary" value="cadastrar">Cadastrar</button>-->
                    </div>
                </div>
            </div>
        </div>                            

        <%
            List<Produto> produtos = RepositorioProdutos.getCurrentInstance().readAll();
        %>

        <table class="border" style="position: absolute; top: 150px; left: 20px;border: 1px black solid; background: white" >
            <tr>
                <th style="width:100px ">Código</th><th style="width:120px">Nome</th><th style="width:120px">Marcar</th><th style="width:120px">Categoria</th><th style="width:300px">Operações</th>
            </tr>

            <%
                for (Produto p : produtos) {
            %>

            <tr>
                <td class="border"><%= p.getCodigo()%></td>
                <td class="border"><%= p.getNome()%></td>
                <td class="border"><%= p.getMarca()%></td>
               <td class="border"><%= p.getCategoria()%></td>
            </tr>
            <%
                }
            %>

        </table>
             


        <script>

//            var modal = document.getElementById("modal");
//
//            document.body.removeChild(modal);
//
//            function modalclose() {
//                document.body.removeChild(modal);
//            }
//
//            function modalopen() {
//                document.body.appendChild(modal);               
//               
//            }

        </script>


    </body>
</html>
