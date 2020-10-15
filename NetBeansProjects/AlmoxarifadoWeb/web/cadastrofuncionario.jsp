<%-- 
    Document   : cadastrofuncionario
    Created on : 01/10/2020, 17:51:01
    Author     :Leandro melo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>AW-CadastroFuncionario</title>  
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javacript" src="resources/bootstrap/js/bootstrap.min.js"></script>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <a href="index.html" id="link"> Página Inicial </a> <br/>
         <a href="funcionarios.jsp" id="link"> Gerenciamento de funcionários</a>
         
        <h3>Cadastro de funcionário</h3>

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
    </body>
</html>
