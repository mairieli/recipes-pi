package br.edu.utfpr.recipes.servlets;

import br.edu.utfpr.recipes.dao.DaoReceita;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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
        if (!pesquisa.isEmpty()) {
            DaoReceita daoReceita = new DaoReceita();
            String[] ingredientes = pesquisa.split(",");
            List listaIngredientes = new ArrayList<>();
            listaIngredientes.addAll(Arrays.asList(ingredientes));
            List receitas = daoReceita.buscaReceitaPorIngredientesEspecificos(listaIngredientes);
            if (receitas.isEmpty()) {
                request.setAttribute("filtro",pesquisa);
                request.setAttribute("vazia", "Sua pesquisa nào retornou nenhum resultado, por favor refaça o filtro!");
                request.getRequestDispatcher("ConsultarReceitas.jsp").forward(request, response);
            } else {
                request.setAttribute("receitas", receitas);
                request.getRequestDispatcher("ConsultarReceitas.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("nula", "por favor, informe ao menos um ingrediente!");
            request.getRequestDispatcher("ConsultarReceitas.jsp").forward(request, response);

        }

    }

}
