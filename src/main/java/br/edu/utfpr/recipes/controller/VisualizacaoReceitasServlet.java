package br.edu.utfpr.recipes.controller;

import br.edu.utfpr.recipes.dao.DaoReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import br.edu.utfpr.recipes.entidade.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "VisualizacaoReceitaServlet", urlPatterns = {"/VisualizacaoReceitaServlet"})
public class VisualizacaoReceitasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        try {
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
            if (usuario == null) {
                response.getWriter().write("<span style=\"color:orange; font-size:12pt\"><b>Desculpe, sua sessão expirou, faça  <a href=\"login.jsp\" class=\"text-center new-account\">Login</a>  novamente! </b></span>");
            } else {
                int receitaiD = Integer.parseInt(request.getParameter("raceita_id"));
                double rating = Double.parseDouble(request.getParameter("rating_hide"));
                Cookie[] cookies = request.getCookies();
                String cookieName = "rating-recipes_" + receitaiD + "-" + usuario.getId();

                for (Cookie cooky : cookies) {
                    if (cooky.getName().equals(cookieName)) {
                        response.getWriter().write("<span style=\"color:red\"><b>Desculpe, mas voce já qualificou essa receita anteriormente com a nota " + cooky.getValue() + "!</b></span>");
                        return;
                    }
                }
                DaoReceita daoR = new DaoReceita();
                Receita receita = daoR.findById(receitaiD);
                receita.qualifica(rating);
                daoR.save(receita);
                Cookie cookie = new Cookie(cookieName, rating + "");
                //torna o cookie valido por 6 meses
                cookie.setMaxAge(15552000);
                response.addCookie(cookie);
                response.getWriter().write("Obrigado por qualificar com a nota " + rating);
            }
        } catch (Exception exception) {
            response.getWriter().write("<span style=\"color:orange\"><b>Desculpe, Ocorreu um erro ao qualificar.. " + exception+"</span");
        }

    }

}
