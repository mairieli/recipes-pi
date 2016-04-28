package br.edu.utfpr.recipes.servlets;

import br.edu.utfpr.recipes.dao.DaoIngrediente;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mairieliw
 */
public class BuscaIngredienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        try {
            String ternoBusca = request.getParameter("term");

            DaoIngrediente dataDao = new DaoIngrediente();
            ArrayList<String> listaNomesIngrediente = dataDao.buscarPorInicioNome(ternoBusca);

            String listaNomesJson = new Gson().toJson(listaNomesIngrediente);
            response.getWriter().write(listaNomesJson);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

}
