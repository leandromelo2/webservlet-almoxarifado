<%-- 
    Document   : atualizafuncionario
    Created on : 15/10/2020, 18:29:17
    Author     : melo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h5>Atualizar funcionário</h5>

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
