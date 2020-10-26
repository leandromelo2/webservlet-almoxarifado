/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.recife.edu.ifpe.controller.tags;

import br.recife.edu.ifpe.model.classes.LoteEntrada;
import br.recife.edu.ifpe.model.classes.LoteSaida;
import br.recife.edu.ifpe.model.repositorios.RepositorioLoteSaida;
import java.io.IOException;
import java.util.List;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author melo
 */
public class CarregaLoteSaida extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {
        super.doTag(); //To change body of generated methods, choose Tools | Templates.

        List<LoteSaida> lotes = RepositorioLoteSaida.getCurrentInstance().readAll();
        
        getJspContext().setAttribute("lotesSaidaInseridos", lotes, PageContext.PAGE_SCOPE);
            
           
    }

}



