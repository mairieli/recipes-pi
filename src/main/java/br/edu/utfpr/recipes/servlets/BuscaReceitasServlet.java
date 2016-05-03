package br.edu.utfpr.recipes.servlets;

import br.edu.utfpr.recipes.dao.DaoReceita;
import java.io.IOException;
import java.io.PrintWriter;
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
//        System.out.println("aaaaa"+request.getParameter("pesquisa"));
//          response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet NovoServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet NovoServlet at " + request.getParameter("pesquisa").isEmpty() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
        String pesquisa = request.getParameter("pesquisa");
        if (!pesquisa.isEmpty()) {
            DaoReceita dr = new DaoReceita();
            String[] ingredientes = pesquisa.split(",");
            List l = new ArrayList<>();
            l.addAll(Arrays.asList(ingredientes));
            List receitas = dr.buscaReceitaPorIngredientesEspecificos(l);
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
