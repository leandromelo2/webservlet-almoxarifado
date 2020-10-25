/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.controller.tags;

import br.recife.edu.ifpe.model.classes.LoteEntrada;
import br.recife.edu.ifpe.model.repositorios.RepositorioLoteEntrada;
import java.io.IOException;
import java.util.List;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author melo
 */
public class CarregaLoteEntradaTag extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {
        super.doTag(); //To change body of generated methods, choose Tools | Templates.

        List<LoteEntrada> lotes = RepositorioLoteEntrada.getCurrentInstance().readAll();
        
        getJspContext().setAttribute("lotesEntradaInseridos", lotes, PageContext.PAGE_SCOPE); //lotes inseridos no contexto da pagina

    }

}


   
