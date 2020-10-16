<%-- 
    Document   : funcionarios
    Created on : 09/10/2020, 22:05:51
    Author     : melo
--%>

<%@page import="br.recife.edu.ifpe.model.classes.Funcionario"%>
<%@page import="br.recife.edu.ifpe.model.repositorios.RepositorioFuncionario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Funcionários Cadastrados</title>
        
        <!--Ajax--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
         <!--JS, Popper.js, and jQuery--> 
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script type="text/javacript" src="resources/bootstrap/js/bootstrap.min.js"></script> 
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
     
        <!--CSS only--> 
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">-->
    </head>
    <body>
        <a href="index.html" id="link"> Página Inicial </a> <br/> <br/>
         
            <a class="d-inline p-2 bg-primary text-white" href="cadastrofuncionario.jsp"> Cadastrar funcionários </a> <br/> <br/>
      
        <!--<a href="listarfuncionarios.jsp" id="link"> Lista de funcionarios cadastrados</a>-->
        <h4>Funcionários cadastrados</h4> 
        <%--
        <%
            String msgfcadastrado = (String)session.getAttribute("msgfcadastrado");
            if(msgfcadastrado != null){
                out.println("<h4>"+msgfcadastrado+"</h4>");
            }
        %>
        --%>
        
        <%
            String msgf = (String) session.getAttribute("msgf");
            if (msgf != null) {
               out.print("<script>");
             out.println("alert('" + msgf + " ');");
                session.removeAttribute("msgf");
                out.print("</script>");
            
            }
        %>
     
         <div id="modal" style="position: absolute; top: 200px; left: 200px;border: 1px black solid; background: white">

            <form method="post" action= "FuncionarioServlet">
           
            <table   style="text-align:right;">
                <tr>               
                    <th>Codigo:</th> 
                    <th><input type="text" name="codigo"  placeholder="Apenas Números" onkeypress="return event.charCode >= 48 && event.charCode <= 57"value="${(param.redirect != null && param["redirect"] eq 'atualiza')?funcionario.codigo:''}"/></th></th>                          
                </tr>
                <tr> 
                    <th>Nome:</th>
                    <th> <input type="text" name="nome" value="${(param.redirect != null && param["redirect"] eq 'atualiza')?funcionario.nome:''}"/></th>                    
                </tr>              
                 <!--  <tr>
                    <th>Departamento:</th>
                    <th><input type="text" name="Departamento"/></th>
                </tr>-->
                <tr>
                    <th>Departamento:</th>
                    <th> 
                        <select type="text" name="departamento"> 
                            <option label="almoxarifado">Almoxarifado</option> 
                            <option label="Departamento de vendas">Departamento de Vendas</option> 
                            <option label="departamento pessoal">Departamento Pessoal</option> 
                            <option label="departamento financeiro">Departamento Financeiro</option> 
                        ${(param.redirect != null && param["redirect"] eq 'atualiza')?produto.categoria:''}</select>   
                    </th>
                </tr>
                <th></th>
                <input type="hidden" name="${(param.redirect != null && param.redirect eq 'atualiza')?'atualizar':'cadastrar'}" value="1"/>
                 <th><input type="submit" class="btn btn-primary" value="${(param.redirect != null && param.redirect eq 'atualiza')?'atualizar':'cadastrar'}"/></th>
                <!--<th><input type="submit" class="btn btn-primary" value="cadastrar"/></th>-->
                </tr>               
            </table>
        </form> 
            <button onclick="modalclose();btn1()">close</button>
        </div>
           
        <div id="modal2" style="position: absolute; top: 200px; left: 200px;border: 1px black solid; background: white">
            
            <h4>Detalhes do funcionario</h4> </br>
        
        <%
            Funcionario funcionario = (Funcionario)request.getAttribute("funcionario");
            if (funcionario != null) {
        %>
        
        <table style="width:400px"  >            
            <tr style="border:1px solid black">
                <th>Código:</th><td><%= funcionario.getCodigo()%></td>
            </tr>
            <tr style="border:1px solid black">
                <th>Nome:</th><td><%= funcionario.getNome()%></td>
            </tr>
            <tr style="border:1px solid black">
                <th>Departamento:</th><td><%= funcionario.getDepartamento()%></td>
            </tr>           
        </table>
            
        <% }%>    
            <button id="btn1" onclick="modal2close();btn1()">close</button>
        </div>
        
        <%   
            List<Funcionario> funcionarios = RepositorioFuncionario.getCurrentInstance().readAll(); 
        %>
        
        <table class="border" >
        <tr class="table-row p-2 bg-primary text-white">
            <th style="width:100px">codigo</th><th style="width:400px">nome</th> <th style="width:200px">departamento</th><th style="width:200px">Operações</th>  

        </tr>
       <%
       for (Funcionario f: funcionarios){       
       %>
       <tr>
           <td class="border"><%= f.getCodigo() %></td>
           <td class="border"><%= f.getNome()%></td>
           <td class="border"><%= f.getDepartamento()%></td>
           <td><a href="FuncionarioServlet?codigo=<%= f.getCodigo()%>&redirect=visualiza">visualizar</a>
                <a href="FuncionarioServlet?codigo=<%= f.getCodigo()%>&redirect=atualiza">atualizar</a>
                <a href="#" onclick="deleteProduto(<%= f.getCodigo()%>)">deletar</a></td>
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
                 location.replace("funcionarios.jsp");
            }
                             
                         
            function deleteProduto(codigo){
                fetch("FuncionarioServlet?codigo="+codigo,{method:'delete'})
                        .then(function(response){
                            location.reload();
                });
            };
        </script>
  
        
    </body>
</html>
