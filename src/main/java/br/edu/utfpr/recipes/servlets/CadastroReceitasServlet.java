package br.edu.utfpr.recipes.servlets;

import br.edu.utfpr.recipes.entidade.Ingrediente;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mairieliw
 */
public class CadastroReceitasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //pega os parametros do request
        String titulo = request.getParameter("titulo");
        System.out.println(titulo);
        //Esta pegando 3 ingredientes, mas é temporário 
        String ingrediente1 = request.getParameter("ingrediente1");
        String unidadeMedida1 = request.getParameter("unidade_medida1");
        String quantidade1 = request.getParameter("quantidade1");
        String ingrediente2 = request.getParameter("ingrediente2");
        String unidadeMedida2 = request.getParameter("unidade_medida2");
        String quantidade2 = request.getParameter("quantidade2");
        String ingrediente3 = request.getParameter("ingrediente3");
        String unidadeMedida3 = request.getParameter("unidade_medida3");
        String quantidade3 = request.getParameter("quantidade3");

        String tempoPreparo = request.getParameter("tempo_preparo");
        String rendimento = request.getParameter("rendimento");
        String categoria = request.getParameter("categoria");
        String dificuldade = request.getParameter("dificuldade");
        String modoPreparo = request.getParameter("modo_preparo");

        //monta um objeto ingrediente
        Ingrediente i = new Ingrediente();
        i.setNome(ingrediente1);
        i.setStatus(true);

        //monta um objeto receita (instanciar entidades abaixo)   
        
        //salva a recceita (utilizar o DAO abaixo)
        
        //redireciona para a tela de cadastro de receitas
        response.sendRedirect("CadastroReceitas.jsp");
    }

}
