package br.edu.utfpr.recipes.controller;

import br.edu.utfpr.recipes.dao.DaoComentario;
import br.edu.utfpr.recipes.dao.DaoReceita;
import br.edu.utfpr.recipes.entidade.ComentarioReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ExcluirReceitaServlet", urlPatterns = {"/ExcluirReceitaServlet"})
public class ExcluirReceitaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer receitaId = Integer.parseInt(request.getParameter("receita_id"));
        DaoComentario daoComentario = new DaoComentario();
        List<ComentarioReceita> comentarios = daoComentario.buscaComentarioDaReceita(receitaId);
        for(ComentarioReceita comentario : comentarios){
            daoComentario.delete(comentario);
        }
        DaoReceita daoReceita = new DaoReceita();
        Receita receita = daoReceita.obterParaExcluir(receitaId);
        daoReceita.delete(receita);
        request.getSession().setAttribute("message", "Receita Excluida!");
        response.sendRedirect("index.jsp");
    }
}
