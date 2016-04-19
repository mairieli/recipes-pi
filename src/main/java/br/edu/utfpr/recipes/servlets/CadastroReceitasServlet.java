package br.edu.utfpr.recipes.servlets;

import br.edu.utfpr.recipes.dao.DaoIngrediente;
import br.edu.utfpr.recipes.entidade.Ingrediente;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
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

        request.setCharacterEncoding("UTF-8");

        // Captura Quantidades. Unidade de Medidas e Ingredientes
        List<String> Quantidades = new LinkedList<>();
        List<String> Unidades = new LinkedList<>();
        List<String> Ingredientes = new LinkedList<>();
        Map<String, String[]> parametrosRecebidos = request.getParameterMap();
        for (Map.Entry<String, String[]> entrada : parametrosRecebidos.entrySet()) {
            String parametro = entrada.getKey();
            if (parametro.startsWith("quantidade")) {
                Integer i = Integer.parseInt(parametro.substring(parametro.length() - 1));
                Quantidades.add(request.getParameter("quantidade" + i));
                Unidades.add(request.getParameter("unidade_medida" + i));
                Ingredientes.add(request.getParameter("ingrediente" + i));
            }
        }
        // Fim da captura de Quantidades. Unidade de Medidas e Ingredientes.

        //mostra qual tags foram marcadas
        String[] tag = request.getParameterValues("tag");
        ArrayList<String> listaTag = new ArrayList<String>();
        listaTag.addAll(Arrays.asList(tag));
        System.out.println(Arrays.toString(listaTag.toArray()));

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
