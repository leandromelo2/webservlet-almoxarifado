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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javacript" src="resources/bootstrap/js/bootstrap.min.js"></script>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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

            <jsp:include page="cadastrofuncionario.jsp"/>
            <br/>
            <button onclick="modalclose();btn1()">close</button>
        </div>
           
        <div id="modal2" style="position: absolute; top: 200px; left: 200px;border: 1px black solid; background: white">
            
            <%@include file="visualizafuncionario.jsp" %>     
            <br/>
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
