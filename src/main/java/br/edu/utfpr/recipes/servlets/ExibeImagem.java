/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.utfpr.recipes.servlets;

import br.edu.utfpr.recipes.dao.DaoReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import br.edu.utfpr.recipes.util.ImgUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author josimar
 */
public class ExibeImagem extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("receita_id");
        String tipo = request.getParameter("tipo");
        if (null != id) {
            DaoReceita dr = new DaoReceita();
            Receita receita = dr.findById(Integer.parseInt(id));
            ImgUtil imgUtil = new ImgUtil();
            if ("mini".equals(tipo)) {
                if (receita.getImagemMini() != null) {
                    imgUtil.exibeImagemByte(response.getOutputStream(), receita.getImagemMini());
                } else {
                    response.sendRedirect("img/semimagem.jpg");
                }
            } else {
                if (receita.getImagem() != null) {
                    imgUtil.exibeImagemByte(response.getOutputStream(), receita.getImagem());
                }else {
                    response.sendRedirect("img/semimagem.jpg");
                }
            }

        }
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
