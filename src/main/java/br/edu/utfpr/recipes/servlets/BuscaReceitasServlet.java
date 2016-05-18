package br.edu.utfpr.recipes.servlets;

import br.edu.utfpr.recipes.dao.DaoReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import br.edu.utfpr.recipes.entidade.TagReceita;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author xaaaandao
 */
public class BuscaReceitasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String pesquisa = request.getParameter("pesquisa");
        String categoria = request.getParameter("categoria");
        String dificuldade = request.getParameter("dificuldade");
        boolean somenteIngredienteEspecifico = request.getParameter("somente_ingrediente").equals("Sim");
        String[] tags = request.getParameterValues("tag");
        List<String> listaTags = new ArrayList<>();
        if (tags != null) {
            listaTags.addAll(Arrays.asList(tags));
        }
        if (!pesquisa.isEmpty()) {
            DaoReceita daoReceita = new DaoReceita();
            String[] ingredientes = pesquisa.split(",");
            List listaIngredientes = new ArrayList<>();
            listaIngredientes.addAll(Arrays.asList(ingredientes));
            List receitas;
            if (somenteIngredienteEspecifico) {
                receitas = daoReceita.buscaReceitaPorIngredientesEspecificos(listaIngredientes);
            } else {
                receitas = daoReceita.buscaReceitaPorIngredientes(listaIngredientes);
            }
            filtraReceitas(receitas, categoria, dificuldade, listaTags);
            if (receitas.isEmpty()) {
                request.setAttribute("filtro", pesquisa);
                request.setAttribute("vazia", "Não há nenhum resultado para sua pequisa");
                request.getRequestDispatcher("ConsultarReceitas.jsp").forward(request, response);
            } else {
                request.setAttribute("receitas", receitas);
                request.getRequestDispatcher("ConsultarReceitas.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("nula", "Por Favor, Informe ao menos um ingrediente!");
            request.getRequestDispatcher("ConsultarReceitas.jsp").forward(request, response);
        }

    }

    private void filtraReceitas(List<Receita> receitas, String categoria, String dificuldade, List<String> utensilios) {
        List<Receita> receitaCategoria = new LinkedList<>();
        List<Receita> receitasDificuldade = new LinkedList<>();
        List<Receita> receitasUtensilio = new LinkedList<>();
        for (Receita receita : receitas) {
            if (receita.getCategoria().equals(categoria)) {
                receitaCategoria.add(receita);
            }
            if (receita.getDificuldade().equals(dificuldade)) {
                receitasDificuldade.add(receita);
            }
            if (!utensilios.isEmpty()) {
                List<String> utensiliosReceita = new LinkedList<>();
                for (TagReceita tag : receita.getTagReceitaList()) {
                    utensiliosReceita.add(tag.getTag().getNome());
                }
                if (!utensiliosReceita.isEmpty()) {
                    if (utensiliosReceita.containsAll(utensilios)) {
                        receitasUtensilio.add(receita);
                    }
                }
            }
        }

        if (!categoria.equals("Nenhum")) {
            receitas.retainAll(receitaCategoria);
        }
        if (!dificuldade.equals("Nenhuma")) {
            receitas.retainAll(receitasDificuldade);
        }
        if (!utensilios.isEmpty()) {
            receitas.retainAll(receitasUtensilio);
        }
    }

}
