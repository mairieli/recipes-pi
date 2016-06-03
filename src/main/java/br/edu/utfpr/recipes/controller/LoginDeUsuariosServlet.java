package br.edu.utfpr.recipes.controller;

import br.edu.utfpr.recipes.dao.DaoUsuario;
import br.edu.utfpr.recipes.entidade.Usuario;
import br.edu.utfpr.recipes.util.Criptografia;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginDeUsuariosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("usuarioLogado");
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email").trim();
        String senha = request.getParameter("senha").trim();
        
        DaoUsuario daoUsuario = new DaoUsuario();
        Usuario usuario = daoUsuario.buscaUsuarioPorEmail(email);
        if (usuario == null) {
            request.setAttribute("message_error", "Erro: Este e-mail não consta no sistema");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            Criptografia criptografia = new Criptografia();
            if (usuario.getSenha().equals(criptografia.criptografar(senha))) {
                request.getSession().setAttribute("usuarioLogado", usuario);
                request.getSession().setAttribute("message", "Login Realizado com Sucesso!");
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("message_error", "Erro: Senha Inválida");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    }
}
