package br.recife.edu.ifpe.controller.servlets.produto;

import br.recife.edu.ifpe.model.classes.ItemEstoque;
import br.recife.edu.ifpe.model.classes.Produto;
import br.recife.edu.ifpe.model.repositorios.RepositorioEstoque;
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
 * @author leandro melo
 *
 * atalho netbeans Mostrar só editor > Ctrl + Shift + Enter
 *
 *
 */
@WebServlet(name = "ProdutoServletNew", urlPatterns = {"/ProdutoServletNew"})
public class ProdutoServletNew extends HttpServlet {

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
        
//       String redirect = request.getParameter("redirect"); //usado na implementação da função visualizar. linha desnecessario pq a leitura do redirect será feito na página de visualização e na de cadastro que fará alteração - 14 - alterando produto com JSP
        
        Produto p = RepositorioProdutos.getCurrentInstance().read(codigo); 
        
        request.setAttribute("produto", p); // sendRedirect manda uma nova requisição, e é perdido as informações do request e response 
        
//        forward - pega o estado da requisição e envia para outra página
        getServletContext().getRequestDispatcher("/produtos.jsp").forward(request,response);  
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

        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String nome = request.getParameter("nome");
        String marca = request.getParameter("marca");
        String categoria = request.getParameter("categoria");
        String descricao = request.getParameter("descricao");
        
        String a = request.getParameter("atualizar");

        Produto p = new Produto();

        p.setCodigo(codigo);
        p.setNome(nome);
        p.setMarca(marca);
        p.setCategoria(categoria);
        p.setDescricao(descricao);

        HttpSession session = request.getSession(); // armazem atributos //session ( a sessão é criada na primeira vez que a chama. se a sessão não existir cria uma e retorna, caso exista, ele retorna a que tem.
        
        if (a == null) {
            RepositorioProdutos.getCurrentInstance().create(p);

            ItemEstoque item = new ItemEstoque();
            item.setProduto(p);
            item.setQuantidade(0);
            item.setCodigo(p.getCodigo());

            RepositorioEstoque.getCurrentInstance().read().addItem(item);

           
            session.setAttribute("msg", "Produto " + p.getNome() + " foi cadastrado com sucesso!");  //Mensagem de produto cadastrado com sucesso usando sessão

        } else {
            
            RepositorioProdutos.getCurrentInstance().update(p);
            session.setAttribute("msg", "Produto " + p.getNome() + " foi atualizado com sucesso!");

        }
        response.sendRedirect("produtos.jsp"); //redireciona o fluxo da página para o JSP

    }

    @Override
     protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doDelete(request, response); //To change body of generated methods, choose Tools | Templates.
        
        int cod = Integer.parseInt(request.getParameter("codigo"));
        
        Produto p = RepositorioProdutos.getCurrentInstance().read(cod);
        
        RepositorioProdutos.getCurrentInstance().delete(p);
        
        HttpSession session = request.getSession();
        
        session.setAttribute("msg", "O produto "+p.getNome()+" foi deletado!");
        
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
