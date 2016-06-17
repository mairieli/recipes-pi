package br.edu.utfpr.recipes.controller;

import br.edu.utfpr.recipes.dao.DaoIngrediente;
import br.edu.utfpr.recipes.dao.DaoItemReceita;
import br.edu.utfpr.recipes.dao.DaoReceita;
import br.edu.utfpr.recipes.entidade.Ingrediente;
import br.edu.utfpr.recipes.entidade.ItemReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import br.edu.utfpr.recipes.mail.CommonsMail;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AprovacaoIngredienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("ingrediente_id");
            DaoIngrediente daoIngrediente = new DaoIngrediente();
            Ingrediente ingrediente = daoIngrediente.findById(Integer.parseInt(id));
            ingrediente.setStatus(true);
            daoIngrediente.save(ingrediente);
            //Aprova receita devido a aprovação do ingrediente
            DaoReceita daoReceita = new DaoReceita();
            List<Receita> receitas = daoReceita.buscaReceitaPendentePorIngrediente(ingrediente.getNome());
            verificaReceitaParaAprovacao(receitas);
            for (Receita receita : receitas) {
                receita.setStatus(true);
                daoReceita.save(receita);
                CommonsMail email = new CommonsMail();
                email.enviaEmai(receita.getUsuario(), receita);
            }
            request.getSession().setAttribute("message", "Ingrediente aprovado com sucesso!");
            response.sendRedirect("AprovacaoIngrediente.jsp");

        } catch (Exception e) {
            request.getSession().setAttribute("message_error", "Desculpe, ocorreu um erro! " + e);
            response.sendRedirect("AprovacaoIngrediente.jsp");

        }
    }

    /**
     * Método que verifica as receitas que podem ser aprovadas devido a 
     * aprovação do ingrediente.
     *
     * @param receitas  para serem verificadas
     */
    private void verificaReceitaParaAprovacao(List<Receita> receitas) {
        List<Receita> receitaNaoAprovar = new LinkedList<>();
        DaoItemReceita daoItemReceita = new DaoItemReceita();
        sairLaco:
        for (Receita receita : receitas) {
            for (ItemReceita item : daoItemReceita.buscaPorReceita(receita)) {
                if (!item.getIngrediente().getStatus()) {
                    receitaNaoAprovar.add(receita);
                    break sairLaco;
                }
            }
        }
        receitas.removeAll(receitaNaoAprovar);
    }

}
