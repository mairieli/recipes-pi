package br.edu.utfpr.recipes.servlets;

import br.edu.utfpr.recipes.dao.DaoIngrediente;
import br.edu.utfpr.recipes.dao.DaoItemReceita;
import br.edu.utfpr.recipes.dao.DaoReceita;
import br.edu.utfpr.recipes.entidade.Ingrediente;
import br.edu.utfpr.recipes.entidade.ItemReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import java.io.IOException;
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

        String titulo = request.getParameter("titulo");
        String tempoPreparo = request.getParameter("tempo_preparo");
        String rendimento = request.getParameter("rendimento");
        String categoria = request.getParameter("categoria");
        String dificuldade = request.getParameter("dificuldade");
        String modoPreparo = request.getParameter("modo_preparo");
        String[] tag = request.getParameterValues("tag");

        // Captura Quantidades. Unidade de Medidas e Ingredientes
        List<String> quantidades = new LinkedList<>();
        List<String> unidades = new LinkedList<>();
        List<String> ingredientes = new LinkedList<>();
        Map<String, String[]> parametrosRecebidos = request.getParameterMap();
        for (Map.Entry<String, String[]> entrada : parametrosRecebidos.entrySet()) {
            String parametro = entrada.getKey();
            if (parametro.startsWith("quantidade")) {
                Integer i = Integer.parseInt(parametro.substring(parametro.length() - 1));
                quantidades.add(request.getParameter("quantidade" + i));
                unidades.add(request.getParameter("unidade_medida" + i));
                ingredientes.add(request.getParameter("ingrediente" + i));
            }
        }
        // Fim da captura de Quantidades. Unidade de Medidas e Ingredientes.

        List<Ingrediente> listaIngrediente = new LinkedList<>();
        boolean statusReceita = recuperaIngredientesReceita(ingredientes, listaIngrediente);

        DaoReceita daoReceita = new DaoReceita();
        Receita receita = new Receita();
        receita.setCategoria(categoria);
        receita.setDificuldade(dificuldade);
        receita.setModoPreparo(modoPreparo);
        receita.setNome(titulo);
        receita.setRendimento(Integer.parseInt(rendimento));
        receita.setStatus(statusReceita);
        receita.setTempoPreparo(Integer.parseInt(tempoPreparo));
        daoReceita.save(receita);

        DaoItemReceita daoItemReceita = new DaoItemReceita();
        for (int i = 0; i < listaIngrediente.size(); i++) {
            ItemReceita item = new ItemReceita();
            item.setReceita(receita);
            item.setIngrediente(listaIngrediente.get(i));
            item.setQuantidade(Integer.parseInt(quantidades.get(i)));
            item.setUnidadeMedida(unidades.get(i));
            daoItemReceita.save(item);
        }

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
    private boolean recuperaIngredientesReceita(List<String> nomes, List<Ingrediente> ingredientes) {
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
