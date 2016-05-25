package br.edu.utfpr.recipes.servlets;

import br.edu.utfpr.recipes.dao.DaoReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bruno
 */
@WebServlet(name = "VisualizacaoReceitaServlet", urlPatterns = {"/VisualizacaoReceitaServlet"})
public class VisualizacaoReceitasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
        int receitaiD = Integer.parseInt(request.getParameter("raceita_id"));
        double rating = Double.parseDouble(request.getParameter("rating_hide"));
        DaoReceita  daoR = new DaoReceita();
        Receita receita = daoR.findById(receitaiD);
        receita.qualifica(rating);
        daoR.save(receita);
        response.getWriter().write("Obrigado por qualificar com a nota "+rating);
        } catch (Exception e) {
        response.getWriter().write("Desculpe, Ocorreu um erro ao avaliar.. "+e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

    }

}
