/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.utfpr.recipes.controller;

import br.edu.utfpr.recipes.dao.DaoIngrediente;
import br.edu.utfpr.recipes.entidade.Ingrediente;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author josimar
 */
public class IngredienteSugeridoServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        //doGet
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Ingrediente ingrediente = new Ingrediente();
        ingrediente.setStatus(Boolean.FALSE);
        String ingredienteSugerido = request.getParameter("ingrediente").trim();
        if ("".equals(ingredienteSugerido)) {
            request.getSession().setAttribute("message_error", "Erro: nome inválido!");
            response.sendRedirect("index.jsp");

        } else {
            DaoIngrediente daoIn = new DaoIngrediente();
            if (daoIn.buscarPorNome(ingredienteSugerido) == null) {
                ingrediente.setNome(ingredienteSugerido);
                daoIn.save(ingrediente);
                request.getSession().setAttribute("message", "Ingrediente " + ingredienteSugerido + " enviado para aprovação, obrigado pela sugestão!");
                response.sendRedirect("index.jsp");
            } else {
                request.getSession().setAttribute("message_error", "Desculpe, mas esse ingrediente ja se encontra cadastrado!");
                response.sendRedirect("index.jsp");
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
