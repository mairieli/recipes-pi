package br.edu.utfpr.recipes.controller;

import br.edu.utfpr.recipes.dao.DaoReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import br.edu.utfpr.recipes.util.ImgUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExibeImagem extends HttpServlet {

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
