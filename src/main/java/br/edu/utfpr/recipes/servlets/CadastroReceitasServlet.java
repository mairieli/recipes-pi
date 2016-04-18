package br.edu.utfpr.recipes.servlets;

import br.edu.utfpr.recipes.dao.DaoIngrediente;
import br.edu.utfpr.recipes.entidade.Ingrediente;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mairieliw
 */
public class CadastroReceitasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //exemplo de como usar o método que recupera todos os ingredientes da receita
        //String[] nomes = {"Cebolinha", "Calabresa", "páprica verde"};
        //List<Ingrediente> listaIngrediente = new LinkedList<>();
        //recuperaIngredientesReceita(nomes, listaIngrediente);

        response.sendRedirect("CadastroReceitas.jsp");
    }

    /**
     * Método que recupera os ingredientes do banco de dados, e salva como
     * pendente os que ainda não estavam salvos.
     *
     * @param nomes nomes dos ingredientes informados pelo usuário
     * @param ingredientes lista, que ao final da execução do método, irá conter
     * os ingredientes do banco de dados
     * @return status da receita
     */
    private boolean recuperaIngredientesReceita(String[] nomes, List<Ingrediente> ingredientes) {
        DaoIngrediente daoIngrediente = new DaoIngrediente();
        boolean statusIngrediente = true;
        for (String nome : nomes) {
            Ingrediente ingrediente = daoIngrediente.buscarPorNome(nome);
            if (ingrediente == null) {
                ingrediente = new Ingrediente();
                statusIngrediente = false;
                ingrediente.setNome(nome);
                ingrediente.setStatus(statusIngrediente);
                daoIngrediente.save(ingrediente);
                ingrediente = daoIngrediente.buscarPorNome(nome);
            }
            ingredientes.add(ingrediente);
        }
        return statusIngrediente;
    }
}
