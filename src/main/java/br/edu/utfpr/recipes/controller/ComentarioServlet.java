package br.edu.utfpr.recipes.controller;

import br.edu.utfpr.recipes.dao.DaoComentario;
import br.edu.utfpr.recipes.dao.DaoReceita;
import br.edu.utfpr.recipes.entidade.ComentarioReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import br.edu.utfpr.recipes.entidade.Usuario;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ComentarioServlet", urlPatterns = {"/ComentarioServlet"})
public class ComentarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer idReceita = Integer.parseInt(request.getParameter("receita_id"));
        Integer idComentario = Integer.parseInt(request.getParameter("comentario_id"));
        DaoComentario daoComentario = new DaoComentario();
        ComentarioReceita comentario = daoComentario.obterParaExcluir(idComentario);
        daoComentario.delete(comentario);
        DaoReceita daoReceita = new DaoReceita();
        Receita receita = daoReceita.findById(idReceita);
        response.sendRedirect("VisualizacaoReceita.jsp?receita_id=" + receita.getId() + "#comentario");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String textoComentario = request.getParameter("comentario").trim();
        Integer idReceita = Integer.parseInt(request.getParameter("receita_id"));

        Calendar dataAtual = Calendar.getInstance();
        dataAtual.setTime(new Date());
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
        DaoReceita daoReceita = new DaoReceita();
        Receita receita = daoReceita.findById(idReceita);

        ComentarioReceita comentario = new ComentarioReceita();
        comentario.setComentario(textoComentario);
        comentario.setDataComentario(dataAtual);
        comentario.setReceita(receita);
        comentario.setUsuario(usuario);

        DaoComentario daoComentario = new DaoComentario();
        daoComentario.save(comentario);

        response.sendRedirect("VisualizacaoReceita.jsp?receita_id=" + receita.getId() + "#comentario");
    }

}
