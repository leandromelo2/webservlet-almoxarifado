package br.recife.edu.ifpe.controller.servlets;

import br.recife.edu.ifpe.model.classes.ItemEstoque;
import br.recife.edu.ifpe.model.classes.Produto;
import br.recife.edu.ifpe.model.repositorios.RepositorioEstoque;
import br.recife.edu.ifpe.model.repositorios.RepositorioProdutos;
import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Leandro Melo
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
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String atualizar = request.getParameter("atualizar");
        String deletar = request.getParameter("deletar");
        String codAux = request.getParameter("codigo");

        if (deletar != null) {
            int codigo = Integer.parseInt(codAux);

            Produto p = RepositorioProdutos.getCurrentInstance().read(codigo);

            RepositorioProdutos.getCurrentInstance().delete(p);

            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet ProdutoServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Produto " + p.getNome() + " deletado com sucesso.</h1>");
                out.println("<a href=\"index.html\">home</a></br>");
                out.println("<a href=\"ProdutoServlet\">Voltar para lista de produtos</a> ");
                out.println("</body>");
                out.println("</html>");
            }

        }

        if (atualizar != null) {

            int codigo = Integer.parseInt(codAux);
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
//                out.println("<th><input type=\"text\" name=\"codigo\" disabled/></th>");
                out.println("<a href=\"index.html\">home<a/> <br/>");
                out.println("<a href=\"ProdutoServlet\">Lista de produtos</a> ");
                out.println("<br/>");
                out.println("<br/>");
                out.println("        <form method=\"post\" action= \"ProdutoServlet\">\n"
                        + "            <table>\n"
                        + "                <tr>               \n"
                        + "                    <th>Codigo:</th> \n"
                        + "                    <th><input type=\"hidden\" name=\"codigo\" value=\"" + p.getCodigo() + "\"/></th>                          \n"
                        + "                </tr>\n"
                        + "                <tr> \n"
                        + "                    <th> Nome:</th>\n"
                        + "                    <th> <input type=\"text\" name=\"nome\" value=\"" + p.getNome() + "\"/></th>                    \n"
                        + "                </tr>\n"
                        + "                <tr>\n"
                        + "                    <th> Marca:</th>\n"
                        + "                    <th><input type=\"text\" name=\"marca\"value=\"" + p.getMarca() + "\"/></th>\n"
                        + "                </tr>\n"
                        + "                <tr>\n"
                        + "                    <th>Categoria:</th>\n"
                        + "                    <th><input type=\"text\" name=\"categoria\"value=\"" + p.getCategoria() + "\"/></th>                    \n"
                        + "                </tr>\n"
                        + "                <tr>\n"
                        + "                    <th>Descrição:</th>\n"
                        + "                    <th><textarea name=\"descricao\">" + p.getDescricao() + "</textarea></th>\n"
                        + "                </tr>\n"
                        + "                  <tr>\n"
                        + "                    <th></th>\n"
                        + "                    <th><input type='hidden'name='atualizar' value='1'</th>\n"
                        + "                </tr>\n"
                        + "                <tr>\n"
                        + "                    <th><input type=\"submit\" value=\"atualizar\"/></th>\n"
                        + "                </tr>               \n"
                        + "            </table>\n"
                        + "        </form>");

                out.println("</body>");
                out.println("</html>");

            }

        }

        if (codAux == null && atualizar == null && deletar == null) {

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
                out.println("<tr><th>Código</th><th>Nome</th><th>Marca</th><th>Categoria</th><th>Operações</th></tr>");
                for (Produto p : produtos) {
                    out.println("<tr>");
                    out.println("<td>" + p.getCodigo() + "</td>");
                    out.println("<td>" + p.getNome() + "</td>");
                    out.println("<td>" + p.getMarca() + "</td>");
                    out.println("<td>" + p.getCategoria() + "</td>");
                    out.println("<td><a href=\"ProdutoServlet?codigo=" + p.getCodigo() + "\">Visualizar </a>"
                            + "<a href='ProdutoServlet?codigo=" + p.getCodigo() + "&atualizar=1'> atualizar</a>"
                            + "<a href='ProdutoServlet?codigo=" + p.getCodigo() + "&deletar=1'> deletar</a></td>");
                    out.println("</tr>");

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
                out.println("<a href=\"ProdutoServlet\" id=\"link\"> Voltar <a/> ");
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
        String atualizar = request.getParameter("atualizar");
//        request.getParameterValues("")[];

        Produto p = new Produto();

        p.setCodigo(codigo);
        p.setNome(nome);
        p.setMarca(marca);
        p.setCategoria(categoria);
        p.setDescricao(descricao);

        if (atualizar != null) {
            RepositorioProdutos.getCurrentInstance().update(p);

        } else {
            RepositorioProdutos.getCurrentInstance().create(p);

            ItemEstoque item = new ItemEstoque();
            item.setProduto(p);
            item.setQuantidade(0);
            item.setCodigo(p.getCodigo());

            RepositorioEstoque.getCurrentInstance().read().addItem(item);
        }

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProdutoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            if (atualizar == null) {
                out.println("<h1>Produto " + p.getNome() + " cadastrado com sucesso.</h1>");
            } else {
                out.println("<h1>Produto " + p.getNome() + " atualizado com sucesso.</h1>");
            }
//            out.println("<h1>Categoria " + p.getCategoria() + ".</h1>");
            out.println("<a href=\"index.html\">home</a>");
            out.println("</body>");
            out.println("</html>");
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
