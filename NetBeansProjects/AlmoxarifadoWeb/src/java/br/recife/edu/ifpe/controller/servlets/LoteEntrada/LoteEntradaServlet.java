/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.controller.servlets.LoteEntrada;

import br.recife.edu.ifpe.model.classes.ItemEntrada;
import br.recife.edu.ifpe.model.classes.LoteEntrada;
import br.recife.edu.ifpe.model.classes.Produto;
import br.recife.edu.ifpe.model.repositorios.RepositorioProdutos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 *
 * @author melo
 */
@WebServlet(name = "LoteEntradaServlet", urlPatterns = {"/LoteEntradaServlet"})
public class LoteEntradaServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp); //To change body of generated methods, choose Tools | Templates.

        int codigo = Integer.parseInt(req.getParameter("codigo"));
        HttpSession session = req.getSession();

        LoteEntrada lE = (LoteEntrada) session.getAttribute("loteEntrada");

           if (lE == null) {
              lE = new LoteEntrada();

               session.setAttribute("loteEntrada", lE);

            }
           //aula 21 - 9-30
           boolean controle = false;
           
            for (ItemEntrada i: lE.getItens()){
                if(i.getProduto().getCodigo()== codigo){
                    i.setQuantidade(i.getQuantidade()+1);
                    controle = true;
                }
            
            }
            //21 14-00
            if (!controle){
            ItemEntrada item = new ItemEntrada();
            
                Produto p = RepositorioProdutos.getCurrentInstance().read(codigo);
                
                item.setProduto(p);
                item.setCodigo((int)(Math.random()*10000));
                item.setQuantidade(1);
                
                lE.addItem(item);
                
                session.setAttribute("msg","O produto"+ p.getNome() +"foi inserido no lote");
            
            }else{
            
             session.setAttribute("msg","O produto foi incrementado no lote");
            }
            
            
            
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
