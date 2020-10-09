/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.controller.servlets;

import br.recife.edu.ifpe.model.classes.ItemEstoque;
import br.recife.edu.ifpe.model.classes.Produto;
import br.recife.edu.ifpe.model.repositorios.RepositorioEstoque;
import br.recife.edu.ifpe.model.repositorios.RepositorioProdutos;
import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author melo
 */
@WebServlet(name = "ProdutoServlet", urlPatterns = {"/ProdutoServlet"})
public class ProdutoServlet extends HttpServlet {

  
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * 
     * 
     *  
     * CONTINUAR DO VIDEO 7 08/10/2020 quinta
     * 
     *  
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String codAux = request.getParameter("codigo");
        if (codAux == null) {
            
            java.util.List<Produto> produtos = RepositorioProdutos.getCurrentInstance().readAll();
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProdutoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<a href=\"index.html\">home<a/> <br/>");
            out.println("<a href=\"cadastroproduto.html\">cadastrar produtos<a/> <br/>");
            out.println("<h1>Produto Recuperado</h1>");            
            out.println("<br/>");
            out.println("<br/>");
            out.println("<table border=\"1\"/>");
            out.println("<tr><th>Código</th><th>Nome</><th>Marca</><th>Categoria</th</tr>");
            for (Produto p: produtos){
             out.println("<tr>");
             out.println("<td>"+p.getCodigo()+"</td>");
             out.println("<td>"+p.getNome()+"</td>");
             out.println("<td>"+p.getMarca()+"</td>");
             out.println("<td>"+p.getCategoria()+"</td>");
             
                
            }       
            
            out.println("</body>");
            out.println("</html>");
         }      
            
            
        } else {

            int codigo = Integer.parseInt(codAux);//try catch

            Produto p = RepositorioProdutos.getCurrentInstance().read(codigo);

            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet ProdutoServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Produto Recuperado</h1>");
                out.println("<a href=\"index.html\">home<a/> <br/>");
                out.println("<br/>");
                out.println("<br/>");
                out.println("Código: " + p.getCodigo() + "<br/>");
                out.println("Nome: " + p.getNome() + "<br/>");
                out.println("Marca: " + p.getMarca() + "<br/>");
                out.println("Categoria: " + p.getCategoria() + "<br/>");
                out.println("Descrição: " + p.getDescricao() + "<br/>");
                out.println("</body>");
                out.println("</html>");

            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int codigo = Integer.parseInt(request.getParameter("codigo")); //try catch
        String nome = request.getParameter("nome");
        String marca = request.getParameter("marca");
        String categoria = request.getParameter("categoria");
        String descricao = request.getParameter("descricao");
//        request.getParameterValues("")[];
        
        Produto p = new Produto();
        
        p.setCodigo(codigo);    
        p.setNome(nome);
        p.setMarca(marca);
        p.setCategoria(categoria);
        p.setDescricao(descricao);
        
        RepositorioProdutos.getCurrentInstance().create(p);
        
        ItemEstoque item = new ItemEstoque();
        item.setProduto(p);
        item.setQuantidade (0);
        item.setCodigo (p.getCodigo());
        
      
        RepositorioEstoque.getCurrentInstance() .read().addItem(item);
        
        
     response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProdutoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Produto " + p.getNome() + " cadastrado com sucesso.</h1>");
//            out.println("<h1>Categoria " + p.getCategoria() + ".</h1>");
            out.println("<a href=\"index.html\">home</a>");
            out.println("</body>");
            out.println("</html>");
//        }catch (Exception e)  {
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ProdutoServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Erro no cadastro do produto</h1>");
//            out.println("<a href=\"index.html\">home</a>");
//            out.println("</body>");
//            out.println("</html>");
//            return;
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
