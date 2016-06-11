package br.edu.utfpr.recipes.controller;

import br.edu.utfpr.recipes.dao.DaoReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Leonardo
 */
@WebServlet(name = "ExcluirReceitaServlet", urlPatterns = {"/ExcluirReceitaServlet"})
public class ExcluirReceitaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer receita_id = Integer.parseInt(request.getParameter("receita_id"));
        DaoReceita dao_receita = new DaoReceita();
        Receita receita = dao_receita.findById(receita_id);
        dao_receita.delete(receita);
        request.getRequestDispatcher("ConsultarReceitas.jsp").forward(request, response);
    }
}
