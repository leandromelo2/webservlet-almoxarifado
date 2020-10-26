/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.controller.servlets.lotesaida;

import br.recife.edu.ifpe.model.classes.Estoque;
import br.recife.edu.ifpe.model.classes.ItemEstoque;
import br.recife.edu.ifpe.model.classes.ItemSaida;
import br.recife.edu.ifpe.model.classes.LoteSaida;
import br.recife.edu.ifpe.model.classes.Produto;
import br.recife.edu.ifpe.model.repositorios.RepositorioEstoque;
import br.recife.edu.ifpe.model.repositorios.RepositorioLoteSaida;
import br.recife.edu.ifpe.model.repositorios.RepositorioProdutos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author melo
 */
@WebServlet(name = "LoteSaidaServlet", urlPatterns = {"/LoteSaidaServlet"})
public class LoteSaidaServlet extends HttpServlet {

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
        
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        
        LoteSaida loteSaida = RepositorioLoteSaida.getCurrentInstance().read(codigo);
       String responseJSON = "{\"codigo\":"+loteSaida.getCodigo()+","+
                "\"descricao\":\""+loteSaida.getDescricao()+"\",\"itens\":[";
        for(ItemSaida item: loteSaida.getItens()){
            responseJSON += "{\"codigo\":"+item.getCodigo()+",\"nomeProduto\":\""+item.getProduto().getNome()+"\""
                    + ",\"quantidade\":"+item.getQuantidade()+"}";
            if(loteSaida.getItens().indexOf(item)!=loteSaida.getItens().size()-1){
                responseJSON += ",";
            }
        }
        responseJSON += "]}";
        
        response.setContentType("text/plain");
        
        try(PrintWriter out = response.getWriter()){
            out.println(responseJSON);
        }
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
        
        HttpSession session = request.getSession();
        
        LoteSaida lS = (LoteSaida)session.getAttribute("loteSaida");
        
        //verificação de estoque
        for(ItemSaida i: lS.getItens()){
            
            if(i.getQuantidade()>10){
                session.setAttribute("msglotesaida", "Quantidade do produto "+i.getProduto().getNome()+" insuficiente no estoque!");
                
                response.sendError(500);
                
                return;
            }
        }
        
        
        
        Estoque estoque = RepositorioEstoque.getCurrentInstance().read();
        
        //fazer adição no lote do estoque
        for (ItemSaida i: lS.getItens()) {

            for (ItemEstoque ie : estoque.getItens()) {
                if (i.getProduto().getCodigo() == ie.getProduto().getCodigo()) {
                    ie.adiciona(i.getQuantidade());
                    break;
                }
            }
        }
        
        RepositorioLoteSaida.getCurrentInstance().create(lS);
        
        session.removeAttribute("loteSaida");
        
        session.setAttribute("msglotesaida", "O lote de saída foi inserido com sucesso!");
        
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp); //To change body of generated methods, choose Tools | Templates.
        
        // 22 8:44 precisa tratar requisisão put com "-" que pode ser enviada por fora do sistema
        
        
        String operacao = req.getParameter("operacao");
       
        int codigo = Integer.parseInt(req.getParameter("codigo"));

        HttpSession session = req.getSession();
        
        LoteSaida lS = (LoteSaida)session.getAttribute("loteSaida");
        
        if(lS == null){
            lS = new LoteSaida();
        
            session.setAttribute("loteSaida", lS);
        }
        
        if (operacao.equals("mais")) {

            boolean controle = false;
            for (ItemSaida i : lS.getItens()) {
                if (i.getProduto().getCodigo() == codigo) {
                    i.setQuantidade(i.getQuantidade() + 1);
                    controle = true;
                    session.setAttribute("msglotesaida", "O produto foi incrementado no lote");
                    break;
                }
            }

            if (!controle) {
                ItemSaida item = new ItemSaida();

                Produto p = RepositorioProdutos.getCurrentInstance().read(codigo);

                item.setProduto(p);
                item.setCodigo((int) (Math.random() * 10000));
                item.setQuantidade(1);
              

                lS.addItem(item);

                session.setAttribute("msglotesaida", "O produto " + p.getNome() + " foi inserido no lote");
            }
        } else if (operacao.equals("menos")) {

            for (ItemSaida i : lS.getItens()) {
                if (i.getProduto().getCodigo() == codigo) {

                    if (i.getQuantidade() == 1){
                        lS.getItens().remove(i);
                        if(lS.getItens().size() == 0){
                            session.removeAttribute("loteSaida");
                        }
                        session.setAttribute("msglotesaida", "O produto " + i.getProduto().getNome() + " foi REMOVIDO do lote");
                        break;
                    }

                    i.setQuantidade(i.getQuantidade() - 1);
                    break;
                }
            }
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
