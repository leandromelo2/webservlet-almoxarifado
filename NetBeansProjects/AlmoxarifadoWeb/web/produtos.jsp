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
        
         <!--CSS only--> 
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        
         <!--JS, Popper.js, and jQuery--> 
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script type="text/javacript" src="resources/bootstrap/js/bootstrap.min.js"></script> 
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
     
    </head>
    
    <body>
    <a href="index.html" id="link"> Página Inicial </a> <br/>  
        
        
        <%
            String mensagem = (String) session.getAttribute("msg");
            if (mensagem != null) {
               out.print("<script>");
             out.println("alert('" + mensagem + " ');");
                session.removeAttribute("msg");
                out.print("</script>");
 
            
           
            }
        %>
     
        <button  onclick="modalopen2()" class="btn btn-primary" data-toggle="modal" data-target="#ModalCenter">Cadastrar produto</button> <br/> 
        <h4>Produtos cadastrados</h4>

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

                        <form method="post" action= "ProdutoServletNew">
                            <table>
                                <tr>               
                                    <th>Codigo:</th> 
                                    <th><input type="text" name="codigo" placeholder="Apenas Números" onkeypress="return event.charCode >= 48 && event.charCode <= 57" /></th>                          
                                </tr>
                                <tr> 
                                    <th>Nome:</th>
                                    <th> <input type="text" name="nome"required/></th>                    
                                </tr>
                                <tr>
                                    <th>Marca:</th>
                                    <th><input type="text" name="marca"required/></th>
                                </tr>
                                <tr>
                                    <th>Categoria:</th>
                                    <th><input type="text" name="categoria"  maxlength="50"required/></th>                    
                                </tr>
                                <tr>
                                    <th>Descrição:</th>
                                    <th><textarea name="descricao" rows="4" cols="30" maxlength="50"></textarea></th>
                                </tr>
                                <tr>
                                    <th><input type="submit" class="btn btn-primary" value="cadastrar"/></th>
                                </tr>               
                            </table>
                        </form>    

                    </div>
                    <div class="modal-footer">
                        <!--                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>-->
                        <button onclick="modalclose()" class="btn btn-secondary" data-dismiss="modal">Fechar</button>

                        <!--<button type="button" class="btn btn-primary" value="cadastrar">Cadastrar</button>-->
                    </div>
                </div>
            </div>
        </div> 
        
        
        
        
        <!--<button onclick="modalopen()">novo produto</button>-->
        <div id="modal" style="position: absolute; top: 200px; left: 200px;border: 1px black solid; background: white">

            <jsp:include page="cadastroproduto.jsp"/>
            <br/>
            <button onclick="modalclose();btn1()">close</button>
        </div>
           
        <div id="modal2" style="position: absolute; top: 200px; left: 200px;border: 1px black solid; background: white">
            
            <%@include file="visualizaproduto.jsp" %>     
            <br/>
            <button id="btn1" onclick="modal2close();btn1()">close</button>
        </div>
            

        <%
            List<Produto> produtos = RepositorioProdutos.getCurrentInstance().readAll();
        %>

        <!--<table class="border" style="position: absolute; top: 150px; left: 20px;border: 1px black solid; background: white" >-->
        <table class="border" style="top: 150px; left: 20px">
            <tr class="table-row p-2 bg-primary text-white">
                <th style="width:100px ">Código</th><th style="width:120px">Nome</th><th style="width:120px">Marcar</th><th style="width:120px">Categoria</th><th style="width:200px">Operações</th>
             </tr>

            <%
                for (Produto p : produtos) {
            %>

            <tr style="border:1px solid black">
                <td><%= p.getCodigo()%></td>
                <td><%= p.getNome()%></td>
                <td><%= p.getMarca()%></td>
                <td><%= p.getCategoria()%></td>
                <td><a href="ProdutoServletNew?codigo=<%= p.getCodigo()%>&redirect=visualiza">visualizar</a>
                <a href="ProdutoServletNew?codigo=<%= p.getCodigo()%>&redirect=atualiza">atualizar</a>
                <a href="#" onclick="deleteProduto(<%= p.getCodigo()%>)">deletar</a></td>   
            </tr>
            <%
                }
            %>

        </table>
             

        <script>

            var modal = document.getElementById("modal");

            var modal2 = document.getElementById("modal2");
            
            var modalcenter = document.getElementById("ModalCenter");
            
           
            
            <%
                String redirect = request.getParameter("redirect");
                
                if(redirect == null){
            %>
                document.body.removeChild(modal);
                document.body.removeChild(modal2);
             
            <% }else if(redirect.equals("visualiza")){ %>
                document.body.removeChild(modal);
            <% }else{ %>
                document.body.removeChild(modal2);
            <% } %>

            function modalclose() {
                document.body.removeChild(modal);
                
            }
            
            function modal2close() {
                document.body.removeChild(modal2);                 
            }

            function modalopen() {
             setTimeout(function(){document.body.appendChild(modal);},4000);                         
            }
            
            function modalopen2() {
                document.body.appendChild(modalcenter);
            }
            
            
            function btn1() {
                 location.replace("produtos.jsp");
            }
                             
                         
            function deleteProduto(codigo){
                fetch("ProdutoServletNew?codigo="+codigo,{method:'delete'})
                        .then(function(response){
                            location.reload();
                });
            };
        </script>

    </body>
</html>
